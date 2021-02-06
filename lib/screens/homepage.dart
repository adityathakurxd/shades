import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shades/screens/resultscreen.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          backgroundColor: Colors.cyanAccent,
          centerTitle: true,
          title: Text(
            "S H A D E S",
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.image),
          tooltip: 'Pick image from gallery',
          onPressed: selectFromImagePicker,
        ),

        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.redAccent,


            ),

            AnimatedContainer(
              transform: Matrix4.translationValues(x, y, 0)..scale(scaleFactor),
              duration: Duration(milliseconds: 250),

              color: Colors.white,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(isdraweropen? Icons.close : Icons.menu, size: 40.0,),
                      onPressed: (){
                        isdraweropen?setState(() {
                          x = 0;
                          y = 0;
                          scaleFactor =1;
                          isdraweropen = false;
                        }) :
                        setState(() {
                          x = 230;
                          y = 150;
                          scaleFactor =0.6;
                          isdraweropen = true;
                        });
                      },
                    ),
                  ),

                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            border: Border.all(color: Colors.black)),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 40.0,
                          ),
                          onPressed: selectFromImagePicker,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text('A list of possible infections!'),
                ],
              ),
            ),
          ],
        ));
  }
}
