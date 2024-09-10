import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/ui/components/status_indicator.dart';
import 'package:timesmedlite/ui/theme/theme.dart';

import 'file_upload.dart';

class CompareUpload extends StatefulWidget {
  final oldimagefromApi;
  final newiamgeuplaodfromdevice;
  final Function(PlatformFile)? onChanged;
  final Function()? onChangedRemove;
  const CompareUpload({Key? key, this.oldimagefromApi, this.newiamgeuplaodfromdevice, this.onChanged, this.onChangedRemove}) : super(key: key);

  @override
  State<CompareUpload> createState() => _CompareUploadState();
}

class _CompareUploadState extends State<CompareUpload> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              olditem(context, src: widget.oldimagefromApi, label: 'OLD'),
              SizedBox(width: 16,),
              (widget.newiamgeuplaodfromdevice==null||widget.newiamgeuplaodfromdevice=='')?Expanded(child: SizedBox(
                child: Icon(FontAwesomeIcons.camera,color: Colors.blueGrey,)
              )):newitem(context, src:widget.newiamgeuplaodfromdevice, label: 'NEW'),
            ],
          ),
        ),
        SizedBox(height: 16,),
        FileUpload(
            margin: EdgeInsets.all(0),
            title: 'Add New',
            subTitle: 'Choose your image to upload',
            onChanged:widget.onChanged
        ),
      ],
    );
  }

  Widget olditem(BuildContext context, {required String src, required String label}){
    return Expanded(child: Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(MTheme.RADIUS),
        image: (src==null||src=='')?null:DecorationImage(
          image: CachedNetworkImageProvider(src),
          fit: BoxFit.fill
        )
      ),
      child: StatusIndicator(label: label, color: Colors.white, textColor: Colors.grey,),
    ));
  }

  Widget newitem(BuildContext context, {required PlatformFile src, required String label}){
    return Expanded(child: Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(MTheme.RADIUS),
              image: (src==null||src=='')?DecorationImage(
                  image: NetworkImage("https://t4.ftcdn.net/jpg/02/17/88/73/360_F_217887350_mDfLv2ootQNeffWXT57VQr8OX7IvZKvB.jpg"),
                  fit: BoxFit.fill
              ):DecorationImage(
                  image: FileImage(File(src.path.toString())),
                  fit: BoxFit.fill
              )
          ),
          child: StatusIndicator(label: label, color: Colors.white, textColor: Colors.grey,),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: InkWell(
              onTap: widget.onChangedRemove,
              child: Icon(Icons.remove_circle_outline,color: Colors.red,)),)
      ],
    ));
  }
}
