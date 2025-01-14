import 'package:bahn_app/domain/entities/availability_entity.dart';
import 'package:bahn_app/data/models/station_data_model.dart';

class StationDataEntity {
  final String name;
  final int stationNumber;
  final AvailabilityEntity? openingInformation;

  StationDataEntity({
    required this.name,
    required this.stationNumber,
    required this.openingInformation,
  });

  static StationDataEntity? fromModel(StationDataModel model) {
    if (model.name == null || model.number == null) {
      return null;
    }

    return StationDataEntity(
      name: model.name!,
      stationNumber: model.number!,
      openingInformation: model.dbAvailabilityInformation != null
          ? AvailabilityEntity.fromJson(model.dbAvailabilityInformation!)
          : null,
    );
  }
}