import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  int index;
  String nama, posisi, lokasi;

  CardPage(int index, String nama, String posisi, String lokasi) {
    this.index = index;
    this.nama = nama;
    this.posisi = posisi;
    this.lokasi = lokasi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobseek"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue[900]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Container(
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * 0.8,
              // height: MediaQuery.of(context).size.height * 0.8,
              child: Card(
                elevation: 16,
                child: Stack(
                  children: [
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ImageGridItem(index + 1),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          20 + MediaQuery.of(context).size.height * 0.5,
                          20,
                          20),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              (nama), // NAMA_PT
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Text(
                                    "Posisi : ", // NAMA_PT
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    posisi, // NAMA_PT
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Row(
                                children: [
                                  Text(
                                    ("Lokasi : "), // NAMA_PT
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    (lokasi), // NAMA_PT
                                    style: TextStyle(
                                        color: Colors.grey[900],
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 60, 0, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Posted On   ",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center),
                                  Text("23 Feb 2020",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Spacer(flex: 10),
                                Column(
                                  children: [
                                    Icon(Icons.cloud_download,
                                        size: 20, color: Colors.grey),
                                    Text("Download",
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Spacer(flex: 6),
                                Column(
                                  children: [
                                    Icon(Icons.save,
                                        size: 20, color: Colors.grey),
                                    Text("Simpan",
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                                Spacer(flex: 10),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageGridItem extends StatefulWidget {
  int _index;

  ImageGridItem(int index) {
    this._index = index;
  }

  @override
  _ImageGridItemState createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem> {
  Uint8List imageFile;
  Reference photosReferences = FirebaseStorage.instance.ref().child("photos");

  _ImageGridItemState({this.imageFile});

  getImage() {
    int maxsize = 7 * 1024 * 1024;
    photosReferences
        .child("image_${widget._index}.jpg")
        .getData(maxsize)
        .then((data) {
      this.setState(() {
        imageFile = data;
      });
    }).catchError((error) {});
  }

  Widget decideGridTileWidget() {
    if (imageFile == null) {
      return Center(child: Text("No Data"));
    } else {
      return Center(
        child: Image.memory(imageFile, fit: BoxFit.cover),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTileWidget());
  }
}
