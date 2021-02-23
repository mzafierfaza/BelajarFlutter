import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attack on Titan Fandom",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lime[700],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal, Colors.deepOrange[300]],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 16,
                child: Stack(
                  children: [
                    Opacity(
                        opacity: 0.05,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: AssetImage("images/pattern_aot.jpg"),
                                fit: BoxFit.fitHeight,
                              )),
                        )),
                    Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4)),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/marleyan.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          20 + MediaQuery.of(context).size.height * 0.35,
                          20,
                          20),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Potret marleyan yang polos sebelum di cuci otak",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
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
                                Icon(Icons.thumb_up,
                                    size: 20, color: Colors.grey),
                                Spacer(flex: 1),
                                Text("666",
                                    style: TextStyle(color: Colors.grey)),
                                Spacer(flex: 6),
                                Icon(Icons.comment,
                                    size: 20, color: Colors.grey),
                                Spacer(flex: 1),
                                Text("70",
                                    style: TextStyle(color: Colors.grey)),
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
