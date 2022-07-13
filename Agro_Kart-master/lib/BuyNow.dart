import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:project/Main%20Page.dart';

import 'admin product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'admin product.dart';
import 'admin product.dart';


class BuyNow extends StatefulWidget {
  @override
  _BuyNowState createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  Buynow buy = Buynow();

  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController Pricecontroller = TextEditingController();
  TextEditingController photourls = TextEditingController();


  GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  List<String> selectedSize = <String>[];

  bool isLoading = false;

  var selectedType;
  List<String> _accountType = <String>[
    'Cash on Delivery',
    'UPI Method',
    'Credit Card',
    'Depit Card'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Text(
            'Buy Now',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _fromkey,
          child: ListView(
            children: <Widget>[
              isLoading ? CircularProgressIndicator :
              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: productnamecontroller,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 5) {
                      return 'product name must be less than 10 characters';
                    }
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: photourls,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Address',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter image';
                    } else if (value.length > 5) {
                      return 'url name must be less than 10 characters';
                    }
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.0),
                child: DropdownButton(
                  items: _accountType
                      .map((value) =>
                      DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Color(0xff11b719)),
                        ),
                        value: value,
                      ))
                      .toList(),
                  onChanged: (selectedAccountType) {
                    print('$selectedAccountType');
                    setState(() {
                      selectedType = selectedAccountType;
                    });
                  },
                  value: selectedType,
                  isExpanded: false,
                  hint: Text(
                    'Delivery Type',
                    style: TextStyle(color: Color(0xff11b719)),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
//                  initialValue: '1',
                  controller: quantitycontroller,

                  decoration: InputDecoration(
                    labelText: 'City & State',
                    hintText: 'City & State',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 10) {
                      return 'product name must be less than 10 characters';
                    }
                  },
                ),
              ),


              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
//                  initialValue: '0.00',
                  controller: Pricecontroller,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: 'Mbl No',
                    labelText: 'Mbl No',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 5) {
                      return 'product name must be less than 5characters';
                    }
                  },
                ),
              ),
              SizedBox(height: 50,),
              FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Confirm Your Products'),
                  onPressed: () async {
                    buy.upLoadProduct(
                      Name: productnamecontroller.text,
                      mbl: double.parse(Pricecontroller.text),
                      method: selectedType,
                      Address: photourls.text,
                      city: quantitycontroller.text,
                    );
                    _fromkey.currentState.reset();
                    setState(() {
                      isLoading = false;
                    });
                    Toast.show('Confirm Ur Orders', context);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
                  }
              ),
              // select category
            ],
          ),
        ));
  }
}