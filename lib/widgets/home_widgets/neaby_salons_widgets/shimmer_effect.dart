import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShimmerEffectOneNearbySalons extends StatelessWidget {
  const ShimmerEffectOneNearbySalons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
