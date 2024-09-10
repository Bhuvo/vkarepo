
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

extension PlatformFileUtils on PlatformFile {
  ///Used to convert PlatformFile to base64 String
  ///
  ///returns null if file is not found or error
  ///
  ///Usage: ```String? base64String = f.toBase64();```
  String? toBase64(){
    try{
      final file = File(path ?? '');
      return file.toBase64();
    } catch (_){}
    return null;
  }
}
extension FileUtils on File {
  ///Used to convert File to base64 String
  ///
  ///returns null if file is not found or error
  ///
  ///Usage: ```String? base64String = f.toBase64();```
  String? toBase64(){
    try{
      final bytes = readAsBytesSync();
      return base64Encode(bytes);
    } catch (_){}
    return null;
  }



  ///Used to convert base64 String to dart:io File, this will not work on flutter web
  ///
  ///returns null if base64 String is not valid
  ///
  ///Usage: ```File? f = await File.fromBase64(base64String, fileName: 'appointment.pdf');```
  Future<File?> fromBase64(String source, {String? fileName}) async {
    final dir = (await getExternalStorageDirectories(type: StorageDirectory.documents))?.first;
    if(dir != null){
      try{
        final path = '${dir.path}/${fileName ?? '${DateTime.now().millisecondsSinceEpoch}'}';
        final File file = File(path);
        await file.writeAsBytes(base64Decode(source));
        return file;
      }catch(_){}
    }
    return null;
  }
}