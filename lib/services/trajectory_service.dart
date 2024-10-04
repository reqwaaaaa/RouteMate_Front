import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../models/trajectory_model.dart';

class TrajectoryService {
  static const String baseUrl = 'https://yourapi.com/track';

  // 上传用户轨迹数据
  static Future<void> uploadTrajectory(List<LatLng> points) async {
    final List<Map<String, double>> trajectoryData = points
        .map((point) => {'lat': point.latitude, 'lon': point.longitude})
        .toList();

    final response = await http.post(
      Uri.parse('$baseUrl/upload'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'trajectory_data': trajectoryData}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload trajectory: ${response.body}');
    }
  }

  // 获取用户历史轨迹
  static Future<List<Trajectory>> getUserTrajectories() async {
    final response = await http.get(Uri.parse('$baseUrl/history'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['history'] as List)
          .map((trajectory) => Trajectory.fromJson(trajectory))
          .toList();
    } else {
      throw Exception('Failed to fetch user trajectories: ${response.body}');
    }
  }
}
