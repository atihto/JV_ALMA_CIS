import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_widgets.dart';
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
                      onTap: () => _showImageDialog('assets/news/news_3.jpg'),
                      child: Image.asset(
                        'assets/news/news_3.jpg',
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        fit: BoxFit.contain,
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
                    SizedBox(height: screenHeight * 0.02),
                    GestureDetector(
                      onTap: () => _showImageDialog('assets/news/wei_wei_project.jpg'),
                      child: Image.asset(
                        'assets/news/wei_wei_project.jpg',
                        width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.7 : 800,
                        fit: BoxFit.contain,
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
                        CustomButton(
                          text: _isSubmitting ? 'Subscribing...' : 'Subscribe',
                          onPressed: _subscribe,
                          isLarge: isMobile,
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
            // Call to Action
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E40AF), Color(0xFF1E3A8A)],
                ),
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
                      'Ready to Work With Us?',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Join the companies and organizations that trust JV ALMA C.I.S for their construction, agribusiness, oil & gas services, and IT needs.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: const Color(0xFFEFF6FF),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: screenWidth * 0.02,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Contact Us',
                          onPressed: () => _navigate('/contact'),
                          isLarge: isTablet || isMobile,
                        ),
                        CustomButton(
                          text: 'View Our Projects',
                          onPressed: () => _navigate('/projects'),
                          isOutline: true,
                          isLarge: isTablet || isMobile,
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
}
