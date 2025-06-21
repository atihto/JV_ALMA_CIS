/*import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class IrrigationDashboardPage extends StatefulWidget {
  const IrrigationDashboardPage({super.key});

  @override
  State<IrrigationDashboardPage> createState() => _IrrigationDashboardPageState();
}

class _IrrigationDashboardPageState extends State<IrrigationDashboardPage> {
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const mobileBreakpoint = 600.0;
    final isMobile = screenWidth < mobileBreakpoint;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Irrigation Dashboard Demo'),
        backgroundColor: const Color(0xFF003900),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Irrigation Dashboard',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Soil Moisture',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      ListTile(
                        title: const Text('Field 1'),
                        subtitle: const Text('Moisture: 65%'),
                        trailing: IconButton(
                          icon: const Icon(Icons.water_drop),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Irrigation started (demo)')),
                            );
                            logger.i('Irrigation started for Field 1 (demo)');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/