import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/heading.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/search_contianer.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/search_result_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: commonScreenPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchHeading(context),
              SizedBox(
                height: mediaqueryHeight(0.016, context),
              ),
              const SearchField(),
              SizedBox(
                height: mediaqueryHeight(0.03, context),
              ),
              Expanded(
                child: searchResultDisplay(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
