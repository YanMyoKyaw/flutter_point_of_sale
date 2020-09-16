import 'package:path/path.dart' as path;
import 'dart:io';
import 'dart:convert';

class AppUtil{

  static Future<String> getFileType(File _image)async{

    if(await _image.exists()){
      List<String> img = path.basename(_image.path).split(".");
      String type = '';
      switch(img[1]) {
        case 'png':
          type = 'data:image/png;base64,';
          break;
        case 'bmp':
          type = 'data:image/bmp;base64,';
          break;
        case 'jpg':
          type = 'data:image/jpg;base64,';
          break;
        case 'jpeg':
          type = 'data:image/jpeg;base64,';
          break;
        default:
          type = 'data:image/png;base64,';
      }
      return type;
    }else{
      return null;
    }
  }

  Future<String> getBase64(File _image) async{
    if(await _image.exists()){
      List<int> imageBytes = _image.readAsBytesSync();
      String base64 = base64Encode(imageBytes);
      return base64;
    }else{
      return null;
    }
  }

}