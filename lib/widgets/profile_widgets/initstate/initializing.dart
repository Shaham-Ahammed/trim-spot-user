import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/name_bloc/profile_name_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/phone_bloc/profile_phone_bloc.dart';
import 'package:trim_spot_user_side/blocs/profile_blocs/user_profile_image_bloc/profile_user_image_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/utils/profile_screen/controllers.dart';

initializationInProfileScreen(BuildContext context){
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
}