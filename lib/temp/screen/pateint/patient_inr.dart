
import 'package:flutter/material.dart';

import 'doctor_profile.dart';

void main() {
  runApp(PatientINR());
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

class PatientINR extends StatelessWidget {
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

      backgroundColor: Color.fromARGB(255, 246, 247, 250),

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        titleSpacing: 0.00,
        title: Stack(
          children: <Widget>[
            Container(
                height: 80.0,
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
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: const EdgeInsets.only(top: 12.0, left: 12.0),
                          height: 80,
                          width: 16,
                          alignment: Alignment.center,
                          child: Image.asset('assets/leftarrow.png'))),
                  Expanded(
                      flex: 12,
                      child: Container(
                          margin: const EdgeInsets.only(top: 12.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Patient INR Details".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: 'Metropolis'),
                          )))
                ])),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 246, 247, 250),
      ),

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
            padding: const EdgeInsets.only(top: 22.0, bottom: 12.0),
            decoration: new BoxDecoration(
                color: Color.fromARGB(255, 246, 247, 250),
                border: Border.all(
                    width: 0.0, color: Color.fromARGB(255, 246, 247, 250)),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48))),
            child: Stack(
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                          Container(
                              height: 130,
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  top: 4.0, left: 16.0, right: 16.0),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "Time In Therapeutic Ratio (TTR) is",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "0%".toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 48.0,
                                              fontFamily: 'Metropolis'),
                                        ),
                                      )
                                    ]),
                              )),
                          Container(
                              height: 85.0,
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: new BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0,
                                    color: Color.fromARGB(0, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(8.0),
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
                                            width: 1.0, color: Colors.black45),
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
                                    margin: const EdgeInsets.only(left: 32.0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text('Aravind',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Metropolis-Light',
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0)))),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              child: Text('Age:25,Male',
                                                  style: TextStyle(
                                                      fontSize: 10.0,
                                                      fontFamily:
                                                          'Metropolis-Light',
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0))))
                                        ]),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        width: 65,
                                        child: Row(children: <Widget>[
                                          Container(
                                              alignment: Alignment.topRight,
                                              margin: const EdgeInsets.only(
                                                  left: 6.0, top: 6.0),
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
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Metropolis-Light',
                                                    color: Color.fromARGB(
                                                        255, 113, 196, 191))),
                                          )
                                        ])),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 8.0),
                                        color:
                                            Color.fromARGB(255, 243, 250, 248),
                                        child: Row(children: <Widget>[
                                          Container(
                                              alignment: Alignment.topRight,
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
                                            child: Text('9551917102',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontFamily:
                                                        'Metropolis-Light',
                                                    color: Color.fromARGB(
                                                        255, 100, 100, 100))),
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
                                                margin: const EdgeInsets.only(
                                                    bottom: 4.0),
                                                padding: const EdgeInsets.only(
                                                    bottom: 4.0),
                                                decoration: new BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Color.fromARGB(
                                                          0, 172, 172, 172)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text('Target INR:',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Metropolis-Light',
                                                        color: Color.fromARGB(
                                                            255,
                                                            140,
                                                            140,
                                                            140)))),
                                            Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                margin: const EdgeInsets.only(
                                                    bottom: 4.0, right: 6.0),
                                                padding: const EdgeInsets.only(
                                                    bottom: 4.0),
                                                decoration: new BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      width: 1.0,
                                                      color: Color.fromARGB(
                                                          0, 172, 172, 172)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(' 2.0 - 3.0',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Metropolis-Light',
                                                        color: Colors.red)))
                                          ]))
                                ]))
                              ])),

                        ])),
                  ),
                )
              ],
            )),
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

/*import 'package:flutter/material.dart';

void main() {
  runApp(ScheduleList());
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

class ScheduleList extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(title: Text("Registration Form")),
        body: Stack(
          children: <Widget>[
            Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => name = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Full Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => fname = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Father's Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => mname = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mother's Name...",
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Male",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Radio(
                            value: "male",
                            groupValue: groupValue,
                            onChanged: (e) => valueChanged(e)),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Female",
                          textAlign: TextAlign.end,
                        ),
                        trailing: Radio(
                            value: "female",
                            groupValue: groupValue,
                            onChanged: (e) => valueChanged(e)),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Email...",
                        icon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => number = value,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mobile number...",
                        icon: Icon(Icons.call),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: "Create Password...",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autocorrect: false,
                      obscureText: _obscureText,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: "Confirm Password...",
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text('Register'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class Button extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const Button({required Key key, required this.callback, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blue,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45.0,
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
*/
