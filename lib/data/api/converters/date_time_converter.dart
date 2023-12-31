import 'package:json_annotation/json_annotation.dart';

import '../../../utils/date_time_utils.dart';
import '../api_constants.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? strDate) {
    if (strDate == null) return null as DateTime;

    final format = strDate.contains("T") ? DATE_TIME_FORMAT : DATE_FORMAT3;
    return parseDate(strDate, format)!;
  }

  @override
  String toJson(DateTime date) => formatDate(date, DATE_FORMAT3)!;
}

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromJson(String strDate) {
    return parseDate(strDate, DATE_FORMAT)!;
  }

  @override
  String toJson(DateTime date) => formatDate(date, DATE_FORMAT)!;
}
