import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File pickedImage;
  bool isImageloaded = false;
  List _result;

  String _confidence=" ";
  String _label = "";
  String numbers ="";


  selectFromImagePicker () async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(image == null)return;
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

  loadModel () async{
    Tflite.close();
    var res = await Tflite.loadModel(model: "assets/models/shades.tflite",
            labels: "assets/models/labels.txt");
    print(res);
  }


  predictImage(File image) async {
    if(image == null)return;
    var res = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5
    );

    setState(() {
      _result = res;

      String str = _result[0]["label"];
      _label = str.substring(2);
      _confidence = _result != null? (_result[0]['confidence']*100.0).toString().substring(0,2) + "%": "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHADES"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.image
        ),
        tooltip: 'Pick image from gallery',
        onPressed: selectFromImagePicker,
      ),

      body:  Container(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            isImageloaded?Center(
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(pickedImage.path)),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ): Container(),
            SizedBox(
              height: 20.0,
            ),
            Center(child: Text("Label: ${_label} \n Confidence: $_confidence"))
          ],
        ),
      ),
    );
  }
}
