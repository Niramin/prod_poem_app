import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


abstract class helper {
  static double nextDouble(double min, double max) {
    Random random = Random();
    double ans = min + random.nextDouble() * (max - min);

    return ans;
  }
  static int next(int min, int max) {

    Random random = Random();

    return min + random.nextInt(max - min);
  }

  static Future<String> get localPath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFile(String fileName) async
  {
    final path = await localPath;
    File file = File('$path/$fileName');
    if(!file.existsSync())
    {
      String fileContent = await loadAssetFileText('assets/poem_metadata/$fileName');
      file.writeAsStringSync(fileContent);

    }
    else
    {
      String existingContent = await file.readAsString();
      if(existingContent.isEmpty || existingContent.length == 0)
      {
          String fileContent = await loadAssetFileText('assets/poem_metadata/$fileName');
          file.writeAsStringSync(fileContent);
      }
    }
    return file;
  }

  static Future<String> loadAssetFileText(String filePath) async {
    String fileText = await rootBundle.loadString(filePath);
    return fileText;
    
  }
}
