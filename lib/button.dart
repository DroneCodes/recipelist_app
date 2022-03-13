import 'package:flutter/material.dart';
import 'package:recipelist_app/views/home.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Text(
              "Get Cooking",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
