import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/email_bloc/profile_email_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/change_password_alert.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/change_password_text.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/email_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/phone_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_appbar.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_pic_display.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/sizedbox_heading_textformfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/submit_button.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/username_display.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/username_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfilePhoneBloc>().add(ProfilPhoneEdit(editPressed: false));
    context
        .read<ProfileNameBloc>()
        .add(NameEditButtonPressed(editPressed: false));
    context
        .read<ProfileEmailBloc>()
        .add(EmailEditButtonPressed(editPressed: false));

    profilePhoneController.text =
        BlocProvider.of<ProfilePhoneBloc>(context).state.phone;
    profileNameController.text =
        BlocProvider.of<ProfileNameBloc>(context).state.name;
    profileEmailController.text =
        BlocProvider.of<ProfileEmailBloc>(context).state.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingAndLogoutButton(),
              SizedBox(
                height: mediaqueryHeight(0.04, context),
              ),
              Padding(
                padding: commonScreenPadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfilePictureDispaly(),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    const UserNameDisaply(),
                    SizedBox(
                      height: mediaqueryHeight(0.015, context),
                    ),
                    profilePageHeadings(context, "Name"),
                    spaceBetweenHeadingAndTextfield(context),
                    const UserNameTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.014, context),
                    ),
                    profilePageHeadings(context, "Phone"),
                    spaceBetweenHeadingAndTextfield(context),
                    const PhoneTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.014, context),
                    ),
                    profilePageHeadings(context, "Email"),
                    spaceBetweenHeadingAndTextfield(context),
                    const EmailTextField(),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                    GestureDetector(
                      onTap: () {
                        changePasswordAlert(context);
                      },
                      child: changePasswordText(context),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.04, context),
                    ),
                    const SubmitButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
