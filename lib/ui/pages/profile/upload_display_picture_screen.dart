import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:timesmedlite/utils/file_utils.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

import '../../../di/dependency_injection.dart';
import '../../bloc/patient/patient_bloc.dart';
import '../../components/api_builder/api_builder_bloc.dart';
import '../../components/file_upload.dart';
import '../../components/waiting_dialog.dart';
import '../../theme/theme.dart';
import '../../widgets/m_scaffold.dart';
import 'package:path/path.dart' as path;

import '../appointment/book_appointment_page.dart';
import '../appointment/in_queue_page.dart';

class ImageUploadScreen extends StatefulWidget {
  final String userId;
  final Function functionToRefreshBloc;
  final dynamic p;

  ImageUploadScreen({
    required this.userId,
    required this.functionToRefreshBloc,
    this.p,
  });

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _selectedImage;
  String? _base64Image;
  String imageExtension = '';
  String base64FormatExtension = '';

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      final file = File(pickedImage.path);
      final fileExtension = path.extension(file.path).toLowerCase();

      // Store the file extension separately
      final String extension = (fileExtension == '.jpeg' ||
              fileExtension == '.jpg' ||
              fileExtension == '.png')
          ? fileExtension
          : '';

      setState(() {
        _selectedImage = file;
        _base64Image = base64Encode(file.readAsBytesSync());
        imageExtension = extension;
        print(imageExtension);
      });
    }
  }

  showToast({required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // Future<void> uploadImage(String userId) async {
  //   print(widget.userId);
  //   print(_base64Image);
  //   if (_selectedImage != null && _base64Image != null) {
  //     final call = Injector().apiService.post(path: 'PatientImage', body: {
  //       'User_id': userId,
  //       'base64image': 'data:image/jpeg;base64,$_base64Image',
  //     });
  //     final res = await showWaitingDialog(context: context, call: call);
  //     print(res?.error);
  //     print(res?.statusCode);
  //     print(res?.body);
  //     showToast(message: res?.body.message ?? 'Some Error Occured');
  //   }
  // }
  Future<void> uploadImage(String userId) async {
    if (imageExtension == ".jpeg") {
      setState(() {
        base64FormatExtension = "data:image/jpeg;base64,";
      });
    }
    if (imageExtension == ".jpg") {
      setState(() {
        base64FormatExtension = "data:image/jpeg;base64,";
      });
    }
    if (imageExtension == ".png") {
      setState(() {
        base64FormatExtension = "data:image/png;base64,/";
      });
    }
    if (_selectedImage != null && _base64Image != null) {
      const url = 'https://api.timesmed.com/WebAPIP/PatientImage';
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        "base64image": "$base64FormatExtension$_base64Image",
        "User_id": "$userId"
      });
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Image uploaded successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: MTheme.THEME_COLOR,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Image uploaded successfully');
        print(response.body);
        setState(() {
          context.read<PatientBloc>().add(Select(widget.p));
        });
        familyBloc.add(const Refresh());
        widget.functionToRefreshBloc();
        context.pop();
      } else {
        Fluttertoast.showToast(
            msg: "Failed to upload image",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Failed to upload image');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.p);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MScaffold(
      title: const Text('Select Patient Image'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _selectedImage != null
                ? CircleAvatar(
                    radius: size.width * 0.275,
                    backgroundColor: Colors.transparent,
                    backgroundImage: FileImage(_selectedImage!),
                  )
                : CircleAvatar(
                    radius: size.width * 0.275,
                    backgroundColor: MTheme.THEME_COLOR,
                    child: Icon(
                      Icons.image,
                      size: MediaQuery.of(context).size.height * 0.056,
                    ),
                  ),
            SizedBox(
              height: size.height * 0.022,
            ),
            _selectedImage != null
                ? Container()
                : ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MTheme.THEME_COLOR),
                    child: const Text('Pick an Image'),
                  ),
            SizedBox(
              height: size.height * 0.022,
            ),
            _selectedImage == null
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      uploadImage(widget.userId);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MTheme.THEME_COLOR),
                    child: const Text('Upload Image'),
                  ),
            // buildFileUploadd(context,widget.userId),
          ],
        ),
      ),
    );
  }
}

FileUpload buildFileUploadd(BuildContext context, var apId) {
  showToast({required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  return FileUpload(
    // title: 'Upload any medical records ( Image or PDF )',
    subTitle: 'Upload any medical records ( Image jpeg Format* )',
    onChanged: (d) async {
      print("open file image explorer function runs here");
      print("$apId prints appointment id");

      var base64Image = d.toBase64();

      print(base64Image);
      print("${base64Image?.length} base 64 length");

      print(apId);
      print(base64Image);
      print("apid and base64");

      if (base64Image != null) {
        final call = Injector().apiService.post(path: 'PatientImage', body: {
          'User_id': apId, //"150933",
          'base64image': base64Image,
        });
        // body: {
        //   'Appointment_Id': "$apId", //"150933",
        //   'base64image': "data:image/jpeg;base64,$base64Image",
        // });
        final res = await showWaitingDialog(context: context, call: call);
        print("call response");
        print(call);
        print(res?.error);
        print(res?.statusCode);
        print(res?.body);
        print(res?.isSuccessful);
        print(res?.base);
        print("above error, statuscode and body response");
        showToast(message: res?.body.message ?? 'Some Error Occured');
      } else {}
    },
  );
}
