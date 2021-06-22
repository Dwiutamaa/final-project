import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_dwi/ui/editpenjualan.dart';
import 'package:flutter_application_dwi/ui/inputpenjualan.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  const DataScreen({
    Key key,
  }) : super(key: key);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final String url = "http://192.168.100.14/api/bookings";

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteData(String dataId) async {
    final String url = "http://192.168.100.14/api/bookings/" + dataId;
    var response = await http.delete(Uri.parse(url));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pemesanan Hotel'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InputPenjualan()));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          color: Colors.blue[200],
          child: Column(
            children: [
              FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 180,
                              child: Card(
                                elevation: 5,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      padding: EdgeInsets.all(5),
                                      height: 120,
                                      width: 120,
                                      child: Text(
                                        snapshot.data['data'][index]['nama'],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  snapshot.data['data'][index]
                                                      ['nama_hotel'],
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(snapshot.data['data']
                                                      [index]['jumlah']
                                                  .toString()),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                    icon: Icon(Icons.edit),
                                                    color: Colors.red,
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EditPenjualan(
                                                                      input: snapshot
                                                                              .data['data']
                                                                          [
                                                                          index])));
                                                    }),
                                                Text(snapshot.data['data']
                                                        [index]['check_in']
                                                    .toString()),
                                                IconButton(
                                                  icon: Icon(Icons.delete),
                                                  color: Colors.red,
                                                  onPressed: () {
                                                    deleteData(snapshot
                                                            .data['data'][index]
                                                                ['id']
                                                            .toString())
                                                        .then((value) {
                                                      setState(() {});
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "Data berhasil didelete")));
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return Text('Data error');
                    }
                  }),
            ],
          ),
        ));
  }
}
