import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/reviews_and_ratings/modal_list.dart';

class ReviewsAndRatingsScreen extends StatelessWidget {
  const ReviewsAndRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: greyColor2,
              )),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(179, 60, 60, 60),
          title: myFont("HIPOCHI SALON",
              fontFamily: cabinCondensed,
              fontSize: mediaqueryHeight(0.03, context),
              fontWeight: FontWeight.w600,
              fontColor: greyColor2),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myFont(
                "Reviews & Ratings",
                fontFamily: balooChettan,
                fontSize: mediaqueryHeight(0.02, context),
                fontWeight: FontWeight.w500,
                fontColor: greyColor,
              ),
          
              SizedBox(
                height: mediaqueryHeight(0.025, context),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: reviewList.length,
                  itemBuilder: (context, index) {
                    final reviewer = reviewList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index != 0)
                          SizedBox(
                            height: mediaqueryHeight(0.02, context),
                          ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(reviewer.imagepath),
                              radius: 23,
                            ),
                            SizedBox(
                              width: mediaqueryWidth(0.04, context),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                myFont(reviewer.name,
                                    fontFamily: balooChettan,
                                    fontSize:
                                        mediaqueryHeight(0.023, context),
                                    fontWeight: FontWeight.w500,
                                    fontColor: whiteColor),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(5, (index) {
                                    if (index < reviewer.rating) {
                                      return Icon(
                                        Icons.star_rate_rounded,
                                        color: Colors.yellow,
                                        size:
                                            mediaqueryHeight(0.023, context),
                                      );
                                    } else {
                                      return Icon(Icons.star_rate_rounded,
                                          color: Colors.grey,
                                          size: mediaqueryHeight(
                                              0.023, context));
                                    }
                                  }),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                        myFont(reviewer.review,
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.018, context),
                            fontWeight: FontWeight.normal,
                            fontColor: greyColor),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                        const Divider(
                          thickness: 1,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )));
  }
}
