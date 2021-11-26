// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// final List<String> imgList = [
//   // 'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdread.jpg?alt=media&token=449e01fd-c51a-47e9-b45e-878ff4b08588',
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

// void main() => runApp(const CarouselDemo1());

// final themeMode = ValueNotifier(2);

// class CarouselDemo1 extends StatelessWidget {
//   const CarouselDemo1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       builder: (context, value, g) {
//         return MaterialApp(
//           // initialRoute: '/fullscreen',
//           // darkTheme: ThemeData.dark(),
//           themeMode: ThemeMode.values.toList()[value as int],
//           debugShowCheckedModeBanner: false,
//           home: const FullscreenSliderDemo(),
//           // routes: {
//           //   '/fullscreen': (ctx) => const FullscreenSliderDemo(),
//           // },
//         );
//       },
//       valueListenable: themeMode,
//     );
//   }
// }

// class FullscreenSliderDemo extends StatelessWidget {
//   const FullscreenSliderDemo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
//       body: Builder(
//         builder: (context) {
//           // final height = MediaQuery.of(context).size.height;
//           return CarouselSlider(
//             options: CarouselOptions(
//               height: 600,
//               viewportFraction: 1,
//               // autoPlay: false,
//             ),
//             items: imgList
//                 .map((item) => Center(
//                         child: Image.network(
//                       item,
//                       fit: BoxFit.cover,
//                       // height: 500,
//                       // width: 600,
//                     )))
//                 .toList(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  // 'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdread1.png?alt=media&token=aea4bfdd-cadd-46ba-a94d-0993a4bf7d1b',
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

// void main() => runApp(CarouselDemo());

final themeMode = ValueNotifier(2);

class CarouselDemo1 extends StatelessWidget {
  const CarouselDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          // darkTheme: ThemeData.dark(),
          // themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => const ManuallyControlledSlider(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => Center(
        child: ClipRRect(
            child: Center(
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, height: 260, width: 500),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                // child: Container(
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Color.fromARGB(200, 0, 0, 0),
                //         Color.fromARGB(0, 0, 0, 0)
                //       ],
                //       begin: Alignment.bottomCenter,
                //       end: Alignment.topCenter,
                //     ),
                //   ),
                // padding: const EdgeInsets.symmetric(
                //     vertical: 10, horizontal: 20),
                child: Text(
                  '"Слово". ${imgList.indexOf(item)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    )
    .toList();

class ManuallyControlledSlider extends StatefulWidget {
  const ManuallyControlledSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Manually controlled slider')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                enlargeCenterPage: true, 
                viewportFraction: 1, 
                height: 400
              ),
              carouselController: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: _controller.previousPage,
                  icon: const Icon(Icons.arrow_back),
                  color: AppColors.mainColorApp,
                ),
                IconButton(
                  onPressed: _controller.nextPage,
                  icon: const Icon(Icons.arrow_forward),
                  color: AppColors.mainColorApp,
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
