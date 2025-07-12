/*import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import 'dart:developer' as developer;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        developer.log('NewsPage: Page loaded successfully', name: 'NewsPage');
      }
    });
  }

  void _navigateToArticle(String articleId) {
    developer.log('NewsPage: Navigating to article $articleId', name: 'NewsPage');
    if (mounted) {
      Navigator.pushNamed(context, '/news/$articleId').catchError((e) {
        developer.log('NewsPage: Navigation error: $e', name: 'NewsPage');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigation error: $e')),
          );
        }
        return null;
      });
    }
  }

  void _navigate(String route) {
    if (mounted) {
      Navigator.pushNamed(context, route).catchError((e) {
        developer.log('Navigation error: $e', name: 'NewsPage');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigation error: $e')),
          );
        }
        return null;
      });
    }
  }

  Future<void> _subscribe() async {
    setState(() {
      _isSubmitting = true;
    });

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSubmitting = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Subscribed successfully!')),
      );
    }
  }

  void _showImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _openPdfArticle() async {
    try {
      // Try to open the PDF URL directly
      const String pdfUrl = 'https://www.malindikenya.net/en/articles/social/solidarity/italian--giardiniera--helps-kenyan-farmers.html';
      
      final Uri uri = Uri.parse(pdfUrl);
      
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        developer.log('NewsPage: Successfully opened PDF URL', name: 'NewsPage');
      } else {
        // Fallback: Show the complete article content in a dialog
        _showCompletePdfDialog();
      }
    } catch (e) {
      developer.log('NewsPage: Error opening PDF URL: $e', name: 'NewsPage');
      // Fallback: Show the complete article content in a dialog
      _showCompletePdfDialog();
    }
  }

  void _showCompletePdfDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Italian 'giardiniera' helps Kenyan farmers",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(LucideIcons.externalLink),
                          onPressed: () async {
                            const url = 'https://www.malindikenya.net/en/articles/social/solidarity/italian--giardiniera--helps-kenyan-farmers.html';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                            }
                          },
                          tooltip: 'Open original article',
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header section
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'COOPERATION',
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Italian \'giardiniera\' helps Kenyan farmers',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900],
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'ALMACIS INTELLIGENT SUPPORT IN WEST POKOT',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800],
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '23-11-2023 by Freddie del Curatolo',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Main article image
                        Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/news/italian_newspaper_image.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: Colors.grey[100],
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LucideIcons.users,
                                      size: 48,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Chef and farmers in kitchen setting\nwith fresh vegetables for giardiniera project',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: Colors.grey[600],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Article content
                        Text(
                          'Concrete help to the populations of one of the most troubled areas of Kenya, West Pokot, thanks also to an all-Italian speciality, to make the most of their agriculture and shift their mentality from agribusiness as an unprofitable activity to one that could lead to job creation.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'This is the project prepared by the Abruzzo-based company Joint Venture Almacis, which, after winning a call for tenders issued by the International Development Cooperation, in 2020 started working on Kenyan territory, specifically in the village of Sigor, near the Wei Wei river in West Pokot county.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Agriculture in that area, due to the endemic lack of water, is problematic and the farmers only work in the fields for subsistence purposes and at best they practise barter, i.e. they exchange their products with those of other farmers and breeders.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'The aim of JV Almacis from the outset was to move community members from subsistence farming to agribusiness. To curb the problem of the lack of a constant water source, Almacis first decided to install an irrigation scheme.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        
                        // Quote section
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green[200]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                LucideIcons.quote,
                                color: Colors.green[600],
                                size: 24,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '"After the implementation of the irrigation scheme, farmers can now reserve a portion of land for subsistence farming. This effectively eliminates malnutrition in the community. The school monitoring report substantially indicates how the lives of the school going children have been affected by the irrigation project. Access to food, better hygiene thanks to access to water, and the elimination of problems with school fees are some of the benefits the school going children now enjoy."',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.green[800],
                                      height: 1.6,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'The first phase of the project involved reaching a memorandum of understanding with Moi University in Eldoret in order to offer young engineers graduates opportunities in line with the call.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Here, young engineers were able to be trained to acquire the necessary skills to manage agro-entrepreneurial activities. From there, active involvement with community members began.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'The aim is simple, as well as not an end in itself, which our cooperation, through \'project\' donations, has been pursuing for years: to guarantee producers that by improving in all phases and sectors of cultivation and harvesting, right up to sale, they will be able to repay the loan granted.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'This is how, under the auspices of the Kiptolelyo aid group, sowing of organic products has begun, with a focus on watermelon, which, according to expert studies, is the most suitable crop because of the pH of the soil, but also beans, which have recently been sold with good returns, and vegetables.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.6),
                        ),
                        const SizedBox(height: 16),
                        
                        // Giardiniera project highlight
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.orange[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange[200]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.chefHat,
                                    color: Colors.orange[600],
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Italian Giardiniera Project',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange[800],
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'And, icing on the cake, the latest Kopluk community project supported by Almacis and presented at the recent World Italian Cuisine Week. With specific training from chef Luca Mastromattei and his team, the Kopluk farmers have transformed some of their best vegetables into a totally organic, high quality \'niche\' product: it is the classic Italian giardiniera, pickled vegetables in glass jars that can be sold to generate other income.',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.orange[800],
                                      height: 1.6,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'All in keeping with Almacis\' credo of implementing an \'beyond subsidy mentality\' ideology for local farming communities.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[800],
                                height: 1.6,
                              ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Source and link
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Source: MalindiKenya.net',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                              ),
                              const SizedBox(height: 4),
                              GestureDetector(
                                onTap: () async {
                                  const url = 'https://www.malindikenya.net/en/articles/social/solidarity/italian--giardiniera--helps-kenyan-farmers.html';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                                  }
                                },
                                child: Text(
                                  'https://www.malindikenya.net/en/articles/social/solidarity/italian--giardiniera--helps-kenyan-farmers.html',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.blue[600],
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'monospace',
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

    return AppScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section
            ClipRRect(
              child: Container(
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
                  vertical: screenHeight * 0.06,
                  horizontal: screenWidth * 0.04,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'News & Updates',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: isMobile ? 24 : 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Stay informed about JV ALMA C.I.S\'s latest achievements, project milestones, and industry insights',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFFBFDBFE),
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // News Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _showImageDialog('assets/news/news_2.jpg'),
                      child: Image.asset(
                        'assets/news/news_2.jpg',
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(LucideIcons.imageOff, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pastoralists in West Pokot reap big from seed maize farming',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTap: () => _showImageDialog('assets/news/wei_wei_project.jpg'),
                      child: Image.asset(
                        'assets/news/wei_wei_project.jpg',
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(LucideIcons.imageOff, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Wei Wei irrigation scheme to be handed over to pastoralists',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // PDF Article Card
                    GestureDetector(
                      onTap: _openPdfArticle,
                      child: Container(
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    LucideIcons.newspaper,
                                    size: 24,
                                    color: Colors.red[600],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Italian \'giardiniera\' helps Kenyan farmers',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF1F2937),
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'ALMACIS INTELLIGENT SUPPORT IN WEST POKOT',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Colors.blue[700],
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        '23-11-2023 by Freddie del Curatolo',
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                              color: Colors.grey[600],
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  LucideIcons.externalLink,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Read the complete newspaper article about JV ALMA C.I.S\'s innovative project in West Pokot, helping farmers transition from subsistence to profitable agribusiness through Italian expertise and the production of organic giardiniera.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF6B7280),
                                  ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.mousePointer,
                                    size: 14,
                                    color: Colors.blue[700],
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Click to read the complete article with images',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Colors.blue[700],
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTap: () => _showImageDialog('assets/news/news_3.jpg'),
                      child: Image.asset(
                        'assets/news/news_3.jpg',
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(LucideIcons.imageOff, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pastoralists in Baringo Kapluk reap big from seed maize farming (continued)',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            // Newsletter Signup
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF9FAFB),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Stay Updated',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Subscribe to our newsletters to receive the latest news and updates from JV ALMA C.I.S',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter your email address',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: isMobile ? 12 : 14,
                                    color: const Color(0xFF6B7280),
                                  ),
                            ),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF111827),
                                ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _subscribe,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: isMobile ? 12 : 16,
                              horizontal: isMobile ? 16 : 24,
                            ),
                          ),
                          child: Text(
                            _isSubmitting ? 'Subscribing...' : 'Subscribe',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'We respect your privacy. Unsubscribe at any time.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 10 : 12,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
}
*/