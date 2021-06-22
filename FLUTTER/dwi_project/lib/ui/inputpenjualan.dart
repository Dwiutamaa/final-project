import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_dwi/ui/home.dart';
import 'package:http/http.dart' as http;

class InputPenjualan extends StatefulWidget {
  @override
  _InputPenjualanState createState() => _InputPenjualanState();
}

class _InputPenjualanState extends State<InputPenjualan> {
  final _fromkey = GlobalKey<FormState>();
  Future saveUpload() async {
    final response =
        await http.post(Uri.parse("http://192.168.100.14/api/bookings"), body: {
      "nama": nameController.text,
      "nama_hotel": hotelController.text,
      "jumlah": jumlahController.text,
      "check_in": checkInController.text,
    });
    return jsonDecode(response.body);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController hotelController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController checkInController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.keyboard_arrow_left),
          backgroundColor: Colors.blue[0xFF29B6F6]),
      body: Container(
        color: Colors.blue[0xFF00E5FF],
        child: Form(
          key: _fromkey,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
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
                    controller: hotelController,
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
                    controller: jumlahController,
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
                    controller: checkInController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Tanggal Check In",
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
                            if (_fromkey.currentState.validate()) {
                              saveUpload().then((value) {
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
