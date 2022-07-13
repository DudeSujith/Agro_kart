import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/Custom_Action_bar.dart';
import 'package:project/imageswipe.dart';
import 'package:badges/badges.dart';
import 'package:project/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/Quantity.dart';
import 'package:project/firebaseservices.dart';
import 'BuyNow.dart';
import 'constants.dart';
import 'package:project/productcard.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'firebaseservices.dart';

class RicePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _userID = FirebaseFirestore.instance.collection(
      "users");
  final User _user = FirebaseAuth.instance.currentUser;
  final CollectionReference _productRef = FirebaseFirestore.instance.collection("Rice");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.green,
  title: Center(child: Text("Rice Page",style:Constants.boldHeading)),
  actions: <Widget>[
new IconButton(
icon: Icon(
  Icons.search,
  color: Colors.white,
),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder:(context)=> RiceSearch(),
          ));
        }),
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
              icon: Icon(Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder:(context)=> RiceCart(),
                ));
              },
            ),

          );

        },
      ),
    ),
    ]
),

      body: Container(
        child: Stack(
          children: [
            FutureBuilder <QuerySnapshot>(
                future: _productRef.get(),
                builder:(context,snapshot){
                  if(snapshot.hasError){
                    return Scaffold(
                      body: Center(
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                      padding: EdgeInsets.only(
                        top: 15.0,
                        bottom: 12.0,
                      ),
                      children: snapshot.data.docs.map((document) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder:(context)=> RiceProduct(productId: document.id,),
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            height: 250.0,
                            margin: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 24.0,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  height:350.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      "${document.data()['image'][0]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          document.data()['Name'] ?? 'Product Name',
                                          style: Constants.regularHeading,),
                                        Text(
                                          "\$${document.data()['Price']}" ?? 'Price',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Theme.of(context).accentColor,
                                              fontWeight: FontWeight.w600
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );

                  }

                  //loding ScrollIncrementType.page
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

            ),

          ],
        ),
      ),
    );
  }
}

class RiceProduct extends StatefulWidget {
  final String productId;
  RiceProduct({this.productId});
  @override
  _RiceProductState createState() => _RiceProductState();
}

class _RiceProductState extends State<RiceProduct> {
  Firebaseservices _firebaseservices = Firebaseservices();


  User _user = FirebaseAuth.instance.currentUser;
  String _selectedproduct = "0";

  Future _addtocart(){
    return _firebaseservices.userID.doc(_user.uid).collection("cart").doc(widget.productId).set(
        {
          "Quantity":_selectedproduct
        }
    );
  }
  final SnackBar _snackBar = SnackBar(content: Text("Product added to the cart"),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: FirebaseFirestore.instance.collection("Rice").doc(widget.productId).get(),
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                }

                if(snapshot.connectionState == ConnectionState.done){
                  Map<String, dynamic> documentData = snapshot.data.data();

                  //list of length
                  List imageList = documentData['image'];
                  List productquantity = documentData['Quantity'];
                  return ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      Imageswipe(imageList:imageList,),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          left: 24.0,
                          right: 24.0,
                          bottom: 4.0,

                        ),
                        child: Text(
                          "\Name : ${documentData['Name']}"??"Product Name",
                          style: Constants.boldHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "\$"
                              "${documentData['Price']}"??"Price",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "\Description:\n${documentData['Description']}"??"Description",
                          style: TextStyle(
                            fontSize: 16.0,

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "Quality : 1",
                          style: Constants.regularHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "Quantity",
                          style: Constants.regularHeading,
                        ),
                      ),
                      quantity(
                        productquantity: productquantity,
                        onSelected: (quantity){
                          _selectedproduct = quantity;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(

                              child: GestureDetector(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder:(context)=> BuyNow(),
                                  ));
                                },

                                child: Container(
                                  height:65.0,
                                  decoration:BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  alignment:Alignment.center,
                                  child: Text("Buy",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(

                              child: GestureDetector(
                                onTap:()async {
                                  await _addtocart();
                                  Scaffold.of(context).showSnackBar(_snackBar);

                                },
                                child: Container(
                                  height:65.0,
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                  decoration:BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text("Add to cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  );
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
          ),
          customactionBar(
hascart: false,
            hastitle: false,
            hasBackground: false,
            hasBackArrow:true,
          ),

        ],
      ),
    );
  }
}



class RiceCart extends StatefulWidget {
  @override
  _RiceCartState createState() => _RiceCartState();
}
class _RiceCartState extends State<RiceCart> {
  Firebaseservices _firebaseservices = Firebaseservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text('Cart Page',
            textAlign: TextAlign.center,
            style: Constants.boldHeading,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),

      ),
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseservices.userID.doc(_firebaseservices.getuserId())
                .collection("cart").get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }
              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RiceProduct(productId: document.id,),
                        ));
                      },
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance.collection("Rice").doc(document.id).get(),
                        builder: (context, productSnap) {
                          if(productSnap.hasError) {
                            return Container(
                              child: Center(
                                child: Text("${productSnap.error}"),
                              ),
                            );
                          }
                          if(productSnap.connectionState == ConnectionState.done) {
                            Map _productMap = productSnap.data.data();
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: 24.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                      child: Image.network(
                                        "${_productMap['image'][0]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_productMap['Name']}",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets
                                              .symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: Text(
                                            "\$${_productMap['price']}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "Quantity - ${document.data()['Quantity']}",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                );
              }
              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}


class RiceSearch extends StatefulWidget {
  @override
  _RiceSearchState createState() => _RiceSearchState();
}

class _RiceSearchState extends State<RiceSearch> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Firebaseservices _firebaseServices = Firebaseservices();
  String _searchString = "";

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search Bar'),
        actions: [searchBar.getSearchAction(context)]
    );
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: Text('You wrote $value!'))));
  }

  _RiceSearchState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: (value) {
          setState(() {
            _searchString = value.toLowerCase().toUpperCase();
          });
        },
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body:Stack(
        children: [
          if (_searchString.isEmpty)
            Center(
              child: Container(
                child: Text(
                  "Search Results",
                  style: Constants.regularHeading,
                ),
              ),
            )
          else
            FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.productID
                  .orderBy("Name")
                  .startAt([_searchString]).endAt(
                  ["$_searchString\uf8ff"]).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }

                // Collection Data ready to display
                if (snapshot.connectionState == ConnectionState.done) {
                  // Display the data inside a list view
                  return ListView(
                    padding: EdgeInsets.only(
                      top: 128.0,
                      bottom: 12.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      return ProductCard(
                        title: document.data()['Name'],
                        imageUrl: document.data()['image'][0],
                        price: "\$${document.data()['price']}",
                        productId: document.id,
                      );
                    }).toList(),
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),

        ],
      ),

    );

  }
}


