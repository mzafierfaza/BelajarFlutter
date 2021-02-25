// import 'dart:html';
// import 'dart:js';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'business_logic.dart';
import 'home_model.dart';

class SimpleBlockObserver extends BlocObserver {}

void main() async {
  Bloc.observer = SimpleBlockObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget makeImagesGrid() {
    return GridView.builder(
        itemCount: 12,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return ImageGridItem(index);
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        home: Center(
          child: BlocProvider(
            create: (context) => ChangeHome(
              RepositoryHome(
                changeHomeProvider: ChangeHomeProvider(
                  homePage: HomePage.HomeGraph,
                ),
              ),
            ),
            child: BlocBuilder<ChangeHome, int>(
              builder: (context, state) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text("JobSeek"),
                  ),
                  body: IndexedStack(
                    index: state,
                    children: [
                      Container(
                        // child: Text("Dashboard"),
                        child: makeImagesGrid(),
                      ),
                      Center(
                        child: Text("Filter"),
                      ),
                      Center(
                        child: Text("Saved"),
                      ),
                      Center(
                        child: Text("Account"),
                      ),
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: state,
                    onTap: (value) {
                      context.bloc<ChangeHome>().add(
                            value == 0
                                ? HomePage.HomePopular
                                : value == 1
                                    ? HomePage.HomeGraph
                                    : value == 2
                                        ? HomePage.HomeHistory
                                        : HomePage.HomeSetting,
                          );
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.dashboard,
                          color: Colors.black38,
                        ),
                        // ignore: deprecated_member_use
                        title: Text("Dashboard",
                            style: TextStyle(color: Colors.black)),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.black38,
                        ),
                        // ignore: deprecated_member_use
                        title: Text("Filter",
                            style: TextStyle(color: Colors.black)),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.saved_search,
                          color: Colors.black38,
                        ),
                        // ignore: deprecated_member_use
                        title: Text("Saved",
                            style: TextStyle(color: Colors.black)),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.black38,
                        ),
                        // ignore: deprecated_member_use
                        title: Text(
                          "Account",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData();
}

// ========================

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
  Reference photosReferences = FirebaseStorage.instance.ref().child("images");

  getImage() {
    int maxsize = 7 * 1024 * 1024;
    photosReferences
        .child("images_${widget._index}.jpg")
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
      return Image.memory(
        imageFile,
        fit: BoxFit.cover,
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
