import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/pateint/patient_profile.dart';

void main() {
  runApp(DoctorProfile());
}

void showToast(BuildContext context, String msg, {required message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
  ));

  /*String arrayObjsText =
      '{"tags": [{"name": "dart", "quantity": 12}, {"name": "flutter", "quantity": 25}, {"name": "json", "quantity": 8}]}';
  var tagObjsJson = jsonDecode(arrayObjsText)['tags'] as List;
  List<Tag> tagObjs =
      tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
  print(tagObjs);*/
}

class DoctorProfile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late String email;
  late String password;
  late String name, fname, mname;
  late String number;
  bool _obscureText = true;
  late String gender;
  String groupValue = "male";
  final _formkey = GlobalKey<FormState>();

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 140,
        titleSpacing: 0.00,
        title: Stack(
          children: <Widget>[
            Container(
                height: 140.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromARGB(255, 11, 146, 156),
                        Color.fromARGB(255, 32, 208, 122)
                      ],
                    ),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(48))),
                child: Stack(children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.only(top: 24.0, left: 12.0),
                        height: 16,
                        width: 16,
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () {},
                        ),
                      )),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          margin: const EdgeInsets.only(top: 36.0),
                          child: Text(
                            "Doctor Profile".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Metropolis'),
                          ))),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 24.0, right: 24.0),
                          child: SizedBox(
                              height: 0.5,
                              width: double.infinity,
                              child: const DecoratedBox(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                              )))),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(children: <Widget>[
                        Container(
                            margin:
                                const EdgeInsets.only(left: 18.0, bottom: 16.0),
                            height: 32,
                            width: 32,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 113, 226, 240),
                              border: Border.all(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              child: Image.asset('assets/profile_user.png'),
                            )),
                        Container(
                            margin:
                                const EdgeInsets.only(left: 6.0, bottom: 12.0),
                            child: Text(
                              "Admin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Metropolis'),
                            ))
                      ])),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 100,
                          margin: const EdgeInsets.only(right: 18.0),
                          child: Row(children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 18.0, bottom: 16.0),
                                height: 32,
                                width: 32,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 64, 212, 142),
                                  border: Border.all(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/profile_icon.png'),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 18.0, bottom: 16.0),
                                height: 32,
                                width: 32,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 64, 212, 142),
                                  border: Border.all(
                                      width: 1.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/logout.png'),
                                ))
                          ])))
                ])),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 246, 247, 250),
      ),
      backgroundColor: Color.fromARGB(255, 246, 247, 250),
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 11, 146, 156),
                Color.fromARGB(255, 32, 208, 122)
              ],
            ),
          ),
          child: Container(
              padding: const EdgeInsets.only(top: 24.0, bottom: 18.0),
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 246, 247, 250),
                  border: Border.all(
                      width: 0.0, color: Color.fromARGB(255, 246, 247, 250)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      bottomRight: Radius.circular(48))),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Card(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Stack(children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                  Container(
                                      height: 86.0,
                                      width: 86.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                          height: 24.0,
                                          width: 24.0,
                                          decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                scale: 0.5,
                                                image: AssetImage(
                                                    'assets/profile.jpg')),
                                          ))),
                                  Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      alignment: Alignment.center,
                                      child: Text('Dr. Koushik Muthu Raja M',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Metropolis-Light',
                                              color: Color.fromARGB(
                                                  255, 113, 196, 191)))),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 4.0, bottom: 4.0),
                                      alignment: Alignment.center,
                                      child: Text('MBBS',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontFamily: 'Metropolis-Light',
                                              color: Color.fromARGB(
                                                  255, 100, 100, 100))))
                                ])),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: 80,
                                child: Row(children: <Widget>[
                                  Container(
                                      alignment: Alignment.topRight,
                                      margin: const EdgeInsets.only(
                                          left: 6.0, top: 2.0),
                                      height: 12,
                                      width: 12,
                                      child: Image.asset('assets/user.png'))
                                ])),
                          )
                        ]))),
                Card(
                    margin: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 12.0),
                    child: Container(
                        height: 50,
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                        alignment: Alignment.topRight,
                                        margin:
                                            const EdgeInsets.only(left: 6.0),
                                        height: 12,
                                        width: 12,
                                        child: Icon(
                                          Icons.phone_enabled,
                                          color: Colors.amber,
                                          size: 20.0,
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 12.0, top: 6.0),
                                      child: Text('9551917102',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Metropolis-Light',
                                              color: Color.fromARGB(
                                                  255, 100, 100, 100))),
                                    )
                                  ]))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              width: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.topRight,
                                            margin:
                                                const EdgeInsets.only(top: 4.0),
                                            height: 16,
                                            width: 16,
                                            child: Image.asset(
                                                'assets/whatsapp.png')),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 6.0, top: 6.0, right: 6.0),
                                          child: Text('6363637895',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily:
                                                      'Metropolis-Light',
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100))),
                                        )
                                      ]))),
                        ]))),
                Card(
                    margin: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 12.0),
                    child: Container(
                        height: 50,
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                        alignment: Alignment.topRight,
                                        margin:
                                            const EdgeInsets.only(left: 6.0),
                                        height: 12,
                                        width: 12,
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.amber,
                                          size: 20.0,
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 12.0, top: 6.0),
                                      child: Text('koush@gmail.com',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Metropolis-Light',
                                              color: Color.fromARGB(
                                                  255, 113, 196, 191))),
                                    )
                                  ]))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              width: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                left: 6.0),
                                            height: 12,
                                            width: 12,
                                            child: Icon(
                                              Icons.vpn_key,
                                              color: Colors.amber,
                                              size: 20.0,
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 12.0, top: 6.0),
                                          child: Text('arvind123',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily:
                                                      'Metropolis-Light',
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100))),
                                        )
                                      ]))),
                        ]))),
                Card(
                    margin: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 12.0),
                    child: Container(
                        height: 60,
                        padding: const EdgeInsets.all(8.0),
                        decoration: new BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6))),
                        child: Stack(children: <Widget>[
                          Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: () {
                                    showDialogWithFields(context);
                                  },
                                  child: Text(
                                    "Change Password",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontFamily: 'Metropolis'),
                                  ))),
                        ]))),
                Card(
                    margin: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 12.0),
                    child: Container(
                        height: 50,
                        child: Row(children: <Widget>[
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(children: <Widget>[
                                    Container(
                                        alignment: Alignment.topRight,
                                        margin:
                                            const EdgeInsets.only(left: 6.0),
                                        height: 12,
                                        width: 12,
                                        child: Icon(
                                          Icons.add_business_rounded,
                                          color: Colors.amber,
                                          size: 20.0,
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 12.0, top: 6.0),
                                      child: Text('MM Hospital',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Metropolis-Light',
                                              color: Color.fromARGB(
                                                  255, 113, 196, 191))),
                                    )
                                  ]))),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              width: 1,
                              color: Colors.black12,
                            ),
                          ),
                          Expanded(
                              flex: 100,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 4.0,
                                      top: 12.0,
                                      bottom: 16.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                left: 6.0),
                                            height: 12,
                                            width: 12,
                                            child: Icon(
                                              Icons.phone_enabled,
                                              color: Colors.amber,
                                              size: 20.0,
                                            )),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 12.0, top: 6.0),
                                          child: Text('04427896543',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily:
                                                      'Metropolis-Light',
                                                  color: Color.fromARGB(
                                                      255, 100, 100, 100))),
                                        )
                                      ]))),
                        ])))
              ]))),
      bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 246, 247, 250),
          elevation: 0,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(255, 11, 146, 156),
                    Color.fromARGB(255, 32, 208, 122)
                  ],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(48))),
          )),

      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}

