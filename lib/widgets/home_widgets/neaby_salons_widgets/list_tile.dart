import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/screens/booking_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/page%20transitions/slide_transition.dart';

class NearbySalonsListTile extends StatelessWidget {
  const NearbySalonsListTile({
    required this.snapshot,
    super.key,
  });
  final AsyncSnapshot<List<QueryDocumentSnapshot<Object?>>> snapshot;

  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage(shop[SalonDocumentModel.shopImage]))),
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
}