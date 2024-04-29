import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_user_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_user_side/utils/font.dart';
import 'package:trim_spot_user_side/utils/mediaquery.dart';

class ClearSelectionHeading extends StatelessWidget {
  const ClearSelectionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SlotSelectionBloc>().add(SelectedClearSelection());
      },
      child: myFont("clear selection",
          fontFamily: belleza,
          fontSize: mediaqueryHeight(0.017, context),
          fontWeight: FontWeight.w500,
          fontColor: Colors.blue.shade200),
    );
  }
}