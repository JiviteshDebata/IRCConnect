import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccountRegister {
  final User currentUser;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  UserAccountRegister({@required this.currentUser});

  Future<void> AddUser() async {
    print("Adding to firebase");
    await _db.collection("account").doc(currentUser.uid).set({
      'displayName': currentUser.displayName,
      'email': currentUser.email,
      'profilePicture': currentUser.photoURL,
    });
    print("Creating dummy chat threads");
    await _db
        .collection("account")
        .doc(currentUser.uid)
        .collection("chatThreads")
        .doc()
        .set({});
  }
}
