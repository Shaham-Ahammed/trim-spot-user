import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/profile_save_button_bloc/profile_save_button_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';
import 'package:trim_spot_user_side/widgets/login_page_widgets/loading_indicator.dart';
import 'package:trim_spot_user_side/widgets/signup_screen/network_error_snackbar.dart';

class ProfileStateHandler{
  static void handleState(BuildContext context, ProfileSaveButtonState state){
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
  }
}