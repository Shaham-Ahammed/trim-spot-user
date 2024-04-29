import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/search_page/shop_details.dart';

  Container searchShopImage(BuildContext context, int index) {
    return Container(
      height: double.infinity,
      width: mediaqueryWidth(0.25, context),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(searchDisplayModelList[index].shopImage),
        ),
      ),
    );
  }