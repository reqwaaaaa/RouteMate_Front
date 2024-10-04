import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../services/trajectory_service.dart';
import '../models/trajectory_model.dart'; // 确保导入模型

class HistoryProvider with ChangeNotifier {
  List<LatLng> _historyPoints = [];

  List<LatLng> get historyPoints => _historyPoints;

  Future<void> fetchUserHistory() async {
    // 获取用户的历史轨迹（List<Trajectory>）
    List<Trajectory> trajectories =
        await TrajectoryService.getUserTrajectories();

    // 清空现有的历史点
    _historyPoints.clear();

    // 将每个轨迹的点提取出来，并加入到 _historyPoints 中
    for (Trajectory trajectory in trajectories) {
      _historyPoints.addAll(trajectory.points); // 将每个轨迹的点（List<LatLng>）添加到历史点中
    }

    // 通知监听器数据已经更新
    notifyListeners();
  }
}
