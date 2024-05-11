import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ShimmerEffectOfSearchScreen extends StatelessWidget {
  const ShimmerEffectOfSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: greyColor2,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: mediaqueryHeight(0.123, context),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: mediaqueryWidth(0.25, context),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        color: greyColor),
                  ),
                  SizedBox(
                    width: mediaqueryHeight(0.013, context),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.store,
                            color: whiteColor,
                            size: mediaqueryHeight(0.027, context),
                          ),
                          SizedBox(
                            width: mediaqueryWidth(0.02, context),
                          ),
                          Container(
                            width: mediaqueryWidth(0.34, context),
                            height: mediaqueryHeight(0.02, context),
                            color: greyColor,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: whiteColor,
                            size: mediaqueryHeight(0.027, context),
                          ),
                          SizedBox(
                            width: mediaqueryWidth(0.02, context),
                          ),
                          Container(
                            width: mediaqueryWidth(0.26, context),
                            height: mediaqueryHeight(0.02, context),
                            color: greyColor,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.summarize_outlined,
                            color: whiteColor,
                            size: mediaqueryHeight(0.027, context),
                          ),
                          SizedBox(
                            width: mediaqueryWidth(0.02, context),
                          ),
                          Container(
                            width: mediaqueryWidth(0.5, context),
                            height: mediaqueryHeight(0.03, context),
                            color: greyColor,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: mediaqueryHeight(0.02, context),
            );
          },
          itemCount: 4),
    ));
  }
}
