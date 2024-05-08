import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_user_side/utils/profile_screen/formkey.dart';
import 'package:trim_spot_user_side/utils/screen_padding.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/password_widgets/change_password_alert.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/password_widgets/change_password_text.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/email_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/headings.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/phone_textfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_appbar.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/profile_pic_display.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/sizedbox_heading_textformfield.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/submit_button.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/username_display.dart';
import 'package:trim_spot_user_side/widgets/profile_widgets/username_textfield.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileUserImageBloc>().add(FetchUserProfileImage());

    context.read<UserDetailsBloc>().add(FetchingUserDetailsFromFirebase());

    context
        .read<ProfileNameBloc>()
        .add(NameEditButtonPressed(editPressed: false));
    context
        .read<ProfilePhoneBloc>()
        .add(ProfilPhoneEditButtonPressed(editPressed: false));

    profilePhoneController.text =
        BlocProvider.of<UserDetailsBloc>(context).state.phone;
    profileNameController.text =
        BlocProvider.of<UserDetailsBloc>(context).state.userName;
    profileEmailController.text =
        BlocProvider.of<UserDetailsBloc>(context).state.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileSaveButtonBloc(),
      child: BlocListener<ProfileSaveButtonBloc, ProfileSaveButtonState>(
        listener: (context, state) {
          if (state is ProfileUpdating) {
            loadingIndicator(context);
          }
          if (state is ProfileUpdationFinished) {
            context.read<ProfileUserImageBloc>().add(FetchUserProfileImage());

            context
                .read<UserDetailsBloc>()
                .add(FetchingUserDetailsFromFirebase());

            context
                .read<ProfileNameBloc>()
                .add(NameEditButtonPressed(editPressed: false));
            context
                .read<ProfilePhoneBloc>()
                .add(ProfilPhoneEditButtonPressed(editPressed: false));

            profilePhoneController.text =
                context.watch<UserDetailsBloc>().state.phone;
            profileNameController.text =
                context.watch<UserDetailsBloc>().state.userName;
          }

          if (state is NetworkErrorWhileUpdatingProfile) {
            ScaffoldMessenger.of(context)
                .showSnackBar(networkErrorSnackbar(context));
          }
        },
        child: Scaffold(
          backgroundColor: blackColor,
          body: SafeArea(
            child: SingleChildScrollView(
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
                              return state.password.isEmpty
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        changePasswordAlert(context);
                                      },
                                      child: changePasswordText(context),
                                    );
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
            ),
          ),
        ),
      ),
    );
  }
}
