import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/screens/booking_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/fade_transition.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/name_location_service.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/no_shops_text.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/shimmer_effect.dart';
import 'package:trim_spot_user_side/widgets/search_widgets/shop_image.dart';

class ListViewOfSearchScreen extends StatelessWidget {
  const ListViewOfSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CollectionReferences()
            .shopDetailsReference()
            .where(SalonDocumentModel.isApproved, isEqualTo: true)
          
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmerEffectOfSearchScreen();
          }
          if (!snapshot.hasData) {
            return Container();
          }

          if (snapshot.data!.docs.isEmpty) {
            return const NoShopsRegisteredText();
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final shop = snapshot.data!.docs[index];
                      return Material(
                        color: greyColor3,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.of(context).push(FadeTransitionPageRoute(
                                child: ServiceBookingScreen(shop: shop)));
                          },
                          child: Container(
                            height: mediaqueryHeight(0.123, context),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                searchShopImage(context,
                                    shop[SalonDocumentModel.shopImage]),
                                SizedBox(
                                  width: mediaqueryHeight(0.013, context),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    shopName(context,
                                        shop[SalonDocumentModel.shopName]),
                                    shopLocation(context,
                                        shop[SalonDocumentModel.locationName]),
                                    shopServices(context, shop)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: mediaqueryHeight(0.02, context),
                      );
                    },
                    itemCount: snapshot.data!.docs.length));
          }
          return Container();
        });
  }
}
