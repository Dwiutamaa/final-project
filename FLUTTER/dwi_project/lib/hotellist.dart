import 'package:flutter/material.dart';
import 'detail.dart';

// ignore: camel_case_types
class produk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Hotel")),
      backgroundColor: Colors.blue[100],
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  nama: "Hotel Panpasific",
                  deskripsi:
                      "Hotel yang berlokasi di Kabupaten Tabanan, tepatnya di dearah wisata Panati Tanah Lot",
                  harga: 800000,
                  gambar: "Gambar 1.jpg",
                  star: 5,
                ),
              ));
            },
            child: ProductBox(
                nama: "HOTEL PANPASIFIC",
                deskripsi: "Hotel yang berlokasi di Kabupaten Tabanan",
                harga: 800000,
                gambar: "Gambar 1.jpg",
                star: 5),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  nama: "Hotel Mulia Bali",
                  deskripsi:
                      "Hotel no 1 di daerah Kabupaten Badung, tepatnya berada pada titik lokasi Pantai Jimbaran",
                  harga: 250000,
                  gambar: "Gambar 2.jpg",
                  star: 4,
                ),
              ));
            },
            child: ProductBox(
                nama: "HOTEL MULIA BALI",
                deskripsi: "Hotel berlokasi di daerah Kabupaten Badung",
                harga: 250000,
                gambar: "Gambar 2.jpg",
                star: 4),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  nama: "Hotel Melka",
                  deskripsi:
                      "Hotel yang memiliki pesona alam yang menarik dengan lokasi dekat Pantai Lovina",
                  harga: 350000,
                  gambar: "Gambar 3.png",
                  star: 5,
                ),
              ));
            },
            child: ProductBox(
                nama: "HOTEL MELKA",
                deskripsi:
                    "Hotel berlokasi di Kabupaten Buleleng",
                harga: 350000,
                gambar: "Gambar 3.png",
                star: 5),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  nama: "Hotel Hilthon",
                  deskripsi:
                      "Memiliki pesona alam yang sangat indah karena memiliki garden yang luas",
                  harga: 400000,
                  gambar: "Gambar 4.jpg",
                  star: 4,
                ),
              ));
            },
            child: ProductBox(
                nama: "HOTEL HILTHON",
                deskripsi: "Hotel yang berlokasi di Kabupaten Denpasar",
                harga: 400000,
                gambar: "Gambar 4.jpg",
                star: 4),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => DetailProduk(
                  nama: "Hotel Tabanan",
                  deskripsi:
                      "Hotel yang berlokasi tepat dititik kota dengan berbagai fasilitas yang mudah untuk dijangkau",
                  harga: 600000,
                  gambar: "Gambar 5.jpg",
                  star: 5,
                ),
              ));
            },
            child: ProductBox(
                nama: "HOTEL TABANAN",
                deskripsi: "Hotel berlokasi di Kabupaten Tabanan",
                harga: 600000,
                gambar: "Gambar 5.jpg",
                star: 5),
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.nama, this.deskripsi, this.harga, this.gambar, this.star})
      : super(key: key);
  final String nama;
  final String deskripsi;
  final int harga;
  final String gambar;
  final int star;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/appimage/" + gambar,
              width: 150,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(this.nama,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(this.deskripsi),
                    Text(
                      "Harga: " + this.harga.toString(),
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
