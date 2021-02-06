import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shades/constants.dart';
import 'dart:io';
import 'homepage.dart';

class ResultScreen extends StatelessWidget {

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

  var _result;
  String str;
  String _label ;
  String _confidence;
  File image;

  ResultScreen(this._result, this._confidence, this._label, this.str, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skin1,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width*0.80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(image.path)),
                        fit: BoxFit.contain,),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  gradient: LinearGradient(
                      colors: [skin2,skin3],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: skin3,
                      blurRadius: 6,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                ),
              ),

            SizedBox(
              height: 40.0,
            ),

            CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,
              radius: 120.0,
              lineWidth: 12.0,
              percent: _result[0]['confidence'] ,
              center: new Text('${_label}'),
              progressColor: skin2,
            ),
            SizedBox(
              height: 20.0,
            ),

            Container(
              height: 200,
              width: MediaQuery.of(context).size.width*0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                gradient: LinearGradient(
                    colors: [skin2,skin3],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: skin3,
                    blurRadius: 6,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    items[0].name
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
