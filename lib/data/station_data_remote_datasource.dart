class StationDataRemoteDatasource {
  static void getStations({
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
  }) {

  }
}