void showDialogWithFields(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      var emailController = TextEditingController();
      var messageController = TextEditingController();
      return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60,
                  width: 320,
                  padding: const EdgeInsets.only(left: 20.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color.fromARGB(255, 11, 146, 156),
                          Color.fromARGB(255, 32, 208, 122)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () => Navigator.pop(_),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              child: Text(
                            "Change Password".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Metropolis'),
                          )))
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "New Password",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Metropolis'),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 6.0, left: 16.0, right: 16.0),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 172, 172, 172)),
                      borderRadius: BorderRadius.circular(12.0)),
                  width: double.infinity,
                  height: 55,
                  child: TextField(
                    controller: emailController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(0, 255, 255, 255),
                              width: 0.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(0, 255, 255, 255),
                              width: 0.0),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black45)),
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Metropolis-Regular'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 12.0, left: 16.0, right: 16.0, bottom: 12.0),
                  decoration: new BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(width: 0.0, color: Colors.amber),
                      borderRadius: BorderRadius.circular(12.0)),
                  width: double.infinity,
                  height: 55,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(_);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PatientProfile()));
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis'),
                        )),
                  ),
                )
              ],
            ),
          ));
    },
  );
}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  SlideMenu({required this.child, required this.menuItems});

  @override
  _SlideMenuState createState() => new _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = new Tween(
            begin: const Offset(0.0, 0.0), end: const Offset(-0.2, 0.0))
        .animate(new CurveTween(curve: Curves.decelerate).animate(_controller));

    return new GestureDetector(
      onHorizontalDragUpdate: (data) {
        // we can access context.size here
        setState(() {
          // _controller.value -= (data.primaryDelta! / context.size!.width)!;
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity! > 2500)
          _controller
              .animateTo(.0); //close menu on fast swipe in the right direction
        else if (_controller.value >= .5 ||
            data.primaryVelocity! <
                -2500) // fully open if dragged a lot to left or on fast swipe to left
          _controller.animateTo(1.0);
        else // close if none of above
          _controller.animateTo(.0);
      },
      child: new Stack(
        children: <Widget>[
          new SlideTransition(position: animation, child: widget.child),
          new Positioned.fill(
            child: new LayoutBuilder(
              builder: (context, constraint) {
                return new AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return new Stack(
                      children: <Widget>[
                        new Positioned(
                          right: .0,
                          top: .0,
                          bottom: .0,
                          width: constraint.maxWidth * animation.value.dx * -1,
                          child: new Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                  width: 0.75,
                                  color: Color.fromARGB(255, 192, 202, 202)),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4)),
                            ),
                            margin:
                                const EdgeInsets.only(top: 10.0, right: 16.0),
                            child: new Row(
                              children: widget.menuItems.map((child) {
                                return new Expanded(
                                  child: child,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
