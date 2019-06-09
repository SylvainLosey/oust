import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String weekdayAndDate(BuildContext context, DateTime date) {
  final String weekday = capitalize(DateFormat.EEEE(Localizations.localeOf(context).toString()).format(date));
  final String formatedDate = DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(date);

  return '$weekday $formatedDate';
}

DateTime dateTimeToDate(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

int weekNumber(DateTime date) {
  final int dayOfYear = int.parse(DateFormat('D').format(date));
  return ((dayOfYear - date.weekday + 10) / 7).floor();
}

int weeksDelta(DateTime firstDateTime, DateTime secondDateTime) {
  final int years = yearsDelta(firstDateTime, secondDateTime);
  final int weeks = weekNumber(firstDateTime) - weekNumber(secondDateTime);

  return years * 52 + weeks;
}

int daysDelta(DateTime firstDateTime, DateTime secondDateTime) {
  final DateTime firstDate = dateTimeToDate(firstDateTime);
  final DateTime secondDate = dateTimeToDate(secondDateTime);

  return firstDate.difference(secondDate).inDays;
}

int yearsDelta(DateTime firstDateTime, DateTime secondDateTime) {
  return firstDateTime.year - secondDateTime.year;
}

String minToString(int minutes) {
  if (minutes < 60) {
    return '$minutes min';
  } else {
    return '${minutes ~/ 60}h${minutes % 60}';
  }
}

String capitalize(String input) {
  if (input == null) {
    throw ArgumentError('string: $input');
  }
  if (input.length == 0) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

List<DateTime> toUniqueDates(List<DateTime> datetimes) {
  // Convert all Datetimes to a Date then return the unique ones
  final dates = List<DateTime>.generate(datetimes.length, (int index) => dateTimeToDate(datetimes[index]));
  return dates.toSet().toList();
}
