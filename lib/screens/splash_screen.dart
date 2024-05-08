import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/shared_preference/variables.dart';
import 'package:trim_spot_user_side/screens/bottom_navigation.dart';
import 'package:trim_spot_user_side/screens/introduction_page.dart';
import 'package:trim_spot_user_side/screens/login.dart';
import 'package:trim_spot_user_side/screens/login_or_signup.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/widgets/splash_screen_widgets/fade_transition_applogo.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkTheScreen(context);
    context.read<UserDetailsBloc>().add(FetchingUserDetailsFromFirebase());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/spalsh user.jpg",
                ))),
        child: FadeTansitionAppLogo(size: mediaqueryHeight(0.06, context)),
      )),
    );
  }
}

checkTheScreen(context) async {
  await Future.delayed(const Duration(milliseconds: 2500));
  final sharedPre = await SharedPreferences.getInstance();
  final newUser = sharedPre.getBool(firstTimeUser);
  if (newUser == true) {
    Navigator.of(context).pushReplacement(
        FadeTransitionPageRoute(child: FirstIntroductionPage()));
  } else {
    final loginStatus = sharedPre.getString(loggedInGmail);

    if (loginStatus == null) {
      Navigator.of(context).pushReplacement(
          FadeTransitionPageRoute(child: const LoginOrSignup()));
    } else if (loginStatus.isEmpty) {
      Navigator.of(context)
          .pushReplacement(FadeTransitionPageRoute(child: const LoginScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          FadeTransitionPageRoute(child: const BottomNavigationBarScreen()));
    }
  }
}
