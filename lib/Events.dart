import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:melange_2020/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class events extends StatefulWidget {
  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {
  var isAdmin;
  doThis() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    print(uid);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doThis();
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
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MainStage(),
              OffStage(),
              Sports(),
              Gaming(),
              Technical()
              
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

                          return

                            Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff177BC8), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    snapshot.data.documents[index]['title'].toString(), style: TextStyle(fontSize: 18.0, color: Color(0xffFF7700), fontWeight: FontWeight.w400),),
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
                          return

                            Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff177BC8), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    snapshot.data.documents[index]['title'].toString(), style: TextStyle(fontSize: 18.0, color: Color(0xffFF7700), fontWeight: FontWeight.w400),),
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
                          return

                            Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff177BC8), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    snapshot.data.documents[index]['title'].toString(), style: TextStyle(fontSize: 18.0, color: Color(0xffFF7700), fontWeight: FontWeight.w400),),
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
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return

                            Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff177BC8), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    snapshot.data.documents[index]['title'].toString(), style: TextStyle(fontSize: 18.0, color: Color(0xffFF7700), fontWeight: FontWeight.w400),),
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
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return

                            Padding(
                              padding: EdgeInsets.only(left: 18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff177BC8), width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: 150,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    snapshot.data.documents[index]['title'].toString(), style: TextStyle(fontSize: 18.0, color: Color(0xffFF7700), fontWeight: FontWeight.w400),),
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
