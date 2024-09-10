
import 'package:flutter/material.dart';
import 'package:timesmedlite/temp/screen/pateint/total_pending_case.dart';

void main() {
  runApp(TodayINRLineList());
}

void showToast(BuildContext context, String msg) {
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

class TodayINRLineList extends StatelessWidget {
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
                            "Today inr LINEList".toUpperCase(),
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
            child: Stack(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 6.0),
                margin:
                    const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1.0, color: Color.fromARGB(255, 172, 172, 172)),
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
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            debugPrint('222');
                          }),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black45)),
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Metropolis-Regular'),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 68.0),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return new SlideMenu(
                        child: Card(
                          margin: const EdgeInsets.only(
                              right: 16.0, left: 16.0, top: 10.0),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TotalPendingCasePage(title: '',)));
                            },
                            title: Stack(
                              children: <Widget>[
                                Container(
                                    height: 85.0,
                                    padding: const EdgeInsets.only(
                                        top: 6.0, bottom: 6.0),
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                          width: 1.0,
                                          color:
                                              Color.fromARGB(0, 172, 172, 172)),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Stack(children: <Widget>[
                                      Container(
                                          child: Stack(children: <Widget>[
                                        Container(
                                            height: 25.0,
                                            width: 25.0,
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.black45),
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
                                          alignment: Alignment.topLeft,
                                          margin:
                                              const EdgeInsets.only(left: 32.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text('Aravind',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Metropolis-Light',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0)))),
                                                Container(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text('Age:25,Male',
                                                        style: TextStyle(
                                                            fontSize: 10.0,
                                                            fontFamily:
                                                                'Metropolis-Light',
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0))))
                                              ]),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                              width: 165,
                                              child: Row(children: <Widget>[
                                                Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 6.0,
                                                            top: 6.0),
                                                    height: 16,
                                                    width: 16,
                                                    child: Icon(
                                                      Icons.date_range,
                                                      color: Colors.amber,
                                                      size: 16.0,
                                                    )),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 6.0, top: 8.0),
                                                  child: Text('25 Feb 2022',
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Metropolis-Light',
                                                          color: Color.fromARGB(
                                                              255,
                                                              113,
                                                              196,
                                                              191))),
                                                ),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 6.0,
                                                            top: 6.0),
                                                    child: SizedBox(
                                                      height: 18,
                                                      width: 0.5,
                                                      child: const DecoratedBox(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .black45),
                                                      ),
                                                    )),
                                                Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 6.0,
                                                            top: 6.0),
                                                    height: 12,
                                                    width: 12,
                                                    child: Image.asset(
                                                        'assets/user.png')),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 6.0, top: 8.0),
                                                  child: Text('BH234',
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Metropolis-Light',
                                                          color: Color.fromARGB(
                                                              255,
                                                              113,
                                                              196,
                                                              191))),
                                                )
                                              ])),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0, bottom: 8.0),
                                              color: Color.fromARGB(
                                                  255, 243, 250, 248),
                                              child: Row(children: <Widget>[
                                                Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                  child: Text('9551917102',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily:
                                                              'Metropolis-Light',
                                                          color: Color.fromARGB(
                                                              255,
                                                              100,
                                                              100,
                                                              100))),
                                                )
                                              ])),
                                        ),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Container(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      margin: const EdgeInsets
                                                          .only(bottom: 4.0),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4.0),
                                                      decoration:
                                                          new BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            width: 1.0,
                                                            color:
                                                                Color.fromARGB(
                                                                    0,
                                                                    172,
                                                                    172,
                                                                    172)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Text('Target INR:',
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Metropolis-Light',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      140,
                                                                      140,
                                                                      140)))),
                                                  Container(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 4.0,
                                                              right: 6.0),
                                                      padding: const EdgeInsets
                                                          .only(bottom: 4.0),
                                                      decoration:
                                                          new BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                            width: 1.0,
                                                            color:
                                                                Color.fromARGB(
                                                                    0,
                                                                    172,
                                                                    172,
                                                                    172)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                      child: Text(' 2.0 - 3.0',
                                                          style: TextStyle(
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Metropolis-Light',
                                                              color:
                                                                  Colors.red)))
                                                ]))
                                      ]))
                                    ]))
                              ],
                            ),
                          ),
                        ),
                        menuItems: <Widget>[
                          new Container(
                            height: 32,
                            width: 32,
                            padding: const EdgeInsets.all(6.0),
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 207, 229, 227),
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(255, 20, 158, 150))),
                            child: Container(
                                height: 20,
                                width: 20,
                                child: Image.asset('assets/view.png')),
                          ),
                        ],
                      );
                    },
                  )),
            ])),
      ),
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
          //_controller.value -= (data.primaryDelta! / context.size!.width)!;
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
