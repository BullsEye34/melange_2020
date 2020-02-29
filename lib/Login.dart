import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Events.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController uname = new TextEditingController();
  TextEditingController pwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xffFF7700),));
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Designs/Background_Login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 0,
            ),
            Center(
              child: Text(
                "LOGIN",
                style: TextStyle(
                    color: Color(
                      0xff6A6A6A,
                    ),
                    fontSize: 35.0),
              ),
            ),
            Details(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          title: Text("Contact AppMasters"),
                          content: Text("Here are your AppMasters"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                launch("tel: +918792858442");
                              },
                              child: Text("Vamshi Prasad"),
                            ),
                            FlatButton(
                              onPressed: () {
                                launch("tel: +918971729383");
                              },
                              child: Text("Menahi Shayan"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Forgot Password?"),
                ),
              ],
            ),
            SizedBox(
              height: 100.0,
            )
          ],
        ),
      ),
    );
  }

  Widget submit() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: w / 2, top: h / 30),
      child: FlatButton(
        onPressed: () {},
        child: FlatButton(
          onPressed: () {
            submitAction();
          },
          child: Image.asset(
            "Designs/Submit Button.png",
            width: 80.0,
          ),
        ),
      ),
    );
  }

  Widget Details() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  style: TextStyle(color: Colors.black, height: 2.0),
                  keyboardType: TextInputType.emailAddress,
                  controller: uname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.perm_identity,
                      color: Color(0xff9a9a9a),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    labelText: 'USERNAME (MAIL ID)',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  style: TextStyle(color: Colors.black, height: 2.0),
                  keyboardType: TextInputType.emailAddress,
                  controller: pwd,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Color(0xff9a9a9a),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
            ],
          ),
          submit()
        ],
      ),
    );
  }
DoThisOnValue(){
    _navigateToNextScreen(context, events());
}
  submitAction() async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: uname.text, password: pwd.text)
        .then(
      
          (value) => DoThisOnValue()
        ).catchError((e) {
      print(e.toString());
      switch(e.toString()){
        case 'PlatformException(ERROR_USER_NOT_FOUND, There is no user record corresponding to this identifier. The user may have been deleted., null)' : showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              title: Text("User Doesn't Exist!!"),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))
              ],
            );
          },
        );
        break;

        case 'PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)':
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                title: Text("Wrong Password!"),
                actions: <Widget>[
                  FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))
                ],
              );
            },
          );
          break;
        case 'PlatformException(error, Given String is empty or null, null)':
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                title: Text("Incomplete Details!!"),
                actions: <Widget>[
                  FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))
                ],
              );
            },
          );
          break;
        case 'PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)':
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                title: Text("Username should be an Email Address!!"),
                actions: <Widget>[
                  FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))
                ],
              );
            },
          );
          break;

        default: showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the that user has entered by using the
              // TextEditingController.
              title: Text(e.toString()),
              actions: <Widget>[
                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("OK"))
              ],
            );
          },
        );
        break;

      }
      /*showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the that user has entered by using the
            // TextEditingController.
            content: Text(e.toString()),
          );
        },
      );*/});
  }
  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }

}
