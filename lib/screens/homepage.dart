import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:shades/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shades/screens/infoscreen.dart';
import 'package:shades/screens/resultscreen.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _borderRadius = 24;

  var items = [
    DiseaseInfo("Bowen's disease", Color(0xff6DC8F3), Color(0xff73A1F9),
        "Bowen's disease is a very early form of skin cancer that's easily treatable. The main sign is a red, scaly patch on the skin."),
    DiseaseInfo("Basal cell carcinoma", Color(0xffFFB157), Color(0xffFFA057),
        "Basal cell carcinoma (BCC) is the most common form of skin cancer and the most frequently occurring form of all cancers."),
    DiseaseInfo("Dermatofibromas", Color(0xffFF5B95), Color(0xffF8556D),
        "Dermatofibromas (DFs) are common benign cutaneous tumors. Of unknown etiology, DFs usually occur as solitary lesions on the extremities."),
    DiseaseInfo("Melanoma", Color(0xffD76EF5), Color(0xff8F7AFE),
        "Melanoma, the most serious type of skin cancer, develops in the cells (melanocytes) that produce melanin — the pigment that gives your skin its color."),
    DiseaseInfo("Melanocytic Nevi", Color(0xff42E695), Color(0xff3BB2B8),
        "A melanocytic nevus (also commonly known as a mole) is a type of melanocytic tumor that contains nevus cells."),
    DiseaseInfo("Vascular lesions", Color(0xffFFB157), Color(0xffFFA057),
        "Vascular lesions are relatively common abnormalities of the skin and underlying tissues, more commonly known as birthmarks."),
    DiseaseInfo(
        "Benign keratosis-like lesions",
        Color(0xffFF5B95),
        Color(0xffF8556D),
        "Seborrheic keratoses are noncancerous (benign) skin growths that some people develop as they age"),
  ];

  double x = 0;
  double y = 0;
  double scaleFactor = 1;
  bool isdraweropen = false;

  File pickedImage;
  bool isImageloaded = false;
  List _result;

  String _confidence = " ";
  String _label = "";
  String numbers = "";

  selectFromImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      pickedImage = File(image.path);
      isImageloaded = true;
    });
    predictImage(image);
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    Tflite.close();
    var res = await Tflite.loadModel(
        model: "assets/models/shades.tflite",
        labels: "assets/models/labels.txt");
    print(res);
  }

  predictImage(File image) async {
    if (image == null) return;
    var res = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    _result = res;
    String str = _result[0]["label"];
    _label = str.substring(2);
    _confidence = _result != null
        ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) + "%"
        : "";

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ResultScreen(_result, _confidence, _label, str, image)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: skin2,
          centerTitle: true,
          shadowColor: skin4,
          title: Text(
            "S H A D E S",
            style: TextStyle(
              shadows: [],
              fontSize: 25.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.image),
          backgroundColor: skin2,
          tooltip: 'Pick image from gallery',
          onPressed: selectFromImagePicker,
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(
                      0.8, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [skin1, skin2], // red to yellow
                  tileMode:
                      TileMode.clamp, // repeats the gradient over the canvas
                ),
              ),

              child: Center(
                child: Text(
                  "S\n\nH\n\nA\n\nD\n\nE\n\nS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              height: MediaQuery.of(context).size.height,
              transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
              duration: Duration(milliseconds: 250),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              isdraweropen ? Icons.close : Icons.menu,
                              size: 40.0,
                            ),
                            onPressed: () {
                              isdraweropen
                                  ? setState(() {
                                      x = 0;
                                      y = 0;
                                      scaleFactor = 1;
                                      isdraweropen = false;
                                    })
                                  : setState(() {
                                      x = 230;
                                      y = 150;
                                      scaleFactor = 0.6;
                                      isdraweropen = true;
                                    });
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.info_outline,
                              size: 40.0,
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScreen()));
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          height: 180.0,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: Colors.black)),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              size: 50.0,
                            ),
                            onPressed: selectFromImagePicker,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 2.0, 0.0,0.0),
                      child: Text(
                        'Having an issue?',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(21.0, 2.0, 0.0,0.0),
                      child: Text(
                        'Consult a skin specialist near you.',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/lady.jpg'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Sushma Paaji',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'PHD, Mhd',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Montserrat',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      onTap: (){

                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/man.jpg'),
                                  fit: BoxFit.fill
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Paaji Sushma',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'PHD, Mhd',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class DiseaseInfo {
  final String name;
  final String description;
  final Color startColor;
  final Color endColor;

  DiseaseInfo(this.name, this.startColor, this.endColor, this.description);
}
