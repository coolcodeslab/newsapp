import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatefulWidget {
  static const id = 'profile screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _fireStore = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;
  User firebaseUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        firebaseUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final userEmail = snapshot.data.docs[0]['email'];
          for (var i in snapshot.data.docs) {
            print(i.toString());
          }

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.red),
              elevation: 0,
            ),
            body: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
//                  firebaseUser.email,
                  userEmail,
                  textAlign: TextAlign.center,
                  style: kHeadingTextStyle,
                )
              ],
            ),
          );
        });
  }
}
