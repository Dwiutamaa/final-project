import 'package:flutter/material.dart';
import 'package:flutter_application_dwi/ui/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class EditPenjualan extends StatelessWidget {
  final Map input;
  EditPenjualan({@required this.input});
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController hotelController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController checkInController = TextEditingController();
  Future updateData() async {
    final response = await http.put(
        Uri.parse(
            "http://192.168.100.14/api/bookings/" + input['id'].toString()),
        body: {
          "nama": nameController.text,
          "nama_hotel": hotelController.text,
          "jumlah": jumlahController.text,
          "check_in": checkInController.text,
        });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController..text = input['nama'],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: hotelController..text = input['nama_hotel'],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nama Hotel",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: jumlahController
                      ..text = input['jumlah'].toString(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Jumlah",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: checkInController
                      ..text = input['check_in'].toString(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Check In",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Simpan",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              updateData().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataScreen()));
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                        color: Colors.red,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Batal",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
