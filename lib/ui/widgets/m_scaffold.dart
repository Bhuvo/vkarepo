import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/service/firebase/messaging_monitor.dart';
import 'package:timesmedlite/ui/pages/call/call_actions.dart';
import 'package:timesmedlite/ui/theme/theme.dart';
import 'package:timesmedlite/ui/widgets/widgets.dart';
import 'package:timesmedlite/utils/navigator_utils.dart';

class MScaffold extends StatelessWidget {
  final Widget? title,
      drawer,
      leading,
      appBarBottom,
      body,
      bottom,
      customHeader;
  final List<Widget>? actions;
  final EdgeInsets? bodyPadding;
  final double paddingTop;
  final bool automaticallyImplyLeading, hero;
  final CallActions? floatingActionButton;

  const MScaffold({
    Key? key,
    this.title,
    this.drawer,
    this.automaticallyImplyLeading = true,
    this.hero = true,
    this.bodyPadding,
    this.leading,
    this.customHeader,
    this.bottom,
    this.paddingTop = 56,
    this.appBarBottom,
    this.body,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MessagingMonitor.initContext(context);
    final head = ClipPath(
        clipper: const CustomClipPath(radius: 40),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Container(
            padding: const EdgeInsets.only(bottom: 40),
            decoration: const BoxDecoration(
              gradient: MTheme.GRADIENT,
              // image: DecorationImage(
              //   colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
              //  // image: AssetImage('assets/images/logo.png',),
              //   image: AssetImage('assets/images/logo.png',),
              //   fit: BoxFit.fitWidth, opacity: 0.25, )
            ),
            child: Stack(
              children: [
                // Positioned(
                //     top: 0,
                //     bottom: 0,
                //     left: 0,
                //     right: 0,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 16),
                //       child: SvgPicture.asset('assets/svg/tm_ic_bg.svg', fit: BoxFit.fitWidth, color: Colors.black.withOpacity(0.05  ),),
                //     )),
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Image.asset(
                        'assets/images/app_bar_bg.png',
                        fit: BoxFit.fitWidth,
                      ),
                    )),
                Material(
                    type: MaterialType.transparency,
                    child: customHeader ??
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SafeArea(
                                child: SizedBox(
                                  height: 56,
                                  child: LayoutBuilder(builder: (context, _) {
                                    return AppBar(
                                      title: title,
                                      automaticallyImplyLeading:
                                          automaticallyImplyLeading,
                                      leading: !automaticallyImplyLeading
                                          ? null
                                          : drawer != null
                                              ? IconButton(
                                                  onPressed: () {
                                                    Scaffold.of(context)
                                                        .openDrawer();
                                                  },
                                                  icon: const Icon(
                                                      FontAwesomeIcons.bars))
                                              : Navigator.of(context).canPop()
                                                  ? IconButton(
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      icon: const Icon(
                                                          CupertinoIcons.back))
                                                  : null,
                                      actions: [
                                        ...?actions,
                                        const SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              if (appBarBottom != null) ...[
                                const Divider(
                                  height: 1,
                                  color: Colors.white30,
                                ),
                                DefaultTextStyle(
                                  style: const TextStyle(color: Colors.white),
                                  child: appBarBottom!,
                                )
                              ]
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ));

    final foot = Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper:
              const CustomClipPath(type: CustomClipPathType.top, radius: 40),
          child: Container(
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: bottom == null ? 100 : double.infinity),
            padding: EdgeInsets.only(top: 40),
            width: double.maxFinite,
            decoration: const BoxDecoration(gradient: MTheme.GRADIENT),
            child: bottom,
          ),
        ),
      ),
    ]);

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
        return false;
      },
      child: Scaffold(
        key: key,
        drawer: drawer,
        // body: NestedScrollView(
        //   headerSliverBuilder: (_, __){
        //     return [
        //       SliverToBoxAdapter(
        //         child: hero ? Hero(
        //               tag: 'TOP_SECTION',
        //               child: head,
        //             ) : head,
        //       )
        //     ];
        //   }, body: SafeArea(
        //   child: Padding(
        //     padding: bodyPadding ?? EdgeInsets.fromLTRB(0, paddingTop, 0, 60),
        //     child: body!,
        //   ),
        // ),
        // ),
        // bottomNavigationBar: hero ? Hero(
        //     tag: 'BOTTOM_SECTION',
        //     child: foot,
        //   ) : foot,
        body: Stack(
          children: [
            if (body != null)
              SafeArea(
                child: Padding(
                  padding:
                      bodyPadding ?? EdgeInsets.fromLTRB(0, paddingTop, 0, 60),
                  child: body!,
                ),
              ),
            //App Bar Impl
            if (hero)
              Hero(
                tag: 'TOP_SECTION',
                child: head,
              )
            else
              head,

            //Bottom bar impl
            if (hero)
              Stack(children: [
                Hero(
                  tag: 'BOTTOM_SECTION',
                  child: foot,
                ),
                floatingActionButton ?? Container(),
              ])
            else
              Stack(children: [foot, floatingActionButton ?? Container()]),
          ],
        ),
      ),
    );
  }
}

enum CustomClipPathType { bottom, top }

class CustomClipPath extends CustomClipper<Path> {
  final double radius;
  final CustomClipPathType type;

  const CustomClipPath(
      {this.radius = 50, this.type = CustomClipPathType.bottom});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final w = size.width;
    final h = size.height;
    if (type == CustomClipPathType.bottom) {
      path.lineTo(0, h / 2);
      path.quadraticBezierTo(radius * 0.2, h - (radius * 1), radius,
          h - radius); //radius * 0.1, h - (radius * 0.9), radius, h - radius);
      path.lineTo(w - radius, h - radius);
      path.quadraticBezierTo(
          w - (radius * 0.1), h - (radius * 1.1), w, h - (radius * 2));
      path.lineTo(size.width, 0.0);
    } else {
      path.lineTo(0, h);
      path.lineTo(0, radius * 2);
      path.quadraticBezierTo(radius * 0.1, (radius * 1.1), radius, radius);
      path.lineTo(w - radius, radius);
      path.quadraticBezierTo(w - (radius * 0.2), (radius * 1.1), w, radius * 2);
      path.lineTo(w, h);
      path.lineTo(0, h);
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
