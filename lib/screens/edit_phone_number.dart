import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/profile_edit_phone_widgets/appbar.dart';
import 'package:trim_spot_user_side/widgets/profile_edit_phone_widgets/captions.dart';
import 'package:trim_spot_user_side/widgets/profile_edit_phone_widgets/textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_edit_phone_widgets/verify_button.dart';

class EditPhoneScreen extends StatelessWidget {
  const EditPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: appBarEditPhone(context),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              caption(context),
              SizedBox(
                height: mediaqueryHeight(0.016, context),
              ),
              const Textfield(),
              SizedBox(
                height: mediaqueryHeight(0.65, context),
              ),
              const VerifyButton()
            ],
          ),
        ),
      )),
    );
  }

}

