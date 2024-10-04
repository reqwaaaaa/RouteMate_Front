import 'package:amap_flutter_location/amap_flutter_location.dart'; // 导入高德位置服务
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/recommendation_model.dart'; // 确保 Poi 类正确导入

class AmapService {
  final AMapFlutterLocation _location = AMapFlutterLocation();
  List<LatLng> _trajectoryPoints = [];

  AmapService() {
    // 使用 Map 来配置位置选项
    Map<String, dynamic> locationOption = {
      'onceLocation': false, // 是否单次定位
      'needAddress': true, // 是否需要地址信息
      'locationInterval': 2000, // 定位间隔，单位为毫秒
      'accuracy': 'HighAccuracy', // 高精度定位
    };

    _location.setLocationOption(locationOption);

    // 注册位置变化回调
    _location.onLocationChanged().listen((Map<String, dynamic> result) {
      double lat = double.tryParse(result['latitude'].toString()) ?? 0.0;
      double lon = double.tryParse(result['longitude'].toString()) ?? 0.0;
      LatLng position = LatLng(lat, lon);
      _trajectoryPoints.add(position); // 保存轨迹点
    });
  }

  void startLocationTracking(Function(LatLng) onLocationUpdate) {
    _location.onLocationChanged().listen((Map<String, dynamic> result) {
      double lat = double.tryParse(result['latitude'].toString()) ?? 0.0;
      double lon = double.tryParse(result['longitude'].toString()) ?? 0.0;
      LatLng position = LatLng(lat, lon);
      onLocationUpdate(position);
    });
    _location.startLocation();
  }

  void stopLocationTracking() {
    _location.stopLocation();
  }

  Future<void> uploadTrajectory() async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/track/upload'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'trajectory_data': _trajectoryPoints
            .map((point) => {'lat': point.latitude, 'lon': point.longitude})
            .toList(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to upload trajectory: ${response.body}');
    }
  }

  Future<List<Poi>> getPoiRecommendations(LatLng currentPosition) async {
    final response = await http.post(
      Uri.parse('https://yourapi.com/recommendations/poi'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'current_location': {
          'lat': currentPosition.latitude,
          'lon': currentPosition.longitude,
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['poi_suggestions'] as List)
          .map((poi) => Poi.fromJson(poi))
          .toList();
    } else {
      throw Exception('Failed to fetch POI recommendations: ${response.body}');
    }
  }
}
