import 'package:project/RoundedButton.dart';
import 'package:project/register.dart';
import 'Main Page.dart';
import 'authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool _validate = false;
  String emailIn;
  String passwordIn;
  final _auth = authentication();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Scaffold(
          body: ListView(

            children: [
              SizedBox(height: 40,),
              Text(
                'Welcome Dude \n Login to your Account',
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height:150.0,
              ),
              TextField(
                maxLengthEnforced: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value){
                  emailIn =value;
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                maxLengthEnforced: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                  onChanged: (value){
                  passwordIn = value;
  },
              ),
              SizedBox(
                height: 50.0,
              ),
              Roundedbuttons(
                colors: Colors.redAccent,
                onpressed: () async{
               dynamic result = await _auth.Signin(emailIn, passwordIn);
               if(result == null){
                 print('error Signin');
  }
               else{
                 Navigator.push(context, MaterialPageRoute(
                   builder:(context)=> MainPage(),
                 ));
  }
                },
                textcolor: Colors.white,
                text: 'Log in',
              ),
              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   Rounded button here
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New here?'),
                  GestureDetector(
                    child: Text(
                      'Click here to signup',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder:(context)=> registerpage(),
                      ));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
