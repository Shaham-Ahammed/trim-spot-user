import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/screens/search_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/home/categorie_lists.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

Row secongThreeCategories(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:
        List.generate(3, (index) => categorieItemsWidget(context, index + 3)),
  );
}

Row firstThreeCategories(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(3, (index) => categorieItemsWidget(context, index)),
  );
}

GestureDetector categorieItemsWidget(BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchScreen(
          autoFocus: false,
          backButtonNeeded: true,
          service: categoryNames[index],
        ),
      ));
    },
    child: Column(
      children: [
        Container(
          width: mediaqueryWidth(0.23, context),
          height: mediaqueryWidth(0.23, context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(categoryImages[index]),
              )),
        ),
        SizedBox(
          height: mediaqueryHeight(0.01, context),
        ),
        myFont(categoryNames[index],
            fontFamily: balooChettan,
            fontSize: mediaqueryHeight(0.019, context),
            fontWeight: FontWeight.w500,
            fontColor: whiteColor)
      ],
    ),
  );
}
