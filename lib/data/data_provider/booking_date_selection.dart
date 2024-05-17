import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_user_side/data/repository/document_model.dart';
import 'package:trim_spot_user_side/utils/colors.dart';

class DateSelectionForBooking {
 Future<DateTime?> pickingADate(BuildContext context, final QueryDocumentSnapshot<Object?> shop) async {
    final List<String> holidays =
        (shop[SalonDocumentModel.holidays] as List<dynamic>)
            .cast<String>();
    final List<String> occasionalClosures =
        (shop[SalonDocumentModel.occasionalClosures] as List<dynamic>)
            .cast<String>();

    DateTime now = DateTime.now();

    bool isSelectable(DateTime date) {
      String dayOfWeek = DateFormat('E').format(date);
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      return !holidays.contains(dayOfWeek) &&
          !occasionalClosures.contains(formattedDate);
    }

    DateTime nextSelectableDate = now;
    while (!isSelectable(nextSelectableDate)) {
      nextSelectableDate = nextSelectableDate.add(const Duration(days: 1));
    }
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: blackColor,
                onPrimary: cyanColor,
                onSurface: blackColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: blackColor,
                ),
              ),
            ),
            child: child!,
          );
        },
        selectableDayPredicate: (DateTime day) {
          String days = DateFormat('E').format(day);
          String occasionalDays = DateFormat('dd-MM-yyyy').format(day);

          if (holidays.contains(days) ||
              occasionalClosures.contains(occasionalDays)) {
            return false;
          }

          return true;
        },
        context: context,
        initialDate: nextSelectableDate,
        firstDate: now,
        lastDate: DateTime.now().add(const Duration(days: 5)));
    return picked;
  }
}
