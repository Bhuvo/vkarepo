import 'package:flutter/material.dart';
import 'package:timesmedlite/ui/widgets/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widgets/m_scaffold.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';

class ImageOverviewInQueuePage extends StatefulWidget {
  final String appointmentId;
  final String name;
  final String description;

  const ImageOverviewInQueuePage(
      {Key? key,
      required this.appointmentId,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  State<ImageOverviewInQueuePage> createState() =>
      _ImageOverviewInQueuePageState();
}

class _ImageOverviewInQueuePageState extends State<ImageOverviewInQueuePage> {
  PDFDocument? document;
  final _controller = PageController(initialPage: 0);
  int currentPage = 0;

  bool itsPDF = false;

  @override
  void initState() {
    print('isPdf');
    getMethod();
    super.initState();
  }

  // @override
  // void initState() {
  //   getMethod();
  //   super.initState();
  // }
  getMethod(){
    if (widget.name.contains('.pdf') || widget.name.contains('.docx')) {
      // setState(() {
        itsPDF = true;
        print('isPdf $itsPDF  ' );
        loadDocument();
      // });
    } else {
      print('isPdf $itsPDF  ' );
      // setState(() {
        itsPDF = false;
      // });
    }

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> loadDocument() async {
    document = await PDFDocument.fromURL(
        "https://api.timesmed.com/PatientUploadedFiles/${widget.appointmentId}/${widget.name}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("https://api.timesmed.com/PatientUploadedFiles/${widget.appointmentId}/${widget.name}");
    return Stack(
      children: [
        Center(child: LoadingWidget(),),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: itsPDF == false
                ? FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
              'https://api.timesmed.com/PatientUploadedFiles/${widget.appointmentId}/${widget.name}',
            )
                : document != null
                ? PDFViewer(
              document: document!,
              zoomSteps: 1,
              indicatorText: Colors.white,
              indicatorBackground: MTheme.THEME_COLOR,
              showNavigation: true,
              pickerButtonColor: MTheme.THEME_COLOR,
              navigationBuilder: (context, currentPage, totalPages,
                  jumpToPage, animateToPage) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: MTheme.THEME_COLOR,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.first_page),
                        onPressed: () {
                          jumpToPage(page: 0);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          animateToPage(page: currentPage! - 2);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          animateToPage(page: currentPage);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.last_page),
                        onPressed: () {
                          jumpToPage(page: totalPages! - 1);
                        },
                      ),
                    ],
                  ),
                );
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page + 1;
                });
              },
            )
                : const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        )
      ],
    );
  }
}


class MedicalRecordViewer extends StatefulWidget {
  final String appointmentId;
  final String name;
  final String description;
  final List<Map<String, dynamic>>? data;
  final int? index;
  const MedicalRecordViewer({super.key, required this.appointmentId, required this.name, required this.description, this.data, this.index});

  @override
  State<MedicalRecordViewer> createState() => _MedicalRecordViewerState();
}

class _MedicalRecordViewerState extends State<MedicalRecordViewer> {

  late PageController controller = PageController(initialPage: widget.index ?? 0);

  @override
  Widget build(BuildContext context) {
    print('Length is widget.data ${widget.data?.length}');
    return MScaffold(
      title: const Text("File Phhreview"),
      body: Container(
        height:MediaQuery.of(context).size.height * 0.8,
        // width: MediaQuery.of(context).size.width * 0.8,
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length ?? 0,

            itemBuilder:(context, index) {
              return ImageOverviewInQueuePage(
                appointmentId: widget.appointmentId.toString(),
                name: widget.data?[index]['Name'] ?? '',
                description: widget.description,
              );
            }),
      ),
    );
  }
}
