import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainPage4 extends StatefulWidget {
  const MainPage4({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage4> {
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
    return const Scaffold(
       body: Center(child: Text('Profgregerile', style: TextStyle(fontSize: 54)))
    );
  }
}
  //     body: Center(
  //       child: Stack(
  //         // mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const FoneBcc(),
  //           buildImageSlider(),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(4, 150, 4, 0),
  //             child: buildButtons(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

//   @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.bottom]);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
//     super.dispose();
//   }

//   Widget buildImageSlider() => CarouselSlider.builder(
//         carouselController: controller,
//         options: CarouselOptions(
//             height: 360,
//             initialPage: 0,
//             /* ?????????? ???????????????? ?????????? ???????????????????????? */
//             viewportFraction: 1,
//             // enlargeCenterPage: true ???????????????? ?????????????? ????????, ????????????????
//             enableInfiniteScroll: false /* ???????? ???? ?????????????????? */
//             ),
//         itemCount: urlImages.length,
//         itemBuilder: (content, index, realIndex) {
//           final urlImage = urlImages[index];
//           return buildImage(urlImage, index);
//         },
//       );

//   Widget buildImage(String urlImage, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//       // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
//       width: double.infinity,
//       child: Image.network(
//         urlImage,
//         fit: BoxFit.cover,
//       ),
//     );
//   }

//   Widget buildButtons({bool stretch = false}) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       IconButton(
//         onPressed: previous,
//         icon: const Icon(Icons.arrow_back_ios_rounded),
//         color: AppColors.mainColorApp,
//       ),
//       IconButton(
//         onPressed: next,
//         icon: const Icon(Icons.arrow_forward_ios_rounded),
//         color: AppColors.mainColorApp,
//       ),
//     ]);
//   }

//   void previous() => controller.previousPage();

//   void next() => controller.nextPage();
// }


// class FoneBcc extends StatelessWidget {
//   const FoneBcc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(color: Colors.white),
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 34),
//     );
//   }
// }