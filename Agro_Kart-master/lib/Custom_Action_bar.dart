import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pulsespage.dart';
import 'package:project/f&vpage.dart';
import 'constants.dart';
import 'package:badges/badges.dart';

class customactionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hastitle;
  final bool hasBackground;
  final bool hascart;
  customactionBar({this.title,this.hasBackArrow,this.hastitle,this.hasBackground,this.hascart});


  final CollectionReference _userID = FirebaseFirestore.instance.collection(
      "users");
  final User _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hastitle = hastitle ?? true;
    bool _hasBackground = hasBackground ?? true;
    bool _hascart = hascart ?? true;
    return
      Container(
        decoration: BoxDecoration(
            gradient: _hasBackground ? LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0)
              ],
              begin: Alignment(0, 0),
              end: Alignment(0, 1),
            ) : null
        ),
        padding: EdgeInsets.only(
          top: 56.0,
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(_hasBackArrow)
              IconButton(icon: Icon(Icons.arrow_back,), onPressed: () {
                Navigator.of(context).pop();
              },),
            if(_hastitle)

              Text(
                title ?? "Action Bar",
                style: Constants.boldHeading,
              ),

            //count view box size and color
            if(_hascart)
            Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0)
                ),
                alignment: Alignment.center,

                //cart count code
                child: StreamBuilder(
                  stream: _userID.doc(_user.uid).collection("cart").snapshots(),
                  builder: (context, snapshot) {
                    int _totalitem = 0;
                    if (snapshot.connectionState == ConnectionState.active) {
                      List _documents = snapshot.data.docs;
                      _totalitem = _documents.length;
                    }

                    return Badge(
                      badgeColor: Colors.green,
                      badgeContent: Text("$_totalitem" ?? "0",
                        style: TextStyle(color: Colors.white),
                      ),

                      child: IconButton(
                        icon: Icon(Icons.add_shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: (){

                        },
                      ),

                    );

                  },
                )
            )
          ],
        ),

    );
  }
  }


  Widget appBars(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 22),
        children: <TextSpan>[
          TextSpan(text: 'Agro',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black)),
          TextSpan(text: ' - ',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black)),
          TextSpan(text: 'Kart',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.pink)),
          //TextSpan(text: '\n E', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
        ],
      ),

    );
  }


Widget Cart(BuildContext context){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22) ,
      children: <TextSpan>[
        TextSpan(text: 'Cart', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
        TextSpan(text: ' Page', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue)),

      ],
    ),
  );
}