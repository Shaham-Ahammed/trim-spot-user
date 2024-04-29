import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/customer_support/appbar.dart';
import 'package:trim_spot_user_side/widgets/customer_support/heading.dart';
import 'package:trim_spot_user_side/widgets/customer_support/list_tiles.dart';

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: appBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mediaqueryHeight(0.028, context),
              vertical: mediaqueryHeight(0.01, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customerSupporText(),
              SizedBox(
                height: mediaqueryHeight(0.041, context),
              ),
              heading(context),
              SizedBox(height: mediaqueryHeight(0.016, context)),
              callListTile(context),
              emailListTile(context)
            ],
          ),
        ),
      ),
    );
  }



 
}
