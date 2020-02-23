import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';
import 'package:xml2json/xml2json.dart';

import './widgets/pax_segment_widget.dart';

import 'dart:io';
import 'dart:convert';
// import 'dart:html' as html;
import 'package:xml/xml.dart' as xml;

import './utils/constants.dart';
import './models/segment.dart';

void main() async {
  // print(xml.parse(fin.toList()));
  // print(fin.toList()[0].runtimeType);
  // final pslist = xml.parse(fin.toList()[0].toString());
  // print(pslist.)
  // print(xml.parse(fin.toList()[0].toString()).findAllElements('Carrier').toList());
  // fin.map((node) => node.text).forEach((s) {
  //   print(s);
  // });

  // print(json);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  PaxSegment p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final headers = {
      'Content-Type': 'application/xml',
      'Authorization-Key': '${Constants.API_KEY}',
    };
    http
        .post(Constants.NDC_ENDPOINT, body: Constants.BODY, headers: headers)
        .then((response) {
      final x = xml.parse(response.body);
      final fin = x.findAllElements('PaxSegmentList');
      final a = fin.toList()[0];

      final t = Xml2Json();
      final goodXmlString = a.toXmlString();
      t.parse(goodXmlString);
      String json = t.toBadgerfish();
      var data = jsonDecode(json);
      final encoder = JsonEncoder.withIndent('\t');
      final m = data['PaxSegmentList']['PaxSegment'][1];

      setState(() {
        p = PaxSegment.fromMap(data['PaxSegmentList']['PaxSegment'][0]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final seaTacLatLng = LatLng(47.450373, -122.308398);
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Hack 2020'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('#HackAir #FlyInclusive'),
            if (p != null) PaxSegmentWidget(paxSeg: p,),
          ],
        ),
      ),
      // body: FlutterMap(
      //   options: MapOptions(
      //     center: seaTacLatLng,
      //     zoom: 13.0,
      //   ),
      //   layers: [
      //     TileLayerOptions(
      //       urlTemplate:
      //           "https://atlas.microsoft.com/map/tile/png?api-version=1&layer=basic&style=main&tileSize=256&view=Auto&zoom={z}&x={x}&y={y}&subscription-key={subscriptionKey}",
      //       additionalOptions: {
      //         'subscriptionKey': 'x9DYrWhFY6OhW8Yxk3VbFl877AJQpmhl0GJYPSJpusI'
      //       },
      //     ),
      //     MarkerLayerOptions(
      //       markers: [
      //         Marker(
      //           width: 80.0,
      //           height: 80.0,
      //           point: seaTacLatLng,
      //           builder: (ctx) => Container(
      //             child: FlutterLogo(),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
