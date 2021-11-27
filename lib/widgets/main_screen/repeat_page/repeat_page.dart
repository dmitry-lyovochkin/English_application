// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

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
//   Stream? slides;

//   Stream? _queryDb() {
//     slides = FirebaseFirestore.instance
//         .collection('stories')
//         .snapshots()
//         .map((list) => list.docs.map((doc) => doc.data()));
//   }

//   @override
//   void initState() {
//     _queryDb();
//     super.initState();
//   }

//   final PageController controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//           stream: slides,
//           builder: (context, AsyncSnapshot snap) {
//             final List slideList = snap.data.toList();

//             if (snap.hasError) {
//               return Text(snap.error);
//             }
//             if (snap.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             }
//             return PageView.builder(
//                 controller: controller,
//                 itemCount: slideList.length,
//                 itemBuilder: (context, int index) {
//                   return _BuildStorePage(slideList[index]);
//                 });
//           }),
//     );
//   }

//   Container _BuildStorePage(Map<dynamic, dynamic> data) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(data['img']),
//         ),
//       ),
//       child: Center(
//         child: Text(
//           data['title'],
//           style: const TextStyle(
//             fontSize: 40,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   })
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:english_application/theme.dart';
// import 'package:flutter/material.dart';

// final List<String> imgList = [
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdrought.jpg?alt=media&token=5da7e5cc-ec0a-4eb0-9386-caaa0ffdeada',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Ffine.jpg?alt=media&token=280debb3-f6c1-4c9b-aaa3-1bb4eb0d6a4e',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgoal.jpg?alt=media&token=2677924e-0296-4cb2-8938-ef6f16bacafd',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgrab.jpg?alt=media&token=f5ed0e6a-ea8f-4699-8c2e-502d804526b5',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Flook%20after.jpg?alt=media&token=1e57f321-1837-4a8e-9d99-936009365781',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fmug.jpg?alt=media&token=4a265f7c-1b31-40f3-a729-977b1737ce6b',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Frule.jpg?alt=media&token=425e94f4-912b-409a-9e98-965c760c0656',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fsloppy.jpg?alt=media&token=a6151045-1655-4a89-8e7c-20a608cfc886',
//   'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fwall.jpg?alt=media&token=fa41d6f8-3eea-4137-9aae-da9646a79656',
// ];

// void main() => runApp(CarouselDemo());

// final themeMode = ValueNotifier(2);

// class CarouselDemo2 extends StatelessWidget {
//   const CarouselDemo2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       builder: (context, value, g) {
//         return MaterialApp(
//           initialRoute: '/',
//           // darkTheme: ThemeData.dark(),
//           // themeMode: ThemeMode.values.toList()[value as int],
//           debugShowCheckedModeBanner: false,
//           routes: {
//             '/': (ctx) =>  const ManuallyControlledSlider(),
//           },
//         );
//       },
//       valueListenable: themeMode,
//     );
//   }
// }

// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//       margin: const EdgeInsets.all(5),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//           child: Stack(
//             children: <Widget>[
//               Image.network(item, fit: BoxFit.cover, width: 1000),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 // child: Container(
//                 //   decoration: const BoxDecoration(
//                 //     gradient: LinearGradient(
//                 //       colors: [
//                 //         Color.fromARGB(200, 0, 0, 0),
//                 //         Color.fromARGB(0, 0, 0, 0)
//                 //       ],
//                 //       begin: Alignment.bottomCenter,
//                 //       end: Alignment.topCenter,
//                 //     ),
//                 //   ),
//                   // padding: const EdgeInsets.symmetric(
//                   //     vertical: 10, horizontal: 20),
//                   child: Text(
//                     '"Слово". ${imgList.indexOf(item)}',
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 10,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                 ),

//             ],
//           )),
//     ))
//     .toList();

// class ManuallyControlledSlider extends StatefulWidget {
//   const ManuallyControlledSlider({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _ManuallyControlledSliderState();
//   }
// }

