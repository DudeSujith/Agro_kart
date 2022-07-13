import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaseservices{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String getuserId(){

    return _firebaseAuth.currentUser.uid;


  }

  final CollectionReference productID = FirebaseFirestore.instance.collection("Wheat");
  final CollectionReference wheatID = FirebaseFirestore.instance.collection("Wheat");
  final CollectionReference userID = FirebaseFirestore.instance.collection("users");
  final CollectionReference cerealsID = FirebaseFirestore.instance.collection("Rice");
  final CollectionReference pulsesID = FirebaseFirestore.instance.collection("Rice");
  final CollectionReference grainsID = FirebaseFirestore.instance.collection("Rice");
  final CollectionReference oilID = FirebaseFirestore.instance.collection("Rice");
  final CollectionReference othersID = FirebaseFirestore.instance.collection("Rice");
}
