import 'package:flutter/material.dart';

import '../models/segment.dart';

class PaxSegmentWidget extends StatelessWidget {
  // const PaxSegmentWidget({Key key}) : super(key: key);
  const PaxSegmentWidget({this.paxSeg});

  final PaxSegment paxSeg;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Text('${paxSeg.airlineIdS}'),
        title: Text('${paxSeg.eta.hour}:${paxSeg.eta.minute} - ${paxSeg.etd.hour}:${paxSeg.etd.minute}'),
        subtitle: Text('Athena Airlines'),
        trailing: Text('\$420.69'),
      ),

    );
  }
}