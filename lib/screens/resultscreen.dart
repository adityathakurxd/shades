import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shades/constants.dart';
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

            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: _result[0]['confidence'] ,
              center: new Text('${_label}'),
              progressColor: skin2,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
