// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import 'dart:developer' as developer;
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        developer.log('NewsPage: Page loaded successfully', name: 'NewsPage');
      }
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  void _showImageDialog(String imageUrl, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 200,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(LucideIcons.imageOff, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(LucideIcons.x, color: Colors.black),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    final newsItems = [
      {
        'image': 'assets/news/news_2.jpg',
        'title': 'Pastoralists in West Pokot reap big from seed maize farming',
        'excerpt': 'Transforming lives through agricultural innovation in West Pokot region',
        'date': 'Project Highlight',
        'category': 'Agriculture',
        'color': const Color(0xFF059669),
      },
      {
        'image': 'assets/news/wei_wei_project.jpg',
        'title': 'Wei Wei irrigation scheme to be handed over to pastoralists',
        'excerpt': 'Empowering communities with sustainable irrigation infrastructure',
        'date': 'Infrastructure',
        'category': 'Development',
        'color': const Color(0xFF2563EB),
      },
      {
        'image': 'assets/news/italy_project.jpg',
        'title': 'Italian "giardiniera" helps Kenyan farmers',
        'excerpt': 'International collaboration bringing expertise to local agriculture',
        'date': 'Partnership',
        'category': 'Collaboration',
        'color': const Color(0xFFDC2626),
      },
      {
        'image': 'assets/news/news_3.jpg',
        'title': 'Pastoralists in Baringo Kapluk benefit from seed maize farming',
        'excerpt': 'Continued success stories from our agricultural development programs',
        'date': 'Impact Story',
        'category': 'Agriculture',
        'color': const Color(0xFF7C3AED),
      },
      {
        'image': 'assets/news/gourmet_article.jpg',
        'title': 'From Abruzzo to Kenya: The Digital Revolution Transforming African Agriculture',
        'excerpt': 'Technology, training and sustainable agriculture: the story of an Italian company building a development model in East Africa where innovation and social impact grow together.',
        'date': 'March 6, 2026',
        'category': 'Press',
        'color': const Color(0xFF059669),
        'url': 'https://www.gourmetandtravelmagazine.com/2026/03/06/dallabruzzo-al-kenya-la-rivoluzione-digitale-che-sta-cambiando-lagricoltura-africana/',
        'source': 'Gourmet & Travel Magazine',
      },
      {
        'image': 'assets/news/ilpescara_article.jpg',
        'title': 'With JV Almacis, Pescara Native Di Carmine is Leading Agriculture 2.0 in Kenya, Combining Business and Social Development',
        'excerpt': 'How a Pescara entrepreneur built a digital agribusiness model in Kenya, blending technology, sustainability, and social impact across East Africa.',
        'date': 'March 2026',
        'category': 'Press',
        'color': const Color(0xFF2563EB),
        'url': 'https://www.ilpescara.it/attualita/piergiorgio-di-carmine-jv-almacis-kenya-agricoltura-digitale.html',
        'source': 'Il Pescara',
      },
    ];

    return AppScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section
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
                vertical: isMobile ? 32 : 48,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LucideIcons.newspaper,
                        size: isMobile ? 40 : 56,
                        color: const Color(0xFFF97316),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'News & Updates',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: isMobile ? 28 : 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Text(
                        'Stay informed about JV ALMA C.I.S\'s latest achievements, project milestones, and industry insights',
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
            ),

            // News Grid Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 48,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  children: [
                    Text(
                      'Latest Stories',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 24 : 32,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Highlights from our recent projects and initiatives',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 13 : 15,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
                    
                    // News Cards Grid
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: newsItems.map((item) {
                        return SizedBox(
                          width: isMobile
                              ? double.infinity
                              : isTablet
                                  ? (screenWidth - 64) / 2
                                  : (screenWidth - 96) / 2,
                          child: _buildNewsCard(
                            context,
                            isMobile,
                            item['image'] as String,
                            item['title'] as String,
                            item['excerpt'] as String,
                            item['date'] as String,
                            item['category'] as String,
                            item['color'] as Color,
                            externalUrl: item['url'] as String?,
                            source: item['source'] as String?,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            // Stay Updated Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFF7ED),
                    Color(0xFFFFEDD5),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 56,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 800),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33F97316),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        LucideIcons.bell,
                        size: isMobile ? 32 : 40,
                        color: const Color(0xFFF97316),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Stay Connected',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 24 : 32,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Follow us on social media for real-time updates, behind-the-scenes content, and more stories from JV ALMA C.I.S',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialButton(
                          context,
                          isMobile,
                          LucideIcons.linkedin,
                          'LinkedIn',
                          const Color(0xFF0A66C2),
                          () => _launchUrl('https://www.linkedin.com/company/jvalmacis/'),
                        ),
                        const SizedBox(width: 16),
                        _buildSocialButton(
                          context,
                          isMobile,
                          LucideIcons.instagram,
                          'Instagram',
                          const Color(0xFFE4405F),
                          () => _launchUrl('https://www.instagram.com/jvalmacis/'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context,
    bool isMobile,
    String imageUrl,
    String title,
    String excerpt,
    String date,
    String category,
    Color categoryColor, {
    String? externalUrl,
    String? source,
  }) {
    final bool isExternal = externalUrl != null && externalUrl.isNotEmpty;
    return GestureDetector(
      onTap: () {
        if (isExternal) {
          _launchUrl(externalUrl);
        } else {
          _showImageDialog(imageUrl, title);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: isMobile ? 200 : 240,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: isMobile ? 200 : 240,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(LucideIcons.imageOff, color: Colors.grey, size: 48),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (isExternal)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(LucideIcons.externalLink, size: 12, color: categoryColor),
                          const SizedBox(width: 4),
                          Text(
                            'External',
                            style: TextStyle(
                              fontSize: 11,
                              color: categoryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            
            // Content Section
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.tag,
                        size: 14,
                        color: Color(0xFF9CA3AF),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: const Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    excerpt,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: isMobile ? 13 : 14,
                          color: const Color(0xFF6B7280),
                          height: 1.5,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        isExternal ? 'Read Article' : 'View Article',
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 14,
                          color: categoryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        isExternal ? LucideIcons.externalLink : LucideIcons.arrowRight,
                        size: 16,
                        color: categoryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    bool isMobile,
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: isMobile ? 20 : 24),
      label: Text(
        label,
        style: TextStyle(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 28,
          vertical: isMobile ? 12 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
      ),
    );
  }
}