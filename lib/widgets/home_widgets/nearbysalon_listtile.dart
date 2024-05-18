import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/screens/booking_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/functions/nearby_salons_function.dart';

class NearbySalonsListviewWidget extends StatelessWidget {
  const NearbySalonsListviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
      future: fetchNearbySalons(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: bottomNavBarColor,
                  highlightColor: nonSelectedIconBackgroundColor,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      height: mediaqueryHeight(0.25, context),
                      decoration: BoxDecoration(
                        color: bottomNavBarColor,
                        borderRadius: BorderRadius.circular(14),
                      )),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: mediaqueryHeight(0.02, context),
                );
              },
              itemCount: 3);
        }
        if (!snapshot.hasData) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: bottomNavBarColor,
                  highlightColor: nonSelectedIconBackgroundColor,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      height: mediaqueryHeight(0.25, context),
                      decoration: BoxDecoration(
                        color: bottomNavBarColor,
                        borderRadius: BorderRadius.circular(14),
                      )),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: mediaqueryHeight(0.02, context),
                );
              },
              itemCount: 3);
        }
        if (snapshot.data!.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(top: mediaqueryHeight(0.07, context)),
            child: Center(
                child: myFont(
                    "no nearby salons available\nexplore more in search ",
                    textalign: TextAlign.center,
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.018, context),
                    fontWeight: FontWeight.w400,
                    fontColor: greyColor2)),
          );
        }
        if (snapshot.data!.isNotEmpty) {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final shop = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(SlideTransitionPageRoute(
                        child: ServiceBookingScreen(
                      shop: shop,
                    )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    height: mediaqueryHeight(0.25, context),
                    decoration: BoxDecoration(
                        color: bottomNavBarColor,
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                shop[SalonDocumentModel.shopImage]))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        myFont(shop[SalonDocumentModel.shopName],
                            fontFamily: balooChettan,
                            fontSize: mediaqueryHeight(0.015, context),
                            fontWeight: FontWeight.w600,
                            fontColor: whiteColor),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: mediaqueryHeight(
                                0.013,
                                context,
                              ),
                              color: whiteColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            myFont(shop[SalonDocumentModel.locationName],
                                fontFamily: balooChettan,
                                fontSize: mediaqueryHeight(0.014, context),
                                fontWeight: FontWeight.w500,
                                fontColor: whiteColor)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: mediaqueryHeight(0.02, context),
                );
              },
              itemCount: snapshot.data!.length);
        }
        return Container();
      },
    );
  }
}
