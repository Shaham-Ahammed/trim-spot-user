import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/location_permission_bloc/location_permission_bloc.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/functions/nearby_salons_function.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/neaby_salons_widgets/list_tile.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/neaby_salons_widgets/no_nearby_text.dart';
import 'package:trim_spot_user_side/widgets/home_widgets/neaby_salons_widgets/shimmer_effect.dart';

class NearbySalonsListviewWidget extends StatelessWidget {
  const NearbySalonsListviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPermissionBloc, LocationPermissionState>(
      builder: (context, state) {
        if (state is FetchingUserLocation) {
          return const ShimmerEffectOneNearbySalons();
        }

        return FutureBuilder<List<QueryDocumentSnapshot<Object?>>>(
          future: fetchNearbySalons(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerEffectOneNearbySalons();
            }
            if (!snapshot.hasData) {
              return const ShimmerEffectOneNearbySalons();
            }
            if (snapshot.data!.isEmpty) {
              return const NoNearbySalonsText();
            }
            if (snapshot.data!.isNotEmpty) {
              return NearbySalonsListTile(
                snapshot: snapshot,
              );
            }
            return Container();
          },
        );
      },
    );
  }
}


