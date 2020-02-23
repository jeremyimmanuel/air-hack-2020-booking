import 'dart:convert';

class PaxSegment {
  String paxSegmentId;

  Map<String, dynamic> dol;

  String flightDurString;

  String airlineId;

  String flightNum;

  PaxSegment(
      {this.paxSegmentId,
      this.dol,
      this.flightDurString,
      this.airlineId,
      this.flightNum});

  PaxSegment.fromMap(Map<String, dynamic> m) {
    this.paxSegmentId = "a"; //m['PaxSegmentID']['\$'];

    this.dol = m['DatedOperatingLeg'];

    this.flightDurString = m['Duration']['\$'];

    this.airlineId = m['MarketingCarrierInfo']['CarrierDesigCode']['\$'];
    this.flightNum =
        m['MarketingCarrierInfo']['MarketingCarrierFlightNumberText']['\$'];
  }

  String get airlineIdS{
    return airlineId;
  }

  String get oriAirportCode {
    return dol['Arrival']['IATA_LocationCode']['\$'];
  }

  String get oriAirportName {
    return dol['Arrival']['StationName']['\$'];
  }

  DateTime get eta {
    String d = dol['Arrival']['AircraftScheduledDateTime']['\$'];
    return DateTime.parse(d);
  }

  String get dolId {
    return dol['DatedOperatingLegID']['\$'];
  }

  String get destAirportCode {
    return dol['Dep']['IATA_LocationCode']['\$'];
  }

  String get destAirportName {
    return dol['Dep']['StationName']['\$'];
  }

  DateTime get etd {
    String d = dol['Dep']['AircraftScheduledDateTime']['\$'];
    return DateTime.parse(d);
  }

  Duration get flightDur {
    // P0DT1H38M0S
    int t = flightDurString.indexOf('T');
    int h = flightDurString.indexOf('H');
    int m = flightDurString.indexOf('M');
    
    int hours = int.parse(flightDurString.substring(t + 1, h));
    int minutes = int.parse(flightDurString.substring(h + 1, m));

    return Duration(
      hours: hours,
      minutes: minutes,
    );
  }
}
