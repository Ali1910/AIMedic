import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';

import 'package:gbsub/Features/Home/Ui/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            // appBar: AppBar(
            //   elevation: 0,
            //   actions: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         FontAwesomeIcons.envelope,
            //         color: mainColor,
            //       ),
            //     ),
            //   ],
            //   backgroundColor: Colors.white,
            //   centerTitle: true,
            //   title: Text(
            //     'صحي',
            //     style: Styles.styleBold24.copyWith(color: mainColor),
            //   ),
            // ),
            body: BlocBuilder<MainCubit, MainStates>(
              builder: (context, state) {
                var myblocprovider = BlocProvider.of<MainCubit>(context);
                return myblocprovider
                    .bottomnavigationbarviews[myblocprovider.currentIndex];
              },
            ),
            bottomNavigationBar: const CustomBottomNavBar(),
          ),
        ),
      ),
    );
  }
}
