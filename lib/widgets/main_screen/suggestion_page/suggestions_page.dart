 import 'dart:io';

 import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
 import 'package:firebase_storage/firebase_storage.dart';
 import 'package:flutter/material.dart';

 firebase_storage.FirebaseStorage storage =
   firebase_storage.FirebaseStorage.instance;

 

final List<String> imagesList = [
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/dread.jpg?alt=media&token=9e75ec06-559d-4f5c-af9c-eaed463591c6',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/dread.jpg?alt=media&token=9e75ec06-559d-4f5c-af9c-eaed463591c6',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/dread.jpg?alt=media&token=9e75ec06-559d-4f5c-af9c-eaed463591c6',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/dread.jpg?alt=media&token=9e75ec06-559d-4f5c-af9c-eaed463591c6',
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/dread.jpg?alt=media&token=9e75ec06-559d-4f5c-af9c-eaed463591c6',
];

final List<String> titles = [
  ' Coffee ',
  ' Bread ',
  ' Gelato ',
  ' Ice Cream ',
];

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carousel with indicator demo'),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: imagesList
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        elevation: 6.0,
                        shadowColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              Center(
                                child: Text(
                                  '${titles[_currentIndex]}',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.black45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class MyApp1 extends StatelessWidget {
//   const MyApp1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: FirestoreSlideshow(),
//     );
//   }
// }

// class FirestoreSlideshow extends StatefulWidget {
//   const FirestoreSlideshow({Key? key}) : super(key: key);

//   @override
//   _FirestoreSlideshowState createState() => _FirestoreSlideshowState();
// }

// class _FirestoreSlideshowState extends State<FirestoreSlideshow> {
//   Stream slides;
//   Stream _queryDb() {
//     slides = FirebaseFirestore.instance
//         .collection('stores')
//         .snapshots()
//         .map((list) => list.docs.map((doc) => doc.data()));
//   }

//   @override
//     void initState() {
//       _queryDb();
//       super.initState();
//     }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: slides,
//         builder: (context, AsyncSnapshot snap),),
//     );
//   }
// }
