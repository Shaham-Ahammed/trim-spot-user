import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';

import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePhoneBloc, ProfilePhoneState>(
      builder: (context, state) {
        return Container(
          height: mediaqueryHeight(0.06, context),
          decoration: BoxDecoration(
              color: state.editPressed ? whiteColor : greyColor3,
              borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.03, context)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your phone number";
                    } else if (value.length < 10) {
                      return "enter a valid number";
                    }

                    return null;
                  },
                  style: TextStyle(
                      color: state.editPressed ? blackColor : whiteColor,
                      fontFamily: b612),
                  decoration: InputDecoration(
                    counterText: "",
                      contentPadding: EdgeInsets.symmetric(
                          vertical: mediaqueryHeight(0.0072, context)),
                      border: InputBorder.none),
                  controller: profilePhoneController,
                  cursorColor: Colors.blueGrey.shade200,
                  enableInteractiveSelection: false,
                  enabled: state.editPressed,
                )),
                GestureDetector(
                    onTap: () {
                      context
                          .read<ProfilePhoneBloc>()
                          .add(ProfilPhoneEditButtonPressed(editPressed: true));
                    },
                    child: const Icon(Icons.edit))
              ],
            ),
          ),
        );
      },
    );
  }
}
