import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import '../models/Carpool_Recommendation.dart';
import '../models/recommendation_model.dart';

class RecommendationService {
  static const String baseUrl = 'https://yourapi.com/recommendations';

  // 获取推荐的POI
  static Future<List<Poi>> getPOIRecommendations(LatLng currentPosition) async {
    final response = await http.post(
      Uri.parse('$baseUrl/poi'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'current_location': {
          'lat': currentPosition.latitude,
          'lon': currentPosition.longitude
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

  // 获取拼车推荐
  static Future<List<CarpoolRecommendation>> getCarpoolRecommendations(
      String userId, String trajectoryId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/carpool'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'user_id': userId, 'trajectory_id': trajectoryId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['carpool_suggestions'] as List)
          .map((rec) => CarpoolRecommendation.fromJson(rec))
          .toList();
    } else {
      throw Exception(
          'Failed to fetch carpool recommendations: ${response.body}');
    }
  }
}
