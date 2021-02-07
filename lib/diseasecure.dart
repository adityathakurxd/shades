class DiseaseCure {
  String getDiseaseName(String _label){
    if(_label == 'akiec'){
      return "Bowen's disease";
    }
    else if (_label == 'bcc'){
      return 'Basal cell carcinoma';
    }
    else if (_label == 'df'){
      return 'Dermatofibroma';
    }
    else if (_label == 'mel'){
      return 'Melanoma';
    }
    else if (_label == 'nv'){
      return 'Melanocytic Nevi';
    }
    else if (_label == 'vasc'){
      return 'Vascular lesions';
    }
    else if (_label == 'bkl'){
      return 'Benig lesions';
    }

  }

  int getDiseaseIndex(String _label){
    if(_label == 'akiec'){
      return 0;
    }
    else if (_label == 'bcc'){
      return 1;
    }
    else if (_label == 'df'){
      return 2;
    }
    else if (_label == 'mel'){
      return 3;
    }
    else if (_label == 'nv'){
      return 4;
    }
    else if (_label == 'vasc'){
      return 5;
    }
    else if (_label == 'bkl'){
      return 6;
    }
  }
}