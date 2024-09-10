import 'dart:core';

import 'package:intl/intl.dart';
import '../model/date_pair.dart';

class MDateUtils {
  static String getPostImage(String id, String image) {
    //return '${Routes.baseUrl}public/images/posts/$id/$image';
    return '$image';
  }

  /// date conversion used in instant booking
  static String getFormattedDate(dateTime) {
    // DateTime now = DateTime.now();
    DateTime? date = DateTime.tryParse(dateTime);
    String formattedDate = DateFormat('MM/dd/yyyy').format(date!);
    print(formattedDate);
    print("printing formateed daate");
    return formattedDate;
  }

  /// date conversion used in scheduled booking
  static String convertDateFormat(String originalDate) {
    DateTime date = DateFormat('M/d/yyyy').parse(originalDate);
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  static String changeDateFormat(String inputDate) {
    // Split the inputDate into date and time parts
    List<String> dateTimeParts = inputDate.split('T');

    // Ensure the date is in the "yyyy-mm-dd" format before converting
    if (dateTimeParts.length != 2) {
      throw const FormatException(
          'Invalid date format. Expected "yyyy-mm-ddThh:mm:ss.mmmmmm".');
    }

    // Extract the date from the dateTimeParts list
    String date = dateTimeParts[0];

    // Split the date into year, month, and day parts
    List<String> dateParts = date.split('-');

    // Ensure the date is in the "yyyy-mm-dd" format before converting
    if (dateParts.length != 3) {
      throw const FormatException(
          'Invalid date format. Expected "yyyy-mm-dd".');
    }

    // Extract year, month, and day from the dateParts list
    String year = dateParts[0];
    String month = dateParts[1];
    String day = dateParts[2];

    // Format the date to "dd/mm/yyyy" format
    String formattedDate = "$day/$month/$year";

    return formattedDate;
  }

  static String dateToFormattedDate(String? date, bool showYear,
      {bool? full, bool generic = false}) {
    if (date == null) return '';
    DateTime? dateTime = DateTime.tryParse(date)?.toLocal();
    String formattedDate;
    if (dateTime == null) return date ?? '';
    generic
        ? formattedDate = DateFormat('MM/dd/yyyy').format(dateTime)
        : showYear
            ? formattedDate = DateFormat.yMMMd().format(dateTime)
            : formattedDate = DateFormat.MMMd().format(dateTime);
    if (full != null) {
      formattedDate = DateFormat.yMMMMd().format(dateTime);
    }
    return formattedDate;
  }

  /// function written by santhosh for testing
  static String dateToFormattedDate1(DateTime date, bool showYear,
      {bool? full, bool generic = false}) {
    String formattedDate;
    generic
        ? formattedDate = DateFormat('MM/dd/yyyy').format(date)
        : showYear
            ? formattedDate = DateFormat.yMMMd().format(date)
            : formattedDate = DateFormat.MMMd().format(date);
    if (full != null) {
      formattedDate = DateFormat.yMMMMd().format(date);
    }
    return formattedDate;
  }

  static String dateToQueryDate(
    String? date,
  ) {
    if (date == null) return '';
    DateTime? dateTime = DateTime.tryParse(date)?.toLocal();
    String formattedDate;
    if (dateTime == null) return date ?? '';
    formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);
    return formattedDate;
  }

  static DateTime queryDateToDate(
    String? date,
  ) {
    return DateFormat('dd/MM/yyyy').parse(date ?? '01/11/2000');
  }

  /// if you are facing issue with above function use this guys -- santhosh
  static DateTime queryDateToDate1(
    String? date,
  ) {
    return DateFormat('dd/mm/yyyy').parse(date ?? '01/11/2000');
  }

  /// if you are facing issue with above function use this guys -- santhosh
  static DateTime formatDateToDateTime(String date) {
    List<String> dateParts = date.split('/');
    String formattedDate =
        '${dateParts[2]}-${dateParts[0].padLeft(2, '0')}-${dateParts[1].padLeft(2, '0')} 00:00:00.000';
    DateTime parsedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(formattedDate);
    return parsedDateTime;
  }

  static String dateToFormattedDateAlt(String? date,
      {bool? full, bool generic = false, bool showYear = true}) {
    if (date == null) return '';
    try {
      DateTime? dateTime = DateFormat('dd/MM/yyyy').parse(date);
      String formattedDate;
      if (dateTime == null) return date ?? '';
      generic
          ? formattedDate = DateFormat('dd MMM yyyy').format(dateTime)
          : showYear
              ? formattedDate = DateFormat('MM/dd/yyyy').format(dateTime)
              : formattedDate = DateFormat('MM/dd').format(dateTime);
      if (full != null) {
        formattedDate = DateFormat.yMMMMd().format(dateTime);
      }
      return formattedDate;
    } catch (_) {
      return date ?? '';
    }
  }

