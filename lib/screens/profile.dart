// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/repository/network_stream.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/no_network.dart';
import 'package:trim_spot_user_side/utils/profile_screen/formkey.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/password_widgets/change_password_alert.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/password_widgets/change_password_text.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/initstate/initializing.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/email_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/phone_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_appbar.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_pic_display.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/sizedbox_heading_textformfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/state_handler/state_hanlder.dart';
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
    initializationInProfileScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileSaveButtonBloc(),
      child: BlocListener<ProfileSaveButtonBloc, ProfileSaveButtonState>(
        listener: (context, state) {
          ProfileStateHandler.handleState(context, state);
        },
        child: Scaffold(
          backgroundColor: blackColor,
          body: SafeArea(
            child: StreamBuilder<bool>(
                stream: checkInternetconnectivity(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }

                  if (!snapshot.data!) {
                    return const NoNetworkDisplayWidget();
                  }
                  return SingleChildScrollView(
                    child: Form(
                      key: profileFormKey,
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
                                BlocBuilder<UserDetailsBloc, UserDetailsState>(
                                  builder: (context, state) {
                                    return state.emailRegistered
                                        ? GestureDetector(
                                            onTap: () {
                                              changePasswordAlert(context);
                                            },
                                            child: changePasswordText(context),
                                          )
                                        : Container();
                                  },
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
                  );
                }),
          ),
        ),
      ),
    );
  }
}
