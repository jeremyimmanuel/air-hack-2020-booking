class Constants{
  static const NDC_ENDPOINT = "http://iata.api.mashery.com/athena/ndc192api";
  static const ONE_ORDER_NDC_ENDPOINT = "http://iata.api.mashery.com/athena/oneorder182api";
  static const API_KEY = "63m26e4rjnfc5zsjyhhezq96";
  static const AGENCY_ID = '9A';
  static const AIRLINE_ID = '9A';
  String guid = 'guid';
  int randomInt = 1;

  static const BODY = '''<?xml version="1.0" encoding="UTF-8"?>
<IATA_AirShoppingRQ xmlns="http://www.iata.org/IATA/2015/00/2019.2/IATA_AirShoppingRQ">
	<MessageDoc>
			<RefVersionNumber>1.0</RefVersionNumber>
	</MessageDoc>
	<Party>
		<Participant>
			<Aggregator>
				<AggregatorID>88888888</AggregatorID>
				<Name>JR TECHNOLOGIES</Name>
			</Aggregator>
		</Participant>
		<Sender>
			<TravelAgency>
				<AgencyID>{{AGENCY_ID}}</AgencyID>
				<IATA_Number>12312312</IATA_Number>
				<Name>Gods Travel</Name>
			</TravelAgency>
		</Sender>
	</Party>
	<PayloadAttributes>
		<EchoTokenText>{{guid}}</EchoTokenText>
		<Timestamp>2001-12-17T09:30:47+05:00</Timestamp>
		<TrxID>transaction{{123}}</TrxID>
		<VersionNumber>2019.2</VersionNumber>
	</PayloadAttributes>
	<POS>
		<City>
			<IATA_LocationCode>ATH</IATA_LocationCode>
		</City>
		<Country>
			<CountryCode>GR</CountryCode>
		</Country>
		<RequestTime>2018-10-12T07:38:00</RequestTime>
	</POS>
	<Request>
		<FlightCriteria>
			<OriginDestCriteria>
				<DestArrivalCriteria>
					<IATA_LocationCode>LHR</IATA_LocationCode>
				</DestArrivalCriteria>
				<OriginDepCriteria>
					<Date>2020-06-20</Date>
					<IATA_LocationCode>BCN</IATA_LocationCode>
				</OriginDepCriteria>
			</OriginDestCriteria>
		</FlightCriteria>
		<Paxs>
			<Pax>
				<PaxID>Pax1</PaxID>
				<PTC>ADT</PTC>
			</Pax>	
		</Paxs>
		<ShoppingCriteria>
			<CabinTypeCriteria>
				<CabinTypeCode>M</CabinTypeCode>
			</CabinTypeCriteria>
		</ShoppingCriteria>
	</Request>
</IATA_AirShoppingRQ>
''';
}