// class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
//   final CarouselController _controller = CarouselController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(title: Text('Manually controlled slider')),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               CarouselSlider(
//                 items: imageSliders,
//                 options: CarouselOptions(enlargeCenterPage: true, height: 200),
//                 carouselController: _controller,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Flexible(
//                     child: IconButton(
//                       onPressed: _controller.previousPage,
//                       icon: const Icon(Icons.arrow_back),
//                       color: AppColors.mainColorApp,
//                     ),
//                   ),
//                   Flexible(
//                     child: IconButton(
//                       onPressed: _controller.nextPage,
//                       icon: const Icon(Icons.arrow_forward),
//                       color: AppColors.mainColorApp,
//                     ),
//                   ),
//                   ...Iterable<int>.generate(imgList.length).map(
//                     (int pageIndex) => Flexible(
//                       child: TextButton(
//                         onPressed: () => _controller.animateToPage(pageIndex),
//                         child: Text('$pageIndex'),
//                         style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                             const Color.fromRGBO(255, 255, 255, 255)),
//                         foregroundColor:
//                             MaterialStateProperty.all(const Color.fromRGBO(121, 104, 216, 100)),
//                         textStyle: MaterialStateProperty.all(
//                           const TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.w700),
//                         ),
//                         // padding: MaterialStateProperty.all(
//                         //     const EdgeInsets.symmetric(
//                         //         horizontal: 10, vertical: 5)),
//                       ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class MainPage1 extends StatefulWidget {
//   const MainPage1({Key? key}) : super(key: key);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage1> {
//   final urlImages = [
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdrought.jpg?alt=media&token=5da7e5cc-ec0a-4eb0-9386-caaa0ffdeada',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Ffine.jpg?alt=media&token=280debb3-f6c1-4c9b-aaa3-1bb4eb0d6a4e',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgoal.jpg?alt=media&token=2677924e-0296-4cb2-8938-ef6f16bacafd',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgrab.jpg?alt=media&token=f5ed0e6a-ea8f-4699-8c2e-502d804526b5',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Flook%20after.jpg?alt=media&token=1e57f321-1837-4a8e-9d99-936009365781',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fmug.jpg?alt=media&token=4a265f7c-1b31-40f3-a729-977b1737ce6b',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Frule.jpg?alt=media&token=425e94f4-912b-409a-9e98-965c760c0656',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fsloppy.jpg?alt=media&token=a6151045-1655-4a89-8e7c-20a608cfc886',
//     'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fwall.jpg?alt=media&token=fa41d6f8-3eea-4137-9aae-da9646a79656',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CarouselSlider.builder(
//             options: CarouselOptions(
//               height: 400,
//               initialPage: 0, /* какая картинка будет отображаться */
//               viewportFraction: 1,
//               // enlargeCenterPage: true увеличит текущее фото, анимация
//               enableInfiniteScroll: false /* стоп на прокрутку */
//             ),
//             itemCount: urlImages.length,
//             itemBuilder: (content, index, realIndex) {
//               final urlImage = urlImages[index];
//               return buildImage(urlImage, index);
//             }),
//       ),
//     );
//   }

//   Widget buildImage(String urlImage, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12),
//       color: Colors.grey,
//       width: double.infinity,
//       child: Image.network(
//         urlImage,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage2> {
  final controller = CarouselController();
  int activateIndex = 0;
  final urlImages = [
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdrought.jpg?alt=media&token=5da7e5cc-ec0a-4eb0-9386-caaa0ffdeada',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Ffine.jpg?alt=media&token=280debb3-f6c1-4c9b-aaa3-1bb4eb0d6a4e',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgoal.jpg?alt=media&token=2677924e-0296-4cb2-8938-ef6f16bacafd',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fgrab.jpg?alt=media&token=f5ed0e6a-ea8f-4699-8c2e-502d804526b5',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Flook%20after.jpg?alt=media&token=1e57f321-1837-4a8e-9d99-936009365781',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fmug.jpg?alt=media&token=4a265f7c-1b31-40f3-a729-977b1737ce6b',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Frule.jpg?alt=media&token=425e94f4-912b-409a-9e98-965c760c0656',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fsloppy.jpg?alt=media&token=a6151045-1655-4a89-8e7c-20a608cfc886',
    'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fwall.jpg?alt=media&token=fa41d6f8-3eea-4137-9aae-da9646a79656',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImageSlider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
              child: buildButtons(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImageSlider() => CarouselSlider.builder(
        carouselController: controller,
        options: CarouselOptions(
            height: 200,
            initialPage: 0,
            /* какая картинка будет отображаться */
            viewportFraction: 1,
            // enlargeCenterPage: true увеличит текущее фото, анимация
            enableInfiniteScroll: false /* стоп на прокрутку */
            ),
        itemCount: urlImages.length,
        itemBuilder: (content, index, realIndex) {
          final urlImage = urlImages[index];
          return buildImage(urlImage, index);
        },
      );

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 52),
      color: Colors.grey,
      width: double.infinity,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildButtons({bool stretch = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          ),
          onPressed: previous,
          child: const Icon(
            Icons.arrow_back_ios,
            size: 22
          ),
        ),
        if (stretch) const Spacer() else const SizedBox(width: 30),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          ),
          onPressed: next,
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 22
          ),
        ),
      ]
    );
  }

  void previous() => controller.previousPage();

  void next() => controller.nextPage();
}
