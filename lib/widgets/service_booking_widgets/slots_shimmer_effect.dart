import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class SlotsInShimmerEffect extends StatelessWidget {
  const SlotsInShimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: greyColor3,
        highlightColor: appBarColor,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (25 / 4).ceil(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(4, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: mediaqueryHeight(0.014, context)),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {},
                        child: Container(
                          height: mediaqueryHeight(0.045, context),
                          width: mediaqueryWidth(0.19, context),
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
                  );
                }).toList(),
              ),
            );
          },
        ));
  }
}
