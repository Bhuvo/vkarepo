import 'package:flutter/material.dart';

import '../../widgets/m_scaffold.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageOverviewInMedicalRecords extends StatelessWidget {
  final String appointmentId;
  final String name;
  final String description;

  const ImageOverviewInMedicalRecords(
      {Key? key,
      required this.appointmentId,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: const Text("File Preview"),
      body: Stack(
        children: <Widget>[
          const Center(child: CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                // image: 'https://doctor.timesmed.com/Doc/$appointmentId/$name',
                image: 'https://api.timesmed.com/PatientUploadedFiles/$name',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
