import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('个人中心'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/poi_recommendation');
              },
              child: Text('推荐 POI'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/carpool');
              },
              child: Text('拼车建议'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: Text('历史轨迹'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('设置'),
            ),
          ],
        ),
      ),
    );
  }
}
