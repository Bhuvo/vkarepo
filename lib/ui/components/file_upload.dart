import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/components/waiting_dialog.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';

import '../../di/dependency_injection.dart';

class FileUpload extends StatefulWidget {
  final String title, subTitle;
  final EdgeInsets margin;
  final dynamic value;
  final Function(PlatformFile file)? onChanged;
  final Function(List<PlatformFile> files)? onMultiple;
  final List<String>? allowedExtensions;

  ///[FileUpload] widget used to get file from user
  ///
  ///[onChanged] callback is called when user picks file([PlatformFile])
  ///
  ///[onMultiple] callback is called when user picks multiple files, use this to get multiple files([List<PlatformFile>])
  ///
  ///[allowedExtensions] you can pass your required extensions ['.jpg', '.pdf'] as List
  const FileUpload({
    Key? key,
    this.subTitle = 'Choose your file to upload',
    this.title = 'File Upload',
    this.onChanged,
    this.allowedExtensions,
    this.onMultiple,
    this.value,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  }) : super(key: key);

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  // final ImagePicker imagePicker = ImagePicker();
  // String imagePath = "";
  final List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void pickFile() async {
      print("pick file runs from here");
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: widget.allowedExtensions,
        allowMultiple: widget.onMultiple != null,
      );
      if (result != null && result.files.isNotEmpty) {
        if (widget.onMultiple != null) {
          files.addAll(result.files);
          widget.onMultiple?.call(files);
        } else {
          widget.onChanged?.call(result.files.first);
        }
      } else {
        print('No File Selected');
      }
    }

    // void openImage() async {
    //      var pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    //      //you can use ImageCourse.camera for Camera capture
    //      if (pickedFile != null) {
    //        imagePath = pickedFile.path;
    //        print(imagePath);
    //        //output /data/user/0/com.example.testapp/cache/image_picker7973898508152261600.jpg
    //        final bytes = File(pickedFile!.path).readAsBytesSync();
    //        String base64Image =  "data:image/jpeg;base64,${base64Encode(bytes)}";
    //        print("img_pan : $base64Image");
    //        setState(() {});
    //        final call = Injector()
    //            .apiService
    //            .rawPost(path: 'Save_Appointment_Files_Summary', query: {
    //          'Appointment_Id': "150933",
    //          'base64image': base64Image,
    //        });
    //        final res = await showWaitingDialog(context: context, call: call);
    //        print(call);
    //        print(res?.body);
    //        Fluttertoast.showToast(
    //            msg: res.body.toString(),
    //            toastLength: Toast.LENGTH_SHORT,
    //            gravity: ToastGravity.BOTTOM,
    //            backgroundColor: Colors.redAccent,
    //            textColor: Colors.white,
    //            fontSize: 16.0);
    //      }
    //  }

    void openFileImageExplorer() async {
      //try {
      final pickedFile = await FilePicker.platform.pickFiles();
      if (pickedFile == null) {
        return;
      }
      final file = pickedFile.files.first;
      final bytes = File(file.path!).readAsBytesSync();
      String img64 = base64Encode(bytes);
      final call = Injector().apiService.rawPost(
          path: 'Save_Appointment_Files_Summary',
          //     query: {
          //   'Appointment_Id': "150933",
          //   'base64image': img64,
          // });
          body: {
            'Appointment_Id': "150933",
            'base64image': img64,
          });
      final res = await showWaitingDialog(context: context, call: call);
      print(res);
      Fluttertoast.showToast(
          msg: res?.body.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      print("after injection");
    }

    return MListTile(
      margin: widget.margin,
      color: MTheme.THEME_COLOR.withOpacity(0.1),
      background: Colors.white,
      onTap: pickFile,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
             FaIcon(
              FontAwesomeIcons.solidFolder,
              color: MTheme.ICON_COLOR,
              size: size.height * 0.026,
            ),
             SizedBox(
              width: size.width * 0.036,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: size.height * 0.018, color: MTheme.THEME_COLOR),
                  ),
                  Row(),
                  Text(
                    widget.subTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600,fontSize: size.height * 0.013,),
                  )
                ],
              ),
            ),
            IconButton(
              icon:  FaIcon(
                CupertinoIcons.camera_fill,
                color: MTheme.THEME_COLOR,
                size: size.height * 0.028,
              ),
              onPressed: pickFile,
            ),
          ],
        ),
      ),
    );
  }
}
