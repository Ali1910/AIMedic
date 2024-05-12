import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/utilts/constans.dart';

class CustomDeleteIcon extends StatelessWidget {
  const CustomDeleteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        FontAwesomeIcons.trashCan,
        color: mainColor,
      ),
    );
  }
}
