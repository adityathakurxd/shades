import 'package:flutter/material.dart';
import 'dart:io';

class ResultScreen extends StatelessWidget {

  var _result;
  String str;
  String _label ;
  String _confidence;
  File image;


  ResultScreen(this._result, this._confidence, this._label, this.str, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File(image.path)),
                      fit: BoxFit.contain
                  )
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(child: Text("Label: ${_label} \n Confidence: $_confidence")),
          ],
        ),
      ),
    );
  }
}