  static String monthYear(String? date) {
    if (date == null) return '';
    DateTime dateTime = DateTime.parse(date).toLocal();
    String formattedDate;
    formattedDate = DateFormat('MMMM yyyy').format(dateTime);
    return formattedDate;
  }

  static String postgresDate(String? date) {
    if (date == null) return '';
    DateTime dateTime = DateTime.parse(date).toLocal();
    String formattedDate;
    formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  static String dateToDayOfMonth(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();
    return DateFormat.d().format(dateTime);
  }

  static String dateToMonth(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat.MMM().format(dateTime);
  }

  static String dateToHourMinute(String? date) {
    if (date == null) return '';
    DateTime dateTime = DateTime.tryParse(date)!.toLocal();
    //print(date);
    //return DateFormat.Hm().format(dateTime);
    return DateFormat('hh:mm aa', 'en-IN').format(dateTime).toUpperCase();
    //return 'here';
  }

  static String dateToHourMinuteQuery(String? date) {
    if (date == null) return '';
    DateTime dateTime = DateTime.tryParse(date)!.toLocal();
    //print(date);
    //return DateFormat.Hm().format(dateTime);
    return DateFormat('HH:mm', 'en-IN').format(dateTime).toUpperCase();
    //return 'here';
  }

  static String timeToHourMinute(String? date) {
    if (date == null) return '';
    final liz = date.split(':').map((e) => int.tryParse(e) ?? 0).toList();
    final now = DateTime.now();
    if (liz.length == 3) {
      DateTime dateTime =
          DateTime(now.year, now.month, now.day, liz[0], liz[1], liz[2]);
      return DateFormat('hh:mm aa', 'en-IN').format(dateTime).toUpperCase();
    }
    return date ?? '';
  }

  static String dateToHourMinuteTimezone(String? date) {
    DateTime dateTime = DateTime.parse(date!).toLocal();
    final v = DateFormat('HH:mm:ss', 'en-IN').format(dateTime).toUpperCase();
    print(v);
    return v;
    //return 'here';
  }

  static String timeAgo(String? date, {bool numericDates = false}) {
    DateTime dateTime = DateTime.parse(date!).toLocal();
    Duration diff = DateTime.now().difference(dateTime);
    if (diff.inMinutes < 60) {
      if (diff.inMinutes == 0) {
        return 'Just now';
      }
      return numericDates
          ? '${diff.inMinutes} ${diff.inMinutes > 1 ? 'mins' : 'min'}'
          : DateFormat.Hm().format(dateTime);
    }
    if (diff.inHours < 24)
      return numericDates
          ? '${diff.inHours} ${diff.inHours > 1 ? 'hrs' : 'hr'}'
          : DateFormat.Hm().format(dateTime);
    if (diff.inDays < 2) return numericDates ? '1 day' : 'Yesterday';
    if (diff.inDays < 3) return numericDates ? '2 days' : '2 days ago';
    if (diff.inDays < 4) return numericDates ? '3 days' : '3 days ago';
    if (diff.inDays < 365) return DateFormat('d MMM').format(dateTime);
    return DateFormat.yMMMd().format(dateTime);
  }

  static DateTime nWeekAgo(int n) =>
      DateTime(now().year, now().month, now().day - (7 * n));

  static DateTime nMonthAgo(int n) => DateTime(now().year, now().month - n);

  static DateTime nYearAgo(int n) => DateTime(now().year - n);

  static DateTime now() => DateTime.now();

  static DatePair today() => DatePair(
      'Today',
      DateTime(now().year, now().month, now().day, 0),
      DateTime(now().year, now().month, now().day, 24));

  static DatePair yesterday() => DatePair(
      'Yesterday',
      DateTime(now().year, now().month, now().day - 1, 0),
      DateTime(now().year, now().month, now().day - 1, 24));

  static DatePair thisMonth() => DatePair(
      'This Month',
      DateTime(now().year, now().month, 0, 0),
      DateTime(now().year, now().month + 1, 0, 0));

  static DatePair lastMonth() => DatePair(
      'Last Month',
      DateTime(now().year, now().month - 2, 0, 0),
      DateTime(now().year, now().month - 1, 0, 0));

  static DatePair thisYear() =>
      DatePair('This Year', DateTime(now().year), DateTime(now().year + 1));

  static DatePair lastYear() =>
      DatePair('Last Year', DateTime(now().year - 2), DateTime(now().year - 1));

  static String testFormatDate(DateTime date) =>
      DateFormat("dd-MM-yyyy hh:mm:ss aa  ").format(date);

  static String sqlFormatDate(DateTime date) =>
      DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
}
