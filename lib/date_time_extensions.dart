import 'package:intl/intl.dart';

extension $DateTimeExtension on DateTime {
  String toLocalString([String format = "yyyy-MM-dd HH:mm:ss"]) {
    var strDate = DateFormat(format).format(toLocal());
    return strDate;
  }

  String toUtcString([String format = "yyyy-MM-dd HH:mm:ss"]) {
    var strDate = DateFormat(format).format(toUtc());
    return strDate;
  }

  bool get isToday {
    var now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool isSameDay(DateTime dateTime) {
    return day == dateTime.day && month == dateTime.month && year == dateTime.year;
  }

  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates)
          ? '${(difference.inDays / 365).floor() == 1 ? "1 year ago" : "${((difference.inDays / 365).floor())} month ago"} '
          : 'Last Year';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates)
          ? '${(difference.inDays / 30).floor() == 1 ? "1 month ago" : "${((difference.inDays / 30).floor())} month ago"} '
          : 'Last Month';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  DateTime toDate() {
    return DateTime(year, month, day);
  }
}
