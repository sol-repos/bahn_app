import 'package:bahn_app/data/data_sources/local/keys.dart';
import 'package:bahn_app/data/models/station_data_model.dart';
import 'package:bahn_app/helpers/get_json_value_extension.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StationDataRemoteDatasource {
  static const _baseUrl = 'apis.deutschebahn.com';
  static const _apiPath = '/db-api-marketplace/apis/station-data/v2/stations';

  static Future<List<StationDataModel>?> getStations({
    // Offset of the first hit returned in the QueryResult object with respect to all hits returned by the query. If this parameter is omitted, it will be set to 0 internally.
    int? offset,
    // The maximum number of hits to be returned by that query. If 'limit' is set greater than 10000, it will be reset to 10000 internally and only 10000 hits will be returned.
    int? limit,
    // String to search for a station name. The wildcards * (indicating an arbitrary number of characters) and ? (indicating one single character) can be used in the search pattern. A comma separated list of station names is also supported (e.g. searchstring=hamburg*,berlin*).
    String? search,
    // Filter by station category. Category ranges are supported as well as lists of categories (e.g. category=2-4 or category=1,3-5). The category must be between 1 and 7 otherwise a parameter exception is returned.
    String? category,
    // Filter by German federal state. Lists of federal states are also supported (e.g. federalstate=bayern,hamburg). Wildcards are not allowed here.
    String? federalState,
    // Filter by EVA number. Wildcards are not allowed here.
    int? evaNumber,
    // Filter by Ril100-identifier. Wildcards are not allowed here.
    String? ril100Ident,
    // Logical operator to combine query parameters (default=AND). See above for further details. Allowed values: or, and
    String? logicalOperator,
  }) async {
    final queryParameters = <String, dynamic> {
      'offset': offset?.toString(),
      'limit': limit?.toString(),
      'searchstring': search,
      'category': category,
      'federalstate': federalState,
      'eva': evaNumber?.toString(),
      'ril100ident': ril100Ident,
      'logicalOperator': logicalOperator,
    };

    for (var entry in queryParameters.entries.toList()) {
      if (entry.value == null) {
        queryParameters.remove(entry.key);
      }
    }

    final url = Uri.https(_baseUrl, _apiPath, queryParameters);

    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'DB-Client-ID': dbApiClientId,
      'DB-Api-Key': dbApiClientSecret,
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic>? results = json.getJsonValueFromPath(['result']);
        if (results != null) {
          return results.map((result) => StationDataModel.fromJson(result)).nonNulls.toList();
        }
      } catch (e) {
        print('Error parsing Station Data Search JSON: $e');
        return null;
      }
    }

    return null;
  }
}
