import 'package:flutter/material.dart';
import 'package:flutter_application_dwi/about.dart';
import 'package:flutter_application_dwi/screen/login.dart';
import 'package:flutter_application_dwi/setting.dart';

class Menudrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //widget drawer
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            //bagian header pada drawer
            accountName: Text("Dwi Utama"),
            accountEmail: Text("dwiutama530@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/appimage/dwik.jpeg"),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue[800]), // mewarnai background drawer
          ),
          ListTile(
            //widget untuk drawer di bagian list tilenya
            onTap: () {},
            title: Text("Profil"),
            trailing: Icon(Icons.account_circle),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Setting();
              }));
            },
            title: Text("Pengaturan"),
            trailing: Icon(Icons.settings),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return About();
              }));
            },
            title: Text("Tentang Aplikasi"),
            trailing: Icon(Icons.help),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
            title: Text("Keluar"),
            trailing: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
