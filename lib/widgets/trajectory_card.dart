import 'package:flutter/material.dart';
import '../models/trajectory_model.dart';

class TrajectoryCard extends StatelessWidget {
  final Trajectory trajectory;

  TrajectoryCard({required this.trajectory});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('轨迹ID: ${trajectory.id}'),
        subtitle: Text('上传时间: ${trajectory.uploadTime.toLocal()}'),
        trailing: Icon(Icons.map),
      ),
    );
  }
}
