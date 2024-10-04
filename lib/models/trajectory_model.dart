import 'package:latlong2/latlong.dart';

class Trajectory {
  final String id;
  final List<LatLng> points;
  final DateTime uploadTime;

  Trajectory({
    required this.id,
    required this.points,
    required this.uploadTime,
  });

  factory Trajectory.fromJson(Map<String, dynamic> json) {
    return Trajectory(
      id: json['trajectory_id'], // 后端返回的轨迹ID
      points: (json['points'] as List)
          .map((point) => LatLng(point['lat'], point['lon']))
          .toList(), // 后端返回的轨迹点
      uploadTime: DateTime.parse(json['upload_time']), // 后端返回的上传时间
    );
  }
}
