import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Cereals%20Page.dart';
import 'package:project/GrainsPage.dart';
import 'package:project/OthersPage.dart';
import 'package:project/Ricepage.dart';
import 'package:project/f&vpage.dart';
import 'package:project/oilpage.dart';
import 'package:project/pulsespage.dart';

import 'WheatPage.dart';
import 'authentication.dart';
import 'constants.dart';
import 'firebaseservices.dart';

class cardname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),

          onTap: () {
            print('Card tapped.');
          },

          child: Container(
            width: 450,
            height: 50,
            child: Center(child: Text('  Breaking Code  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  Widget _category(String image,String text) {
    return Container(

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            CircleAvatar(backgroundImage: NetworkImage(image), radius: 70),
            SizedBox(height: 10),
            Text(text,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: GridView.count(
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> RicePage(),
                ));

              },
              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/rice.jpeg?alt=media&token=d5a0fc45-b6dd-49db-8d55-22fe2ce3b46d",
                  "Rice")),

          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> WheatPage(),
                ));
              },

              child: _category("https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/wheat.jpeg?alt=media&token=de8f0c35-0746-4daf-9162-f7174a6c91e7","Wheat")),  GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> fvPage() ,
                ));

              },

              child: _category("https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/fruits%20and%20vegetables.jpeg?alt=media&token=308160c1-d163-4ef7-8eef-1e137c44dfe8",
                  "Fruits&Vegetables")),
                  GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> CerealsPage(),
                ));
              },

              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/cereals.jpeg?alt=media&token=ce0ac346-b598-4c88-af5a-49f12aebdded",
                  'Cereals')),
        ],
      ),
    );

  }
}

class extralist extends StatefulWidget {
  @override
  _extralistState createState() => _extralistState();
}

class _extralistState extends State<extralist> {
  Widget _category(String image,String text,String price,String old) {
    return Card(
      child: Hero(
          tag: text,
          child: Material(
            child: InkWell(
              child: GridTile(
                footer: Container(
                  color: Colors.greenAccent[100],
                  child: ListTile(
                    leading: Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      price,
                      style: TextStyle(
                          color: Colors.red,fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      old,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),

              ),
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.0,
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal ,
        children: <Widget>[

          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> GrainsPage(),
                ));
              },
              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/grains.jpeg?alt=media&token=c03008b7-5747-44f2-8738-a2ec0ae5f9f5",
                  "Grains","\$90","\$150")),

          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> pulsePage(),
                ));
              },

              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/pulses%20product.jpeg?alt=media&token=79e425e2-5289-49e4-a2e6-a3114f8e00dc",
                  "Pulses","\$120","\%180")),
          GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> oilPage(),
                ));
              },

              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/oil.jpeg?alt=media&token=699e5796-89bb-40bc-a297-54f333dace42",
                  'Oil',"\$40","\$60")),
          GestureDetector(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> otherPage(),
                ));
              },

              child: _category(
                  "https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/others.jpeg?alt=media&token=d979f758-a8b3-420e-882a-201baf9cbaea",
                  'Others',"\$200","\$250")),
          // _category("", 0xff),


        ],
      ),
    );

  }
}



class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showPassword = false;
  final email = authentication().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.of(context).pop();

          },
        ),

      ),
      body: Container(

        padding: EdgeInsets.only(left: 16,top:25,right: 16 ),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text("Profile",
                  style: TextStyle(fontSize: 25,fontWeight:FontWeight.w600)
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0,10)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image:NetworkImage('https://firebasestorage.googleapis.com/v0/b/deptcs-1dca6.appspot.com/o/logo.jpeg?alt=media&token=ec37fcd2-5ecf-49fd-a057-20357c7e37b6'),
                          )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green
                        ),
                        child: Icon(Icons.edit,color: Colors.white,),
                      ),)
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              cardnames(title: '$email',),
              SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },

                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),

                    child: Text('Home',
                      style: TextStyle(
                          fontSize: 14,letterSpacing: 2.2,color: Colors.black
                      ),),
                  ),

                  RaisedButton(
                    onPressed: (){},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text('Signout',style: TextStyle(fontSize: 14,letterSpacing: 2.2,
                        color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom:35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword:false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ? IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(Icons.remove_red_eye,color: Colors.grey,
              ),

            ):null,

            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
      ),
    );
  }
}


class cardnames extends StatelessWidget {

  cardnames({ @required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.green,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),

          onTap: () {
            print('Card tapped.');
          },

          child: Container(
            width: 450,
            height: 50,
            child: Center(child: Text('  $title  ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}