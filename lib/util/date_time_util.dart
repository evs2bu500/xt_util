import 'package:intl/intl.dart';

const int msPerSecond = 1000;
const int msPerMinute = 60 * msPerSecond;
const int msPerHour = 60 * msPerMinute;
const int msPerDay = 24 * msPerHour;
const int msPerWeek = 7 * msPerDay;
const int msPerMonth = 30 * msPerDay;

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

String getReadableDuration(Duration duration) {
  if (duration.inHours > 1) {
    if (duration.inHours < 72) {
      int hour = duration.inHours;
      return "$hour hour${hour > 1 ? "s" : ""}";
    } else if (duration.inDays < 7) {
      int day = duration.inDays;
      return "$day day${day > 1 ? "s" : ""}";
    } else if (duration.inDays < 30) {
      int week = duration.inDays ~/ 7;
      return "$week week${week > 1 ? "s" : ""}";
    } else if (duration.inDays < 365) {
      int month = duration.inDays ~/ 30;
      return "$month month${month > 1 ? "s" : ""}";
    } else {
      int year = duration.inDays ~/ 365;
      return "$year year${year > 1 ? "s" : ""}";
    }
  }
  return "${duration.inMinutes}";
}

String getDateTimeStrFromTimestamp(int timestamp,
    {String format = "yyyy-MM-dd HH:mm:ss"}) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(format).format(dateTime);
}

String getDateTimeStrFromDateTime(DateTime dateTime,
    {String format = "yyyy-MM-dd HH:mm:ss"}) {
  return DateFormat(format).format(dateTime);
}

String getDateFromDateTimeStr(String dateTimeStr,
    {String format = "yyyy-MM-dd"}) {
  DateTime dateTime = dateFormat.parse(dateTimeStr);
  return DateFormat(format).format(dateTime);
}

DateTime getSgNow() {
  return DateTime.now().toUtc().add(const Duration(hours: 8));
}

String getSgNowStr(String format) {
  return DateFormat(format).format(getSgNow());
}

//'target' stands for the brower/app timezone
//get target local datetime now
DateTime getTargetLocalDatetimeNow(int targetLocalTimezone) {
  int systemTimezone = DateTime.now().timeZoneOffset.inHours;
  return DateTime.now()
      .toLocal()
      .add(Duration(hours: targetLocalTimezone - systemTimezone));
}

String getLocalDatetimeNowStr(int timezone,
    {String? format = "yyyy-MM-dd HH:mm:ss"}) {
  String xformat = format ?? "yyyy-MM-dd HH:mm:ss";
  return DateFormat(xformat)
      .format(DateTime.now().toUtc().add(Duration(hours: timezone)));
}

DateTime getTargetDatetime(int targetTimestamp) {
  return DateTime.fromMillisecondsSinceEpoch(targetTimestamp);
}

DateTime getTargetDatetimeFromTargetStr(String targetDateTimeStr) {
  DateTime targetDateTime = DateTime.parse(targetDateTimeStr);

  return targetDateTime;
}

String getLocalDatetimeStr(DateTime datetime, int timezone,
    {String? format = "yyyy-MM-dd HH:mm:ss"}) {
  String xformat = format ?? "yyyy-MM-dd HH:mm:ss";
  return DateFormat(xformat).format(
      DateTime.fromMillisecondsSinceEpoch(datetime.millisecondsSinceEpoch)
          .toUtc()
          .add(Duration(hours: timezone)));
}
