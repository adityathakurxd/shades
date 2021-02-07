import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shades/constants.dart';
import 'dart:io';
import 'homepage.dart';
import 'package:shades/diseasecure.dart';

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
  String _label;
  DiseaseCure dc = DiseaseCure();

  String _confidence;
  File image;

  ResultScreen(
      this._result, this._confidence, this._label, this.str, this.image);

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
                height: 300,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(image.path)),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(color: Colors.black)),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  radius: 120.0,
                  lineWidth: 12.0,
                  percent: _result[0]['confidence'],
                  center: new Text(
                    '${_confidence}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: Colors.black,
                ),
                Text(
                  '${dc.getDiseaseName(_label)}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                gradient: LinearGradient(
                    colors: [skin1, skin2],
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Center(
                    child: Text(
                      items[dc.getDiseaseIndex(_label)].name,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
                    child: Text(
                      items[dc.getDiseaseIndex(_label)].description,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    child: Text('Consult a Doctor'),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
