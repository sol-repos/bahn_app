import 'package:bahn_app/helpers/get_json_value_extension.dart';

class StationDataModel {
  final Map<String, dynamic>? dbAvailabilityInformation;
  final Map<String, String>? aufgabentraeger;
  final int? category;

  // evaNumbers <- idk what that is so I'm not parsing it
  final String? federalState;
  final bool? hasBicycleParking;
  final bool? hasCarRental;
  final bool? hasDBLounge;
  final bool? hasLocalPublicTransport;
  final bool? hasLockerSystem;
  final bool? hasLostAndFound;
  final String? hasMobilityService;
  final bool? hasParking;
  final bool? hasPublicFacilities;
  final bool? hasRailwayMission;
  final String? hasSteplessAccess;
  final bool? hasTaxiRank;
  final bool? hasTravelCenter;
  final bool? hasTravelNecessities;
  final bool? hasWifi;
  final String? ifopt;
  final Map<String, dynamic>? localServiceStaffAvailability;
  final Map<String, String>? mailingAddress;
  final Map<String, dynamic>? mobilityServiceStaffAvailability;
  final String? name;
  final int? number;
  final int? priceCategory;
  final Map<String, dynamic>? regionalbereich;

  // rill100Identifiers <- idk what that is so I'm not parsing it
  final Map<String, dynamic>? stationManagement;

  // szentrale <- idk what that is so I'm not parsing it
  final Map<String, String>? timetableOffice;
  final Map<String, dynamic>? wirelessLan;

  const StationDataModel({
    this.dbAvailabilityInformation,
    this.aufgabentraeger,
    this.category,
    this.federalState,
    this.hasBicycleParking,
    this.hasCarRental,
    this.hasDBLounge,
    this.hasLocalPublicTransport,
    this.hasLockerSystem,
    this.hasLostAndFound,
    this.hasMobilityService,
    this.hasParking,
    this.hasPublicFacilities,
    this.hasRailwayMission,
    this.hasSteplessAccess,
    this.hasTaxiRank,
    this.hasTravelCenter,
    this.hasTravelNecessities,
    this.hasWifi,
    this.ifopt,
    this.localServiceStaffAvailability,
    this.mailingAddress,
    this.mobilityServiceStaffAvailability,
    this.name,
    this.number,
    this.priceCategory,
    this.regionalbereich,
    this.stationManagement,
    this.timetableOffice,
    this.wirelessLan,
  });

  factory StationDataModel.fromJson(Map<String, dynamic> json) {
    return StationDataModel(
      dbAvailabilityInformation: json.getJsonValueFromPath<Map<String, dynamic>>(['DBInformation', 'availability']),
      aufgabentraeger: json.getJsonValueFromPath<Map<String, String>>(['aufgabentraeger']),
      category: json.getJsonValueFromPath<int>(['category']),
      federalState: json.getJsonValueFromPath<String>(['federalState']),
      hasBicycleParking: json.getJsonValueFromPath<bool>(['hasBicycleParking']),
      hasCarRental: json.getJsonValueFromPath<bool>(['hasCarRental']),
      hasDBLounge: json.getJsonValueFromPath<bool>(['hasDBLounge']),
      hasLocalPublicTransport: json.getJsonValueFromPath<bool>(['hasLocalPublicTransport']),
      hasLockerSystem: json.getJsonValueFromPath<bool>(['hasLockerSystem']),
      hasLostAndFound: json.getJsonValueFromPath<bool>(['hasLostAndFound']),
      hasMobilityService: json.getJsonValueFromPath<String>(['hasMobilityService']),
      hasParking: json.getJsonValueFromPath<bool>(['hasParking']),
      hasPublicFacilities: json.getJsonValueFromPath<bool>(['hasPublicFacilities']),
      hasRailwayMission: json.getJsonValueFromPath<bool>(['hasRailwayMission']),
      hasSteplessAccess: json.getJsonValueFromPath<String>(['hasSteplessAccess']),
      hasTaxiRank: json.getJsonValueFromPath<bool>(['hasTaxiRank']),
      hasTravelCenter: json.getJsonValueFromPath<bool>(['hasTravelCenter']),
      hasTravelNecessities: json.getJsonValueFromPath<bool>(['hasTravelNecessities']),
      hasWifi: json.getJsonValueFromPath<bool>(['hasWifi']),
      ifopt: json.getJsonValueFromPath<String>(['ifopt']),
      localServiceStaffAvailability: json.getJsonValueFromPath<Map<String, dynamic>>(['localServiceStaff', 'availability']),
      mailingAddress: json.getJsonValueFromPath<Map<String, String>>(['mailingAddress']),
      mobilityServiceStaffAvailability: json.getJsonValueFromPath<Map<String, dynamic>>(['mobilityServiceStaff', 'availability']),
      name: json.getJsonValueFromPath<String>(['name']),
      number: json.getJsonValueFromPath<int>(['number']),
      priceCategory: json.getJsonValueFromPath<int>(['priceCategory']),
      regionalbereich: json.getJsonValueFromPath<Map<String, dynamic>>(['regionalbereich']),
      stationManagement: json.getJsonValueFromPath<Map<String, dynamic>>(['stationManagement']),
      timetableOffice: json.getJsonValueFromPath<Map<String, String>>(['timetableOffice']),
      wirelessLan: json.getJsonValueFromPath<Map<String, dynamic>>(['wirelessLan']),
    );
  }
}
