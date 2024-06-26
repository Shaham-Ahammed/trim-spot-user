import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/on_boarding_bloc/onboardind_bloc_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/onboarding/introduction_lists.dart';
import 'package:trim_spot_user_side/widgets/on_boarding_screen/curved_contianer.dart';
import 'package:trim_spot_user_side/widgets/on_boarding_screen/images.dart';
import 'package:trim_spot_user_side/widgets/on_boarding_screen/smoothanimation.dart';
import 'package:trim_spot_user_side/widgets/on_boarding_screen/state_handler/state_handler.dart';
import 'package:trim_spot_user_side/widgets/on_boarding_screen/title_and_description.dart';

class FirstIntroductionPage extends StatelessWidget {
  FirstIntroductionPage({super.key});

  final controller = InroductionItems();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardindBloc, OnboardindBlocState>(
      listener: (context, state) {
        OnBoardingStateHandler.handlerState(context, state, pageController);
      },
      child: Scaffold(
        backgroundColor: blackColor,
          bottomSheet: SmoothPageIndincatorAndNextButton(
              pageController: pageController, controller: controller),
          body: PageView.builder(
            controller: pageController,
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  BoardingScreenImages(
                    controller: controller,
                    index: index,
                  ),
                  const OnBoardingTextAreaContainer(),
                  OnBoardingTitle(
                    controller: controller,
                    index: index,
                  ),
                  OnBoardingTitle2(
                    controller: controller,
                    index: index,
                  ),
                  OnBoardingDescription(
                    controller: controller,
                    index: index,
                  ),
                ],
              );
            },
          )),
    );
  }
}
