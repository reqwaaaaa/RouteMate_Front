import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recommendation_provider.dart';
import '../widgets/carpool_card.dart';

class CarpoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recommendationProvider = context.watch<RecommendationProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('拼车建议')),
      body: recommendationProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recommendationProvider.carpoolRecommendations.length,
              itemBuilder: (context, index) {
                return CarpoolCard(
                    recommendation:
                        recommendationProvider.carpoolRecommendations[index]);
              },
            ),
    );
  }
}
