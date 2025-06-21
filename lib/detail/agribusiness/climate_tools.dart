import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../config.dart';

class ClimateToolsPage extends StatefulWidget {
  const ClimateToolsPage({super.key});

  @override
  State<ClimateToolsPage> createState() => _ClimateToolsPageState();
}

class _ClimateToolsPageState extends State<ClimateToolsPage> {
  final logger = Logger();
  List<Map<String, dynamic>> climateData = [];

  @override
  void initState() {
    super.initState();
    _fetchClimateData();
  }

  Future<void> _fetchClimateData() async {
    try {
      final response = await http.get(Uri.parse('${Config.apiUrl}/climate-data'));
      if (response.statusCode == 200) {
        setState(() {
          climateData = [
            {'region': 'Nairobi', 'droughtRisk': 'Low', 'temp': 24.5},
            {'region': 'Mombasa', 'droughtRisk': 'Moderate', 'temp': 28.0},
          ];
        });
        logger.i('Climate data fetched successfully');
      } else {
        logger.e('Failed to fetch climate data: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Error fetching climate data', error: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const mobileBreakpoint = 600.0;
    final isMobile = screenWidth < mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Climate Analytics Portal'),
        backgroundColor: const Color(0xFF003900),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isMobile
              ? Column(
                  children: [
                    _buildClimateMap(),
                    _buildClimateData(),
                    _buildRecommendations(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildClimateMap()),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          _buildClimateData(),
                          _buildRecommendations(),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildClimateMap() {
    return Card(
      elevation: 4,
      child: SizedBox(
        height: 300,
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(-1.286389, 36.817223), // Nairobi
            initialZoom: 6.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: const ['a', 'b', 'c'],
            ),
            MarkerLayer(
              markers: climateData
                  .map((data) => Marker(
                        point: LatLng(
                          data['region'] == 'Nairobi' ? -1.286389 : -4.043477,
                          data['region'] == 'Nairobi' ? 36.817223 : 39.668203,
                        ),
                        child: const Icon(Icons.location_pin, color: Colors.red),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClimateData() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Climate Analytics',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            ...climateData.map((data) => ListTile(
                  title: Text(data['region']),
                  subtitle: Text('Drought Risk: ${data['droughtRisk']} | Temp: ${data['temp']}°C'),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendations() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommendations',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const ListTile(
              title: Text('Drought-Resistant Crops'),
              subtitle: Text('Consider planting sorghum or millet in high-risk areas.'),
            ),
            const ListTile(
              title: Text('Water Conservation'),
              subtitle: Text('Use drip irrigation to reduce water usage.'),
            ),
          ],
        ),
      ),
    );
  }
}