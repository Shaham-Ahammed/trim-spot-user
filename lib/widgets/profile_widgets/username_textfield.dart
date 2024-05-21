import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileNameBloc, ProfileNameState>(
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "please enter a name";
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: state.editPressed ? blackColor : whiteColor,
                      fontFamily: b612),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: mediaqueryHeight(0.0072, context)),
                      border: InputBorder.none),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$'))
                  ],
                  controller: profileNameController,
                  cursorColor: Colors.blueGrey.shade200,
                  enableInteractiveSelection: false,
                  enabled: state.editPressed,
                )),
                GestureDetector(
                    onTap: () {
                      context
                          .read<ProfileNameBloc>()
                          .add(NameEditButtonPressed(editPressed: true));
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
