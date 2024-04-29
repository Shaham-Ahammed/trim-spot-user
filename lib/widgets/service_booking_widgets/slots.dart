import 'package:flutter/material.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

import 'package:trim_spot_user_side/utils/service_booking/slot_booking_colors.dart';
import 'package:trim_spot_user_side/utils/service_booking/slot_tiles_timings.dart';
class SlotsPickingArea extends StatelessWidget {
  const SlotsPickingArea({
    super.key,
    required this.event,
  });

  final SlotSelectionBloc event;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (timeSlots.length / 4).ceil(),
      itemBuilder: (BuildContext context, int index) {
        int startIndex = index * 4;
        int endIndex = startIndex + 4 > timeSlots.length
            ? timeSlots.length
            : startIndex + 4;
        List<String> timeSlotsRow = timeSlots.sublist(startIndex, endIndex);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: timeSlotsRow.map((time) {
              return Padding(
                padding:
                    EdgeInsets.only(left: mediaqueryHeight(0.014, context)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    event.add(SelectedSlot(
                        time: time, context: context, index: index));
                  },
                  child: Container(
                      height: mediaqueryHeight(0.045, context),
                      width: mediaqueryWidth(0.19, context),
                      decoration: BoxDecoration(
                        color: contianerColor(time, context),
                        border: Border.all(color: borderColor(time, context)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: myFont(time,
                            fontFamily: cabinCondensed,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            fontColor: textColor(time, context)),
                      )),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}