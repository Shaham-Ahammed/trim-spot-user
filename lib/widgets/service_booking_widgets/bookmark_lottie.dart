import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trim_spot_user_side/blocs/bookmark_animation_bloc/book_mark_animation_bloc.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/service_booking/animation_controller.dart';

class BookmarkAnimationLottie extends StatefulWidget {
  final String shopId;
  const BookmarkAnimationLottie({
    super.key,
    required this.shopId,
  });

  @override
  State<BookmarkAnimationLottie> createState() =>
      _BookmarkAnimationLottieState();
}

class _BookmarkAnimationLottieState extends State<BookmarkAnimationLottie> {
  @override
  void initState() {
    context
        .read<BookMarkAnimationBloc>()
        .add(CheckingShopIsBookmarked(shopId: widget.shopId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: mediaqueryWidth(0.08, context),
      bottom: mediaqueryHeight(-0.01, context),
      child: GestureDetector(
        onTap: () {
          context
              .read<BookMarkAnimationBloc>()
              .add(BookMarkPressed(shopId: widget.shopId, context: context));
        },
        child: Transform.scale(
          scaleY: mediaqueryHeight(0.0014, context),
          child: LottieBuilder.asset(controller: bookmarkAnimationController,
              onLoaded: (composition) {
            bookmarkAnimationController.duration = composition.duration;
          }, repeat: false, "assets/animations/bookmark_lottie.json"),
        ),
      ),
    );
  }
}
