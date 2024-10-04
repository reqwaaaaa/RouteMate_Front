import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../services/recommendation_service.dart';
import '../models/recommendation_model.dart';
import '../models/Carpool_Recommendation.dart';

class RecommendationProvider with ChangeNotifier {
  List<Poi> _poiRecommendations = [];
  List<CarpoolRecommendation> _carpoolRecommendations = [];
  bool _isLoading = false;

  List<Poi> get poiRecommendations => _poiRecommendations;
  List<CarpoolRecommendation> get carpoolRecommendations =>
      _carpoolRecommendations;
  bool get isLoading => _isLoading;

  Future<void> fetchPOIRecommendations(LatLng currentPosition) async {
    _isLoading = true;
    notifyListeners();

    _poiRecommendations =
        await RecommendationService.getPOIRecommendations(currentPosition);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCarpoolRecommendations(
      String userId, String trajectoryId) async {
    _isLoading = true;
    notifyListeners();

    _carpoolRecommendations =
        await RecommendationService.getCarpoolRecommendations(
            userId, trajectoryId);

    _isLoading = false;
    notifyListeners();
  }
}
