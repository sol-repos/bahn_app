import 'package:bahn_app/data/data_sources/remote/station_data_remote_datasource.dart';
import 'package:bahn_app/domain/entities/station_data_entity.dart';
import 'package:bahn_app/domain/usecases/station_search.dart';

class StationDataRepository {
  static Future<List<StationDataEntity>> getStationData(StationDataSearchParams searchParams) async {
    final result = await StationDataRemoteDatasource.getStations(
      offset: searchParams.offset,
      limit: searchParams.limit,
      search: searchParams.searchString,
      category: searchParams.category,
      federalState: searchParams.federalState,
      evaNumber: searchParams.evaNumber,
      ril100Ident: searchParams.ril100Identifier,
      logicalOperator: searchParams.logicalOperator,
    );

    if (result != null) {
      return result.map((model) => StationDataEntity.fromModel(model)).nonNulls.toList();
    } else {
      return [];
    }
  }
}