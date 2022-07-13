import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'firebaseservices.dart';

class ProductServices {

 // String ref = "productName";

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> upLoadProduct(
      {String productName,

        String category,
        String Description,
        String photo,
        List quantity,
        double price,
      }) async {
    var id = new Uuid();

    String productId = id.v1();
    _firestore.collection(category).doc(productId).set({
      'categroy': category,
      'Name': productName,
      'id': productId,
      'Price':price,
      'Quantity':quantity,
      'Description':Description,
      'image':photo,

    });
  }
}


class registration {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> upLoadProduct(
      {String Email,
        String Name,
        String password,

        String mbl,
      }) async {
    var id = new Uuid();

    String productId = id.v1();
    _firestore.collection("Register").doc(productId).set({

      'Name': Name,
      'id': productId,
      'Mbl No:':mbl,
      'Email':Email,
      'Password':password


    });
  }
}

class Buynow {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> upLoadProduct(
      {String method,
        String Name,
        String city,
        String Address,

        double mbl,
      }) async {
    var id = new Uuid();

    String productId = id.v1();
    _firestore.collection("Buy Now").doc(productId).set({
      'Delivery Type': method,
      'Name': Name,
      'id': productId,
      'Mbl No:':mbl,

      'City & State':city,
      'Address':Address,

    });
  }
}
