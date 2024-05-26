import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedLabelStyle: Styles.style13,
          unselectedLabelStyle: Styles.style13.copyWith(fontSize: 12),
          iconSize: 20.w,
          enableFeedback: false,
          elevation: 0,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            BlocProvider.of<MainCubit>(context).tapped(index);
          },
          currentIndex: BlocProvider.of<MainCubit>(context).currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.question), label: 'سؤال وجواب'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userGear), label: 'حسابك'),
          ],
        );
      },
    );
  }
}
