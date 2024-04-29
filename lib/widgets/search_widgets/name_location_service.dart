import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/search_page/shop_details.dart';

  Row shopServices(BuildContext context, int index) {
    return Row(
      children: [
        Icon(
          Icons.summarize_outlined,
          color: whiteColor,
          size: mediaqueryHeight(0.027, context),
        ),
        SizedBox(
          width: mediaqueryWidth(0.02, context),
        ),
        SizedBox(
            width: mediaqueryWidth(0.55, context),
            child: myFont(searchDisplayModelList[index].services.join(', '),
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.016, context),
                fontWeight: FontWeight.normal,
                fontColor: whiteColor))
      ],
    );
  }

  Row shopLocation(BuildContext context, int index) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: whiteColor,
          size: mediaqueryHeight(0.027, context),
        ),
        SizedBox(
          width: mediaqueryWidth(0.02, context),
        ),
        myFont(searchDisplayModelList[index].location,
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.016, context),
            fontWeight: FontWeight.normal,
            fontColor: whiteColor)
      ],
    );
  }

  Row shopName(BuildContext context, int index) {
    return Row(
      children: [
        Icon(
          Icons.store,
          color: whiteColor,
          size: mediaqueryHeight(0.027, context),
        ),
        SizedBox(
          width: mediaqueryWidth(0.02, context),
        ),
        myFont(searchDisplayModelList[index].shopName.toUpperCase(),
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.016, context),
            fontWeight: FontWeight.w600,
            fontColor: whiteColor)
      ],
    );
  }