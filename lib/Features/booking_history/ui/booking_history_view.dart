import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_body_cancelled%20copy.dart';
import 'package:gbsub/Features/booking_history/ui/booking_history_body_not_cancelled.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/custom_tab.dart';

class BookingHistoryView extends StatelessWidget {
  const BookingHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: mainColor),
            title: Text(
              "سجل الحجوزات",
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: mainColor,
              indicatorColor: mainColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                CystomBookingViewTap(
                  text: 'الحجوزات القادمة',
                ),
                CystomBookingViewTap(
                  text: 'الحجوزات الملغية',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              ListOfPersonalRecord(),
              ListOfCancelledPersonalRecord(),
            ],
          ),
        ),
      ),
    );
  }
}
