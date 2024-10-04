import 'package:flutter/material.dart';
import '../models/Carpool_Recommendation.dart';

class CarpoolCard extends StatelessWidget {
  final CarpoolRecommendation recommendation;

  CarpoolCard({required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('用户ID: ${recommendation.userId}'),
        subtitle: Text(
            '相似度: ${(recommendation.similarity * 100).toStringAsFixed(2)}%'),
        trailing: Icon(Icons.directions_car),
      ),
    );
  }
}
