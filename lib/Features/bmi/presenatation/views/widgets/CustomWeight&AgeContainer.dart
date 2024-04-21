import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomIncrementDectrementtextbutton.dart';

class CustomWeightAgeConatiner extends StatelessWidget {
  const CustomWeightAgeConatiner(
      {super.key,
      required this.text,
      required this.incrementonPressed,
      required this.decrementonPressed,
      required this.value});
  final String text;
  final void Function() incrementonPressed;
  final void Function() decrementonPressed;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: Styles.styleBold24.copyWith(color: mainColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIncrementDecrementTextButton(
                text: '+',
                onPressed: incrementonPressed,
              ),
              Text(
                value,
                style:
                    Styles.styleBold24.copyWith(color: mainColor, fontSize: 30),
              ),
              CustomIncrementDecrementTextButton(
                text: '-',
                onPressed: decrementonPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
