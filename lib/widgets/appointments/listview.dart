import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/widgets/appointments/functions/checking_completed.dart';
import 'package:trim_spot_user_side/widgets/appointments/listview_after_fetching.dart';
import 'package:trim_spot_user_side/widgets/appointments/no_booking.dart';
import 'package:trim_spot_user_side/widgets/appointments/shimmer_effect_listview.dart';

class AllAppointmentsList extends StatelessWidget {
  const AllAppointmentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: changingPastPendingsToCompleted(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerEffectForMyBookings();
        }
        return StreamBuilder<QuerySnapshot>(
            stream: CollectionReferences()
                .userCollectionReference()
                .doc(BlocProvider.of<UserDetailsBloc>(context, listen: true)
                    .state
                    .id)
                .collection(
                    FirebaseNamesUserSide.bookingHistoryCollectionReference)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const ShimmerEffectForMyBookings();
              }
              if (snapshot.data!.docs.isEmpty) {
                return const NoBookingsAnimationLottieAndText();
              }
              if (snapshot.data!.docs.isNotEmpty) {
                return MyBookingsListView(
                  snapshot: snapshot,
                );
              }
              return Container();
            });
      },
    );
  }
}
