import 'package:english_application/my_icons_icons.dart';
import 'package:english_application/theme.dart';
import 'package:flutter/material.dart';

class ButtonsDraw extends StatelessWidget {
  const ButtonsDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 5,
          left: 5,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              primary: ButtonColor.buttonColor,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 14,
              ),
            ),
            child: Row(
              children: const [
                Icon(MyIcons.home, size: 27),
              ],
            )
          )
        ),
        Positioned(
          top: 5,
          right: 5,
          child: ElevatedButton.icon(
            icon: const Icon(
              MyIcons.tick_circle,
              size: 27,
            ),
            label: const Text('Сохранить'),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(13),
              primary: ButtonColor.buttonColor,
              onPrimary: Colors.white
            ),
          )
        ),
        Positioned(
          bottom: 15,
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
              onPrimary: ButtonColor.buttonColor
            ),
            child: const Icon(MyIcons.voice, size: 27),
          )
        ),
      ],
    );
  }
}
