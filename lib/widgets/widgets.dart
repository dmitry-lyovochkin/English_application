import 'package:english_application/my_icons_icons.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.all(Radius.circular(25))),
      // margin: const EdgeInsets.all(10),
      body: Stack(
       children: [
         Positioned(
          top: 5,
          left: 5,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              // minimumSize: const Size(55, 45),
              primary: ButtonColor.buttonColor,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 14,
              ),
            ),
            child: Row(
              children: const [
                Icon(MyIcons.home),
              ],
          )),),
            Positioned(
                top: 5,
                right: 5,
                child: ElevatedButton.icon(
                  icon: const Icon(MyIcons.tick_circle),
                  label: const Text('Сохранить'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(13),
                      primary: ButtonColor.buttonColor,
                      onPrimary: Colors.white),
                )),
          Positioned(
            bottom: 20,
            right: 70,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 13,
                  ),
                  primary: Colors.white,
                  onPrimary: ButtonColor.buttonColor),
              child: const Icon(MyIcons.vector),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 14,
                    ),
                    primary: Colors.white,
                    onPrimary: ButtonColor.buttonColor),
                child: const Icon(MyIcons.voice),
              )
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 14,
                  ),
                  primary: Colors.white,
                  onPrimary: ButtonColor.buttonColor),
              child: const Icon(MyIcons.vector_1_),
            ),
          ),
       ]));
  }
}