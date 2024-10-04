import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/trajectory_provider.dart';
import '../widgets/trajectory_card.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('个人中心')),
      body: Column(
        children: [
          ListTile(
            title: Text('用户名: ${authProvider.currentUser?.username ?? ""}'),
            subtitle: Text('邮箱: ${authProvider.currentUser?.email ?? ""}'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TrajectoryProvider>().fetchUserTrajectories();
            },
            child: Text('查看历史轨迹'),
          ),
          Expanded(
            child: Consumer<TrajectoryProvider>(
              builder: (context, trajectoryProvider, child) {
                if (trajectoryProvider.isUploading) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: trajectoryProvider.trajectories.length,
                  itemBuilder: (context, index) {
                    return TrajectoryCard(
                        trajectory: trajectoryProvider.trajectories[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
