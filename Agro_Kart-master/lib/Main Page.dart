import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:project/pulsespage.dart';
import 'package:project/AddProducts.dart';
import 'package:project/f&vpage.dart';
import 'Custom_Action_bar.dart';
import 'PriceTable.dart';
import 'horizontal_listview.dart';


class MainPage extends StatefulWidget {
  final bool hascart;
  MainPage({this.hascart});
  @override

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userID = FirebaseFirestore.instance.collection(
      "users");
  final User _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {

    //Widget image_carousel = new

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBars(context),


        backgroundColor: Colors.green,
        elevation: 0.0,
        brightness: Brightness.dark,

        actions: <Widget>[

          Container(
            width: 42.0,
            height: 42.0,


            alignment: Alignment.center,

            child: StreamBuilder(
              stream: _userID.doc(_user.uid).collection("cart").snapshots(),
              builder: (context, snapshot) {
                int _totalitem = 0;
                if (snapshot.connectionState == ConnectionState.active) {
                  List _documents = snapshot.data.docs;
                  _totalitem = _documents.length;
                }

                return Badge(

                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationType: BadgeAnimationType.slide,
                  badgeColor: Colors.red,
                  badgeContent: Text("$_totalitem" ?? "0",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add_alert_sharp,
                      color: Colors.white,
                    ),
                    onPressed: ()=>_showdialog(context),

                  ),

                );

              },
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
// header
            new UserAccountsDrawerHeader(
              accountName: Text('SRY'),
              accountEmail: Text('sry@gmail.com'),
              currentAccountPicture: GestureDetector(

                child: new CircleAvatar(
                  radius: 140,
                  backgroundColor: Colors.green,
                  child: Center(child: Text("  Breaking \n  Code",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),


            InkWell(
              onTap: (){ Navigator.push(context, MaterialPageRoute(
                builder:(context)=> MainPage(),
              )); },

              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> ProfilePage(),
                ));
              },
              child: ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(
                builder:(context)=> AddProduct(),
              ));},
              child: ListTile(
                title: Text('Add Products'),
                leading: Icon(Icons.add_box_outlined),
              ),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(
                builder:(context)=> Tables(),
              ));},
              child: ListTile(
                title: Text('Price Table'),
                leading: Icon(Icons.details),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () =>_popupDialog(context),

              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: ()async {
                try {
                  await _auth.signOut();
                }
                catch(e) {
                  print(e);
                }
              },
              child: ListTile(
                title: Text('Sign Out'),
                leading: Icon(Icons.logout, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
         cardname(),
          //image carousel begins here
        SizedBox(
        height: 200.0,
        width: 350.0,
        child: Carousel(
          images: [
            NetworkImage('https://www.verywellfit.com/thmb/YEKYuA9paI1kowp6rcY6GI2l5ZI=/1500x1000/filters:fill(FFDB5D,1)/rice-white-annotation-bf12c5995d794fed8a9fa7c46663ce89.jpg'),
            NetworkImage('https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/pulses.jpeg?alt=media&token=403ebac4-569c-4c8f-a7d1-5a5bc4624f9e'),
            NetworkImage('https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/fruit%20loading.jpeg?alt=media&token=e3fc58ec-9c2a-46a1-a6f4-5b048a567a42')
          ],

          dotSize: 4.0,
          dotSpacing: 15.0,
          dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.purple.withOpacity(0.5),
          borderRadius: true,

        ),
      ),
          SizedBox(height: 10.0,),
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),),
          SizedBox(height: 10.0,),
          //Horizontal list view begins here
  HorizontalList(),
          SizedBox(height: 10.0,),

    SizedBox(
    height: 170.0,
    width: 350.0,
    child: Carousel(
    images: [
    NetworkImage('https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/Cooking%20oils.jpeg?alt=media&token=97607ece-d881-4bbd-9f2a-b5fe07d2b5a0'),
    NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnK5dUM4YWz8HsUunWSZMqi-tqUAk8dWuFaQ&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTnK5dUM4YWz8HsUunWSZMqi-tqUAk8dWuFaQ&usqp=CAU'),
    NetworkImage('https://www.verywellfit.com/thmb/YEKYuA9paI1kowp6rcY6GI2l5ZI=/1500x1000/filters:fill(FFDB5D,1)/rice-white-annotation-bf12c5995d794fed8a9fa7c46663ce89.jpg'),

    ],
    dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.lightGreenAccent,
    indicatorBgPadding: 5.0,
    dotBgColor: Colors.purple.withOpacity(0.5),
    borderRadius: true,

    ),
    ),
          SizedBox(height: 10.0,),
          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Another Categories',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),),

          //Horizontal list view begins here
          extralist(),

        ],
      ),
    );
  }
}

void _popupDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('About'),
          content: Text("Hey there, Welcome to Agrokart, the world No.1 place for purchasing online grocery products directly from the farmers."
              "It helps farmers to sell there valuable products directly to the customers without any brokers for a valuable price. Customers can buy the products directly from the farmers so it'll be fresh and also they can get it for lower price than the market."
              "This is meant not only to help farmers but also the customers. If you're not satisfied with the product you can request a refund/replacement with proper reasons and if your reason in valid you'll get refund/replacement as per your request. Customer satisfaction is our motto. Always remember, a group of people is always there to help you. Happy shopping :D"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('CANCEL')),
          ],
        );
      });
}
void _showdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text("Coming Soon"),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK')),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('CANCEL')),
          ],
        );
      });
}
