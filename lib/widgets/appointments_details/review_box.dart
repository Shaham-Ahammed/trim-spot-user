import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/rating_stars_bloc/rating_stars_bloc.dart';
import 'package:trim_spot_user_side/blocs/review_and_rating/review_and_rating_bloc.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/rate_and_review/controller.dart';

Future<dynamic> reviewDialogue(
    BuildContext context, QueryDocumentSnapshot<Object?> bookingDetails) {
  return showDialog(
    context: context,
    builder: (context) {
      reviewController.clear();
      return BlocProvider(
        create: (context) => RatingStarsBloc(),
        child: Dialog(
          child: Container(
            padding: EdgeInsets.all(mediaqueryHeight(0.03, context)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(89, 89, 89, 1)),
            child: BlocBuilder<RatingStarsBloc, RatingStarsState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        for (int i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<RatingStarsBloc>()
                                  .add(OnRated(count: i));
                            },
                            child: Icon(
                                i <= state.rated
                                    ? Icons.star
                                    : Icons.star_border,
                                size: mediaqueryWidth(0.085, context),
                                color: i <= state.rated
                                    ? Colors.yellow
                                    : greyColor),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.03, context),
                    ),
                    TextField(
                      maxLines: null,
                      cursorColor: cyanColor,
                      controller: reviewController,
                      maxLength: 120,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: blackColor)),
                          hintText: "write a review....",
                          counterStyle: const TextStyle(color: greyColor3),
                          hintStyle: TextStyle(
                              fontFamily: balooChettan,
                              color: greyColor,
                              fontSize: mediaqueryHeight(0.024, context))),
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: balooChettan,
                          fontSize: mediaqueryHeight(0.024, context)),
                    ),
                    if (state.rated != 0)
                      TextButton(
                          style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 129, 129, 129))),
                          onPressed: () {
                            context.read<ReviewAndRatingBloc>().add(
                                SubmitButtonPressed(
                                    context: context, reviewDetails: bookingDetails));
                          },
                          child: myFont("Submit",
                              fontFamily: balooChettan,
                              fontSize: mediaqueryHeight(0.025, context),
                              fontWeight: FontWeight.w600,
                              fontColor: cyanColor))
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
