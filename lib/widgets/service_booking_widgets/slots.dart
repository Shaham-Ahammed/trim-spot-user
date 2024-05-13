import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/blocs/service_booking_blocs/date_selection_bloc/date_selection_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/data/firebase_collection_references/user_information_reference.dart';
import 'package:trim_spot_user_side/data/repository/firebase_docs_and_collections.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';
import 'package:trim_spot_user_side/utils/service_booking/slot_booking_colors.dart';

import 'package:trim_spot_user_side/widgets/service_booking_widgets/functions/checking_bookings.dart';
import 'package:trim_spot_user_side/widgets/service_booking_widgets/slots_shimmer_effect.dart';

class SlotsPickingArea extends StatefulWidget {
  const SlotsPickingArea({super.key, required this.shop});

  final QueryDocumentSnapshot<Object?> shop;

  @override
  State<SlotsPickingArea> createState() => _SlotsPickingAreaState();
}

class _SlotsPickingAreaState extends State<SlotsPickingArea> {
  @override
  void initState() {
    context.read<SlotSelectionBloc>().add(FetchTotalSlots(shop: widget.shop));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SlotTileFucntions().fetchingBookedSlots(widget.shop.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SlotsInShimmerEffect();
        }
        return StreamBuilder(
            stream: CollectionReferences()
                .shopDetailsReference()
                .doc(widget.shop.id)
                .collection(FirebaseNamesShopSide.slotBookingCollectionReference)
                .doc(FirebaseNamesShopSide.slotsBookingDocument)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SlotsInShimmerEffect();
              }
              DateTime selectedDate =
                  BlocProvider.of<DateSelectionBloc>(context, listen: true)
                      .state
                      .date!;
              String selectedDay =
                  DateFormat('dd-MM-yyyy').format(selectedDate);

              final List<String> list =
                  (snapshot.data!.data()![selectedDay] as List<dynamic>)
                      .cast<String>();

              final totalSlots =
                  BlocProvider.of<SlotSelectionBloc>(context, listen: false)
                      .state
                      .totalSlots;
              return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: (totalSlots.length / 4).ceil(),
                    itemBuilder: (BuildContext context, int index) {
                      final totalSlotLength = totalSlots.length;
                      int startIndex = index * 4;
                      int endIndex = startIndex + 4 > totalSlotLength
                          ? totalSlotLength
                          : startIndex + 4;
                      List<String> timeSlotsRow =
                          totalSlots.sublist(startIndex, endIndex);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: timeSlotsRow.map((time) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: mediaqueryHeight(0.014, context)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8.0),
                                onTap: () {
                                  context.read<SlotSelectionBloc>().add(
                                      SelectedSlot(
                                          time: time,
                                          context: context,
                                          index: index,
                                          shop: widget.shop,
                                          booked: list));
                                },
                                child: Container(
                                    height: mediaqueryHeight(0.045, context),
                                    width: mediaqueryWidth(0.19, context),
                                    decoration: BoxDecoration(
                                      color: SlotColorsInBookingScreen()
                                          .contianerColor(time, context, list),
                                      border: Border.all(
                                          color: SlotColorsInBookingScreen()
                                              .borderColor(
                                        time,
                                        context,
                                      )),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: myFont(time,
                                          fontFamily: cabinCondensed,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          fontColor: SlotColorsInBookingScreen()
                                              .textColor(time, context, list)),
                                    )),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  );
                },
              );
            });
      },
    );
  }
}
