import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShimmerEffectForMyBookings extends StatelessWidget {
  const ShimmerEffectForMyBookings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: bottomNavBarColor,
      highlightColor: nonSelectedIconBackgroundColor,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: mediaqueryHeight(0.024, context),
          );
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: greyColor)),
            height: mediaqueryHeight(0.13, context),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(mediaqueryHeight(0.012, context)),
                  child: Container(
                    width: mediaqueryWidth(0.2, context),
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: greyColor),
                  ),
                ),
                SizedBox(
                  width: mediaqueryWidth(0.02, context),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: mediaqueryWidth(0.24, context),
                      height: mediaqueryHeight(0.025, context),
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: mediaqueryWidth(0.33, context),
                      height: mediaqueryHeight(0.018, context),
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: mediaqueryWidth(0.4, context),
                      height: mediaqueryHeight(0.018, context),
                      color: greyColor,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: mediaqueryWidth(0.23, context),
                      height: mediaqueryHeight(0.025, context),
                      color: greyColor,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
