import 'package:flutter/material.dart';

class RoundedButtonss extends StatelessWidget {
  RoundedButtonss(
      {@required this.title,
      this.colour,
      @required this.onpressed,
      this.textcolour});
  final String title;
  final Color colour;
  final Function onpressed;
  final Color textcolour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          textColor: Colors.white,
          onPressed: onpressed,
          child: Text(
            title,
            style: TextStyle(color: textcolour, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


class Roundedbuttons extends StatelessWidget {
  Roundedbuttons(
      {@required this.onpressed, this.colors, this.textcolor, this.text});

  final Function onpressed;
  final Color colors;
  final Color textcolor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: colors,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: textcolor),
          ),
        ),
      ),
    );
  }
}

