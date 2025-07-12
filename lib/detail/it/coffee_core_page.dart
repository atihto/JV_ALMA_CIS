import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';
import 'dart:html' as html;
import 'package:flutter/services.dart';

class CoffeeCorePage extends StatelessWidget {
  const CoffeeCorePage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Cultivation Guidance',
      'description': 'Expert tips for coffee planting and growth optimization.'
    },
    {
      'title': 'Market Insights',
      'description': 'Real-time price trends and buyer connections.'
    },
    {
      'title': 'Weather Monitoring',
      'description': 'Tailored forecasts to protect coffee crops.'
    },
    {
      'title': 'Soil Health',
      'description': 'Soil management for sustainable coffee farming.'
    },
    {
      'title': 'Pest Control',
      'description': 'Solutions for coffee-specific pests like berry borers.'
    },
    {
      'title': 'Financial Tracking',
      'description': 'Monitor expenses and profits for sustainability.'
    },
  ];

  static const List<Map<String, String>> _media = [
    {
      'type': 'image',
      'path': 'assets/apk/coffee_mobile_view.jpg',
      'description': 'Coffee Core mobile app interface.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/coffee_dashboard.jpg',
      'description': 'Coffee Core dashboard overview.',
    },
  ];

  Future<void> _downloadApk(BuildContext context) async {
    try {
      debugPrint('CoffeeCorePage: Starting APK download');
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text('Preparing download...'),
              ],
            ),
          );
        },
      );

      // For web platform
      if (html.window.location.href.contains('localhost') || 
          html.window.location.href.contains('web') ||
          html.window.location.href.contains('.com')) {
        try {
          // Try to load the APK from assets
          final ByteData data = await rootBundle.load('assets/apk/CoffeeCore.apk');
          final List<int> bytes = data.buffer.asUint8List();
          
          final blob = html.Blob([bytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.document.createElement('a') as html.AnchorElement
            ..href = url
            ..style.display = 'none'
            ..download = 'CoffeeCore.apk';
          html.document.body?.children.add(anchor);
          anchor.click();
          html.document.body?.children.remove(anchor);
          html.Url.revokeObjectUrl(url);
          
          if (context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('APK download started! Check your downloads folder.'),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.brown,
              ),
            );
          }
          return; // Success - exit early
        } catch (e) {
          debugPrint('CoffeeCorePage: Asset loading failed: $e');
          // Continue to direct download attempt
        }
      }

      // For mobile platforms or if asset loading failed
      try {
        // Try direct download from server/CDN
        const String apkUrl = 'https://your-domain.com/downloads/CoffeeCore.apk'; // Replace with your actual APK URL
        
        if (await canLaunchUrl(Uri.parse(apkUrl))) {
          await launchUrl(
            Uri.parse(apkUrl),
            mode: LaunchMode.externalApplication,
          );
          
          if (context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Download started! Check your downloads folder.'),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.brown,
              ),
            );
          }
          return; // Success - exit early
        }
      } catch (e) {
        debugPrint('CoffeeCorePage: Direct download failed: $e');
      }

      // If all download methods fail, close loading dialog and allow direct download
      if (context.mounted) {
        Navigator.of(context).pop();
        
        // Instead of showing contact dialog, provide direct download
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Click here to download Coffee Core APK'),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.brown,
            action: SnackBarAction(
              label: 'Download',
              textColor: Colors.white,
              onPressed: () async {
                // Fallback: Open download page or direct link
                const String fallbackUrl = 'https://your-domain.com/downloads/CoffeeCore.apk';
                if (await canLaunchUrl(Uri.parse(fallbackUrl))) {
                  await launchUrl(Uri.parse(fallbackUrl));
                }
              },
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('CoffeeCorePage: Download error: $e');
      
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        
        // Show error but still provide download option
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Download will start shortly. If it doesn\'t start, please contact us.'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('CoffeeCorePage: Building with screenWidth=$screenWidth');

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF1E293B),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 24 : 48,
                horizontal: isMobile ? 8 : 16,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        LucideIcons.arrowLeft,
                        color: Colors.white,
                        size: isMobile ? 20 : 24,
                      ),
                      onPressed: () {
                        debugPrint('CoffeeCorePage: Navigating back');
                        Navigator.pop(context);
                      },
                      tooltip: 'Back',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                        child: Column(
                          children: [
                            Text(
                              'Coffee Core',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 24 : 32,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sow, Safeguard, Soar',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFFBFDBFE),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: isMobile ? 12 : 16,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: isMobile
                    ? _buildMobileLayout(context, screenWidth)
                    : _buildDesktopTabletLayout(context, screenWidth, isTablet),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  LucideIcons.coffee,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('IT Division'),
                  backgroundColor: Colors.brown[50],
                  labelStyle: TextStyle(
                    color: Colors.brown[700],
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildContent(context, screenWidth, true),
      ],
    );
  }

  Widget _buildDesktopTabletLayout(BuildContext context, double screenWidth, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: isTablet ? screenWidth * 0.3 : screenWidth * 0.3,
            height: isTablet ? 100 : 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    LucideIcons.coffee,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('IT Division'),
                    backgroundColor: Colors.brown[50],
                    labelStyle: TextStyle(
                      color: Colors.brown[700],
                      fontSize: isTablet ? 8 : 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 8 : 16),
            child: _buildContent(context, screenWidth, false),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, double screenWidth, bool isMobile) {
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coffee Core',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Coffee Core, developed by JV ALMA C.I.S, empowers coffee farmers with specialized tools for cultivation, market access, and farm management.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: 12,
          children: _features.map((feature) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check,
                    size: 14,
                    color: Color(0xFF16A34A),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title']!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 12 : 14,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          feature['description']!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 12 : 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Text(
          'Media',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: isMobile ? 12 : 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: _media.map((media) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (media['type'] == 'image')
                    Semantics(
                      image: true,
                      label: media['description'],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: isMobile ? 200 : 300,
                          child: Image.asset(
                            media['path']!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(LucideIcons.imageOff, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      media['description']!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown[200]!),
          ),
          child: Column(
            children: [
              Icon(
                LucideIcons.coffee,
                size: 48,
                color: Colors.brown[700],
              ),
              const SizedBox(height: 12),
              Text(
                'Download Coffee Core',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Get the latest version of Coffee Core APK and revolutionize your coffee farming experience!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.brown[700],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _downloadApk(context),
                  icon: const Icon(LucideIcons.download, size: 20),
                  label: Text(
                    'Download APK',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 12 : 16,
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
