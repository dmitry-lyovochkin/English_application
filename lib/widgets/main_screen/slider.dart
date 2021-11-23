import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/english-app-9b2d0.appspot.com/o/ExamplePac%2Fdread.jpg?alt=media&token=449e01fd-c51a-47e9-b45e-878ff4b08588',
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

void main() => runApp(const CarouselDemo1());

final themeMode = ValueNotifier(2);

class CarouselDemo1 extends StatelessWidget {
  const CarouselDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          // initialRoute: '/fullscreen',
          // darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          home: const FullscreenSliderDemo(),
          // routes: {
          //   '/fullscreen': (ctx) => const FullscreenSliderDemo(),
          // },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  const DemoItem(this.title, this.route, {Key? key}) : super(key: key);
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class FullscreenSliderDemo extends StatelessWidget {
  const FullscreenSliderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: Builder(
        builder: (context) {
          // final height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: 600,
              viewportFraction: 1,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Center(
                        child: Image.network(
                      item,
                      fit: BoxFit.cover,
                      // height: 500,
                      // width: 600,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}
