import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../providers/recommendation_provider.dart';

class PoiRecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recommendationProvider = context.watch<RecommendationProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('推荐 POI')),
      body: recommendationProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : AMapWidget(
              apiKey: AMapApiKeys(
                iosKey: 'YOUR_IOS_KEY',
                androidKey: '2358346e4d3863e4038579e75d2aefba',
              ),
              initialCameraPosition: CameraPosition(
                target: LatLng(39.9042, 116.4074),
                zoom: 14.0,
              ),
              markers: recommendationProvider.poiRecommendations.map((poi) {
                return Marker(
                  position: LatLng(poi.lat, poi.lon),
                  infoWindow:
                      InfoWindow(title: poi.name, snippet: poi.category),
                );
              }).toSet(),
            ),
    );
  }
}
