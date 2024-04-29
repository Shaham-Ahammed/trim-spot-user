import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/close_button.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/divider.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/listtile_items.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/profile_image.dart';
import 'package:trim_spot_user_side/widgets/drawer_home/user_details.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: Column(
          children: [
            const CloseButtonDrawer(),
            Row(
              children: [
                const Stack(
                  children: [
                    ProfileImageDisplay(),
                    ProfileImageEditButton()
                  ],
                ),
                SizedBox(
                  width: mediaqueryHeight(0.02, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userName(context),
                    userEmail(context),
                    userPhone(context),
                  ],
                )
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            const DrawerDivider(),
            SizedBox(
              height: mediaqueryHeight(0.01, context),
            ),
           listviewDrawerHome(context),
           
          ],
        ),
      ),
    );
  }
}

