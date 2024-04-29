import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

ListTile emailListTile(BuildContext context) {
  return customerSupportListTiles(context,
      heading: "Email",
      icon: Icons.email_outlined,
      subtitle: "shahamahammed66@gmail.com");
}

ListTile callListTile(BuildContext context) {
  return customerSupportListTiles(context,
      heading: "Contact Number",
      icon: Icons.call_outlined,
      subtitle: "+91 9961628586");
}

ListTile customerSupportListTiles(BuildContext context,
    {required IconData icon,
    required String heading,
    required String subtitle}) {
  return ListTile(
    onTap: () {},
    contentPadding: EdgeInsets.zero,
    leading: Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: cyanColor, width: 2)),
      child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.018, context)),
        child: Icon(
          icon,
          color: whiteColor,
        ),
      ),
    ),
    titleAlignment: ListTileTitleAlignment.top,
    title: myFont(heading,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.017, context),
        fontWeight: FontWeight.normal,
        fontColor: subTitlesTextGrey),
    subtitle: myFont(subtitle,
        fontFamily: balooChettan,
        fontSize: mediaqueryHeight(0.021, context),
        fontWeight: FontWeight.w400,
        fontColor: whiteColor),
  );
}
