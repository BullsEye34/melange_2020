import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melange_2020/Register.dart';
import 'package:melange_2020/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';

class events extends StatefulWidget {
  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {
  bool isAdmin = false;
  var uid;

  doThis() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();

    final uuid = user.uid;
    var doc = Firestore.instance.collection('Users').document(uuid);
    bool whatever = await doc.get().then((value) => value.data['isAdmin']);
    setState(() {
      if (whatever) {
        isAdmin = true;
      }
    });

    setState(() {
      uid = uuid;
    });
  }

  @override
  void initState() {
    doThis();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color(0xffFF7700),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffffffff)));
    return Scaffold(
        appBar: AppBar(
          leading: isAdmin
              ? FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => register()),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              : null,
          elevation: 0.0,
          backgroundColor: Color(0xffFF7700),
          centerTitle: true,
          title: Text(
            "Melange 2020",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                _navigateToNextScreen(context, app());
              },
              child: Icon(
                Icons.input,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Registrations",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xff6a6a6a)),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MainStage(),
              SizedBox(height: 20.0,),
              OffStage(),
              SizedBox(height: 20.0,),
              Sports(),
              SizedBox(height: 20.0,),
              Gaming(),
              SizedBox(height: 20.0,),
              Technical(),
              SizedBox(height: 20.0,),
            ],
          ),
        ));
  }

  Widget MainStage() {
    return StreamBuilder(
        stream: Firestore.instance.collection('list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  snapshot.data.documents[1].documentID.toString(),
                  style: TextStyle(color: Color(0xffB123E3), fontSize: 15.0),
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('list')
                      .document('Main Stage')
                      .collection('names')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff177BC8), width: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 150,
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]['title']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00B3A6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SvgPicture.network(
                                    snapshot.data.documents[index]['img']
                                        .toString(),
                                    color: Colors.red,
                                    semanticsLabel: 'A red up arrow',
                                    width: 80.0,
                                    height: 80.0,
                                  ),
                                  Text(
                                      "\u20B9" +
                                          snapshot.data.documents[index]['rate']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff6A6A6A),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }

  Widget OffStage() {
    return StreamBuilder(
        stream: Firestore.instance.collection('list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  snapshot.data.documents[2].documentID.toString(),
                  style: TextStyle(color: Color(0xffB123E3), fontSize: 15.0),
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('list')
                      .document('Off Stage')
                      .collection('names')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff177BC8), width: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 150,
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]['title']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00B3A6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SvgPicture.network(
                                    snapshot.data.documents[index]['img']
                                        .toString(),
                                    color: Colors.red,
                                    semanticsLabel: 'A red up arrow',
                                    width: 80.0,
                                    height: 80.0,
                                  ),
                                  Text(
                                      "\u20B9" +
                                          snapshot.data.documents[index]['rate']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff6A6A6A),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }

  Widget Sports() {
    return StreamBuilder(
        stream: Firestore.instance.collection('list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  snapshot.data.documents[3].documentID.toString(),
                  style: TextStyle(color: Color(0xffB123E3), fontSize: 15.0),
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('list')
                      .document('Sports')
                      .collection('names')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff177BC8), width: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 150,
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]['title']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00B3A6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SvgPicture.network(
                                    snapshot.data.documents[index]['img']
                                        .toString(),
                                    color: Colors.red,
                                    semanticsLabel: 'A red up arrow',
                                    width: 80.0,
                                    height: 80.0,
                                  ),
                                  Text(
                                      "\u20B9" +
                                          snapshot.data.documents[index]['rate']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff6A6A6A),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }

  Widget Gaming() {
    return StreamBuilder(
        stream: Firestore.instance.collection('list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  snapshot.data.documents[0].documentID.toString(),
                  style: TextStyle(color: Color(0xffB123E3), fontSize: 15.0),
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('list')
                      .document('Gaming')
                      .collection('names')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      height: 160,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff177BC8), width: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 150,
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]['title']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00B3A6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SvgPicture.network(
                                    snapshot.data.documents[index]['img']
                                        .toString(),
                                    color: Colors.red,
                                    semanticsLabel: 'A red up arrow',
                                    width: 80.0,
                                    height: 80.0,
                                  ),
                                  Text(
                                      "\u20B9" +
                                          snapshot.data.documents[index]['rate']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff6A6A6A),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }

  Widget Technical() {
    return StreamBuilder(
        stream: Firestore.instance.collection('list').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  snapshot.data.documents[4].documentID.toString(),
                  style: TextStyle(color: Color(0xffB123E3), fontSize: 15.0),
                ),
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection('list')
                      .document('Technical')
                      .collection('names')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    return Container(
                      height: 170,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xff177BC8), width: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              width: 150,
                              height: 50,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.documents[index]['title']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Color(0xff00B3A6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SvgPicture.network(
                                    snapshot.data.documents[index]['img']
                                        .toString(),
                                    color: Colors.red,
                                    semanticsLabel: 'A red up arrow',
                                    width: 80.0,
                                    height: 80.0,
                                  ),
                                  Text(
                                      "\u20B9" +
                                          snapshot.data.documents[index]['rate']
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Color(0xff6A6A6A),
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          );
        });
  }

  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }
}
