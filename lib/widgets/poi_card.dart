import 'package:flutter/material.dart';
import '../models/recommendation_model.dart'; // 确保路径正确

class PoiCard extends StatelessWidget {
  final Poi poi;

  PoiCard({required this.poi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(poi.name),
        subtitle: Text('类别: ${poi.category}'),
        trailing: Icon(Icons.location_on),
      ),
    );
  }
}
