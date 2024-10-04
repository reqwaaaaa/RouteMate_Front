import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:provider/provider.dart';
import '../providers/trajectory_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyProvider = context.watch<TrajectoryProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('历史轨迹')),
      body: historyProvider.trajectories.isEmpty
          ? Center(child: CircularProgressIndicator())
          : AMapWidget(
              apiKey: const AMapApiKey(
                  //iosKey: 'YOUR_IOS_KEY',
                  androidKey: '2358346e4d3863e4038579e75d2aefba'),
              initialCameraPosition: CameraPosition(
                target: historyProvider.trajectories.first.points.first,
                zoom: 14.0,
              ),
              polylines: {
                Polyline(
                  points: historyProvider.trajectories.first.points,
                  color: Colors.blue,
                  width: 5,
                ),
              },
            ),
    );
  }
}
