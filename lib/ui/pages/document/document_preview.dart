import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/ui/components/api_builder/api_builder_bloc.dart';
import 'package:timesmedlite/ui/components/shimmer/shimmer_list.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/size_utils.dart';

import '../../components/api_builder/api_builder.dart';
import '../../components/shimmer/drop_down_shimmer.dart';
import '../../theme/theme.dart';
import '../../widgets/m_apibuilder_empty_widget.dart';

class DocumentPreview extends StatefulWidget {
  final int? appointmentid;
  final String? title;
  final docs;

  const DocumentPreview({Key? key, this.appointmentid, this.title, this.docs})
      : super(key: key);

  @override
  State<DocumentPreview> createState() => _DocumentPreviewState();
}

class _DocumentPreviewState extends State<DocumentPreview> {
  int index = 0;
  final PageController page = PageController();

  PDFDocument? document;
  final _controller = PageController(initialPage: 0);
  int currentPage = 0;

  bool itsPDF = false;

  void updatePage() {
    page.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    // bloc.add(Load());
    super.initState();
    print("${widget.appointmentid} -- appoinment id");
    // print("${widget.docs} -- docs");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PDFDocument? pdfDocument;

  // Function to load the PDF document from the URL.
  Future<void> loadDocument(String name) async {
    try {
      pdfDocument = await PDFDocument.fromURL(
          "https://api.timesmed.com/PatientUploadedFiles/$name");
      setState(() {});
    } catch (e) {
      // Handle any errors that occurred while loading the PDF.
      print('Error loading PDF document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ApiBuilderBloc(
        path: 'ViewMedicalRecords',
        query: {'Appointment_id': widget.appointmentid},
        raw: true);
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc..add(const Load()),
        child: ApiBuilder(
            empty: MScaffold(
              body: EmptyWidgetWhenNoDatainApiBuilder(Icons.document_scanner,
                  "No medical records have been uploaded by the patient yet."),
            ),
            jsonBuilder: (data, load) {
              print(
                  "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD${data.length}");

              return MScaffold(
                title: Text(widget.title ?? Consts.PREVIEW),
                hero: false,
                body: PageView.builder(
                  controller: page,
                  onPageChanged: (i) {
                    setState(() {
                      index = i;
                    });
                  },
                  itemBuilder: (c, i) {
                    // Extract the media URL from your data list.
                    final mediaUrl = data[i]['Name'].toString();

                    if (mediaUrl.endsWith('.pdf')) {
                      // If it's a PDF, load the document asynchronously.
                      if (pdfDocument == null) {
                        // Load the document if not loaded yet.
                        loadDocument(mediaUrl);
                        return Center(child: CircularProgressIndicator());
                      } else {
                        // Once the document is loaded, show the PDFViewer.
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            child: widget.title != null
                                ? PDFViewer(
                                    document: pdfDocument!,
                                    zoomSteps: 1,
                                    indicatorText: Colors.white,
                                    indicatorBackground: MTheme.THEME_COLOR,
                                    showNavigation: true,
                                    pickerButtonColor: MTheme.THEME_COLOR,
                                    navigationBuilder: (context, currentPage,
                                        totalPages, jumpToPage, animateToPage) {
                                      return Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: MTheme.THEME_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.first_page),
                                              onPressed: () {
                                                jumpToPage(page: 0);
                                              },
                                            ),
                                            IconButton(
                                              icon:
                                                  const Icon(Icons.arrow_back),
                                              onPressed: () {
                                                animateToPage(
                                                    page: currentPage! - 2);
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.arrow_forward),
                                              onPressed: () {
                                                animateToPage(
                                                    page: currentPage);
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.last_page),
                                              onPressed: () {
                                                jumpToPage(
                                                    page: totalPages! - 1);
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
                                : Container(
                                    color: Colors.grey.shade300,
                                  ),
                          ),
                        );
                      }
                    } else {
                      // If it's an image, show it directly.
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: widget.title != null
                              ? Image.network(
                                  'https://api.timesmed.com/PatientUploadedFiles/$mediaUrl',
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.grey.shade300,
                                ),
                        ),
                      );
                    }
                  },
                  itemCount:
                      widget.title != null ? data.length : widget.docs.length,
                ),
                bottom: data.length == 0
                    ? null
                    : Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getWPercent(2)),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: index > 0
                                    ? () {
                                        setState(() {
                                          index = index - 1;
                                        });
                                        updatePage();
                                      }
                                    : null,
                                icon: const Icon(Icons.chevron_left_rounded),
                                iconSize: 32,
                                disabledColor: Colors.white30,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    widget.title != null
                                        ? data.length
                                        : widget.docs.length,
                                    (i) {
                                      final sel = i == index;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Material(
                                          clipBehavior: Clip.antiAlias,
                                          shape: CircleBorder(
                                            side: BorderSide(
                                              color: sel
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                          color: Colors.grey,
                                          child: InkWell(
                                            onTap: sel
                                                ? null
                                                : () {
                                                    setState(() {
                                                      index = i;
                                                    });
                                                    updatePage();
                                                  },
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: Center(
                                                child: Text(
                                                  (i + 1)
                                                      .toString(), // Display index number here
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: index <
                                        (widget.title != null
                                            ? data.length - 1
                                            : widget.docs.length - 1)
                                    ? () {
                                        setState(() {
                                          index = index + 1;
                                        });
                                        updatePage();
                                      }
                                    : null,
                                icon: const Icon(Icons.chevron_right_rounded),
                                iconSize: 32,
                                disabledColor: Colors.white30,
                              ),
                            ],
                          ),
                        ),
                      ),
              );
            }),
      ),
    );
  }
}

//
