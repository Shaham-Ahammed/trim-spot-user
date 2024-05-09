
import 'package:flutter/material.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

 
  @override
  Widget build(BuildContext context) {
    return 
         Container(
          height: mediaqueryHeight(0.06, context),
          decoration: BoxDecoration(
              color: greyColor3,
              borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.03, context)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  style: const TextStyle(
                      color: whiteColor,
                      fontFamily: b612),
                  decoration: const InputDecoration(border: InputBorder.none),
                  controller: profileEmailController,
                  cursorColor: Colors.blueGrey.shade200,
                  enableInteractiveSelection: false,
                  enabled:false,
                )),
              ],
            ),
          ),
        );
      
  }
}