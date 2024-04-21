import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_search_textFormFeild.dart';

class NewsFailBody extends StatelessWidget {
  const NewsFailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: mainColor),
        title: CustomSearchTextFeild(
          onSubmitted: (p) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const SearchResult();
            //     },
            //   ),
            // );
          },
        ),
      ),
      body: const Center(
        child: Text('حدث في الانترنت تاكد من الاتصال '),
      ),
    );
  }
}
