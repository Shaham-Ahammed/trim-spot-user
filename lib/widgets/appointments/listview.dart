import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trim_spot_user_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/screens/my_appointments_details_screen.dart';
import 'package:trim_spot_user_side/utils/colors.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/widgets/appointments/booking_status.dart';
import 'package:trim_spot_user_side/widgets/appointments/service_image.dart';
import 'package:trim_spot_user_side/widgets/appointments/service_name.dart';
import 'package:trim_spot_user_side/widgets/appointments/shop_details.dart';
import 'package:trim_spot_user_side/widgets/appointments/time_and_date.dart';
import 'package:lottie/lottie.dart';

class AllAppointmentsList extends StatelessWidget {
  const AllAppointmentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CollectionReferences()
            .userCollectionReference()
            .doc(UserDataDocumentFromFirebase.userId)
            .collection(FirebaseNamesUserSide.bookingHistoryCollectionReference)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: const CircularProgressIndicator(
              color: cyanColor,
            ));
          }
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "assets/animations/nobooking.json",
                  height: mediaqueryHeight(0.25, context),
                ),
                myFont(
                    "        No bookings scheduled yet.\n Book your first appointment now !!",
                    fontFamily: balooChettan,
                    fontSize: mediaqueryHeight(0.015, context),
                    fontWeight: FontWeight.w500,
                    fontColor: whiteColor)
              ],
            ));
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final myBookings = snapshot.data!.docs[index];
                  return Material(
                    color: transparentColor,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyAppointmentsDetailsScreen(
                            booking: myBookings,
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: greyColor)),
                        height: mediaqueryHeight(0.13, context),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                  mediaqueryHeight(0.012, context)),
                              child: BookingsImage(booking: myBookings),
                            ),
                            SizedBox(
                              width: mediaqueryWidth(0.02, context),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                servcieNameBookings(
                                    myBookings[BookingHisotryUserDocumentModel
                                        .service],
                                    context),
                                TimeAndDateBookings(
                                  date: myBookings[
                                      BookingHisotryUserDocumentModel.date],
                                ),
                                ShopDetails(
                                  shopLocation: myBookings[
                                      BookingHisotryUserDocumentModel
                                          .shopLocation],
                                  shopName: myBookings[
                                      BookingHisotryUserDocumentModel.shopName],
                                ),
                                bookingStatus(
                                    myBookings[BookingHisotryUserDocumentModel
                                        .currentStatus],
                                    context),
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
                    height: mediaqueryHeight(0.024, context),
                  );
                },
                itemCount: snapshot.data!.docs.length);
          }
          return Container();
        });
  }
}
