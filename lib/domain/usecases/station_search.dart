import 'package:bahn_app/core/use_case.dart';
import 'package:bahn_app/data/repositories/station_data_repository.dart';
import 'package:bahn_app/domain/entities/station_data_entity.dart';

class StationDataSearch implements UseCase<List<StationDataEntity>, StationDataSearchParams?> {

  StationDataSearch._();
  static final StationDataSearch use = StationDataSearch._();

  @override
  Future<List<StationDataEntity>> call([StationDataSearchParams? searchParams]) async {
    return await StationDataRepository.getStationData(searchParams ?? StationDataSearchParams());
  }
}

class StationDataSearchParams {
  final int? offset;
  final int? limit;
  final String? searchString;
  final String? category;
  final String? federalState;
  final int? evaNumber;
  final String? ril100Identifier;
  final String? logicalOperator;

  StationDataSearchParams({
    this.offset,
    this.limit,
    this.searchString,
    this.category,
    this.federalState,
    this.evaNumber,
    this.ril100Identifier,
    this.logicalOperator,
  });
}