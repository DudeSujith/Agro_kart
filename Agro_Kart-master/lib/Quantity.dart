import 'package:flutter/material.dart';

class quantity extends StatefulWidget {
  final List productquantity;
  final Function(String) onSelected;
  quantity({this.productquantity, this.onSelected});
  @override
  _quantityState createState() => _quantityState();
}

class _quantityState extends State<quantity> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0
      ),
      child: Row(
        children: [
          for(var i=0; i< widget.productquantity.length;i++)
            GestureDetector(
              onTap: (){
                widget.onSelected("${widget.productquantity[i]}");
                setState(() {
                  _selected = i;
                });
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: _selected == i ? Theme.of(context).accentColor:Colors.grey,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: 4.0,
                ),
                child: Text("${widget.productquantity[i]}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _selected == i ? Colors.black:Colors.black,
                  fontSize: 16.0,

                ),
                ),
              ),
            )
        ],
      ),
    );

  }
}
