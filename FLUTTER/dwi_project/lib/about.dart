import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("About Application"),
          actions: [new Icon(Icons.search)]),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        color: Colors.blue[100],
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: NetworkImage(
                    'https://2016.tedxuniversityofmacedonia.com/images/ABOUT.png'),
                height: 200,
                width: 250,
              ),
              Text(
                "Aplikasi ini adalah aplikasi yang dapat digunakan pengguna untuk pemesanan hotel.",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
