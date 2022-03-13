import 'package:flutter/material.dart';
import 'package:recipelist_app/button.dart';


class WelcomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueAccent[400],
      width: double.infinity,
      height: size.height,
     
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Recipe",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          SizedBox(height: size.height * 0.2,),
          Text(
            "oluwafisayomiogunyemi@gmail.com",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(height: size.height * 0.2,),
          Button(),
        ],
      ),
    );
  }
}