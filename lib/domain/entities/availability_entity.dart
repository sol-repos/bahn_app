import 'package:bahn_app/helpers/get_json_value_extension.dart';

class AvailabilityEntity {
  final DayAvailability? monday;
  final DayAvailability? tuesday;
  final DayAvailability? wednesday;
  final DayAvailability? thursday;
  final DayAvailability? friday;
  final DayAvailability? saturday;
  final DayAvailability? sunday;
  final DayAvailability? holiday;

  AvailabilityEntity({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
    required this.holiday,
  });


  static AvailabilityEntity fromJson(Map<String, dynamic> json) {
    DayAvailability? parseDayAvailability(String day) {
      final openingTime = json.getJsonValueFromPath([day, 'fromTime']);
      final closingTime = json.getJsonValueFromPath([day, 'toTime']);
      if (openingTime == null || closingTime == null) {
        return null;
      }
      return DayAvailability(
        openingTime: openingTime,
        closingTime: closingTime,
      );
    }

    return AvailabilityEntity(
      monday: parseDayAvailability('monday'),
      tuesday: parseDayAvailability('tuesday'),
      wednesday: parseDayAvailability('wednesday'),
      thursday: parseDayAvailability('thursday'),
      friday: parseDayAvailability('friday'),
      saturday: parseDayAvailability('saturday'),
      sunday: parseDayAvailability('sunday'),
      holiday: parseDayAvailability('holiday'),
    );
  }
}

class DayAvailability {
  final String openingTime;
  final String closingTime;

  DayAvailability({
    required this.openingTime,
    required this.closingTime,
  });
}
