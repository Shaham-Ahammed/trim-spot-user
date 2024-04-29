import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 105, 105, 105),
            borderRadius: BorderRadius.circular(90),
            border: Border.all(color: greyColor2, width: 2)),
        width: double.infinity,
        height: mediaqueryHeight(0.05, context),
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.024, context)),
          child: Row(
            children: [
              myFont("search salon, service....",
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.02, context),
                  fontWeight: FontWeight.normal,
                  fontColor: greyColor),
              const Spacer(),
              Icon(
                Icons.search,
                size: mediaqueryHeight(0.03, context),
                color: greyColor2,
              )
            ],
          ),
        ));
  }
}