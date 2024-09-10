
import 'package:flutter/material.dart';

import 'doctor_profile.dart';


class AddInrDetailsPage extends StatefulWidget {
  AddInrDetailsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AddInrDetailsPageState createState() => _AddInrDetailsPageState();
}

class _AddInrDetailsPageState extends State<AddInrDetailsPage> {
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
        automaticallyImplyLeading: false,
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
                Positioned(left: 0,child: Container(
                    margin: const EdgeInsets.only(top: 12.0, left: 12.0),
                    height: 80,
                    width: 16,
                    alignment: Alignment.center,
                    child: Image.asset('assets/leftarrow.png'))),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 12.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Add inr details".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Metropolis'),
                      )),
                )
              ]),
            )
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
                Form(
                  key: _formkey,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 6.0),
                        margin: const EdgeInsets.only(
                            top: 2.0, left: 16.0, right: 16.0),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 0.0,
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
                              hintText: 'Select Date',
                              hintStyle: TextStyle(color: Colors.black45)),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis-Regular'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 6.0),
                        margin: const EdgeInsets.only(
                            top: 12.0, left: 16.0, right: 16.0),
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
                              hintText: 'P.T(Patient)',
                              hintStyle: TextStyle(color: Colors.black45)),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis-Regular'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 6.0),
                        margin: const EdgeInsets.only(
                            top: 12.0, left: 16.0, right: 16.0),
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
                              hintText: 'P.T(Control)',
                              hintStyle: TextStyle(color: Colors.black45)),
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis-Regular'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 6.0),
                        margin: const EdgeInsets.only(
                            top: 12.0, left: 16.0, right: 16.0),
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
                              hintText: 'INR',
                              hintStyle: TextStyle(color: Colors.black45)),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Metropolis-Regular'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(top: 12.0, bottom: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            height: 55,
                            width: 134,
                            margin:
                                const EdgeInsets.only(left: 16.0, right: 6.0),
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                                color: Colors.pinkAccent,
                                border: Border.all(
                                    width: 0.0,
                                    color: Color.fromARGB(255, 172, 172, 172)),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Close",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontFamily: 'Metropolis'),
                                    ),
                                  ),
                                ]),
                          )),
                          Expanded(
                            child: Container(
                              height: 55,
                              width: 134,
                              margin:
                                  const EdgeInsets.only(left: 6.0, right: 16.0),
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                  color: Colors.yellow,
                                  border: Border.all(
                                      width: 0.0,
                                      color:
                                          Color.fromARGB(255, 172, 172, 172)),
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DoctorProfile()));
                                          },
                                          child: Text(
                                            "Save",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                fontFamily: 'Metropolis'),
                                          )),
                                    )
                                  ]),
                            ),
                          )
                        ]))
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
