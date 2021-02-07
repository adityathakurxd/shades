import 'package:flutter/material.dart';
import 'homepage.dart';

class InfoScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[0].startColor, items[0].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[0].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[0].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[0].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[1].startColor, items[1].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[1].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[1].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[1].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[2].startColor, items[2].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[2].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[2].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[2].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[3].startColor, items[3].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[3].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[3].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[3].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[4].startColor, items[4].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[4].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[4].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[4].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[5].startColor, items[5].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[5].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[5].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[5].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(_borderRadius)),
                    gradient: LinearGradient(
                        colors: [items[6].startColor, items[6].endColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: items[6].endColor,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[6].name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: Text(
                          items[6].description,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
