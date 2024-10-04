import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../services/trajectory_service.dart';
import '../models/trajectory_model.dart';

class TrajectoryProvider with ChangeNotifier {
  List<Trajectory> _trajectories = [];
  bool _isUploading = false;

  List<Trajectory> get trajectories => _trajectories;
  bool get isUploading => _isUploading;

  Future<void> uploadTrajectory(List<LatLng> points) async {
    _isUploading = true;
    notifyListeners();

    await TrajectoryService.uploadTrajectory(points);

    _isUploading = false;
    notifyListeners();
  }

  Future<void> fetchUserTrajectories() async {
    _trajectories = await TrajectoryService.getUserTrajectories();
    notifyListeners();
  }
}
