import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_widgets.dart';
import 'dart:developer' as developer;

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _whoWeAreController;
  late Animation<double> _titleAnimation;
  late Animation<double> _firstParagraphAnimation;
  late Animation<double> _secondParagraphAnimation;
  late Animation<double> _thirdParagraphAnimation;

  late AnimationController _journeyController;
  late List<Animation<double>> _milestoneAnimations;

  @override
  void initState() {
    super.initState();

    // Who We Are animations
    _whoWeAreController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _titleAnimation = Tween<double>(begin: 0.2, end: 0).animate(
      CurvedAnimation(parent: _whoWeAreController, curve: Curves.easeOut),
    );
    _firstParagraphAnimation = Tween<double>(begin: -0.2, end: 0).animate(
      CurvedAnimation(parent: _whoWeAreController, curve: Curves.easeOut),
    );
    _secondParagraphAnimation = Tween<double>(begin: 0.2, end: 0).animate(
      CurvedAnimation(parent: _whoWeAreController, curve: Curves.easeOut),
    );
    _thirdParagraphAnimation = Tween<double>(begin: -0.2, end: 0).animate(
      CurvedAnimation(parent: _whoWeAreController, curve: Curves.easeOut),
    );

    // Our Journey animations
    _journeyController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _milestoneAnimations = List.generate(4, (index) {
      return Tween<double>(
        begin: index.isEven ? -0.2 : 0.2,
        end: 0,
      ).animate(
        CurvedAnimation(parent: _journeyController, curve: Curves.easeOut),
      );
    });
  }

  @override
  void dispose() {
    _whoWeAreController.dispose();
    _journeyController.dispose();
    super.dispose();
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
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
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'About Our Company',
                style: TextStyle(
                  fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Building partnerships, delivering excellence, and creating sustainable solutions across East Africa.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : isTablet ? 18 : 20,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
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
        child: Column(
          children: [
            _buildHeroSection(context, isMobile, isTablet),
            _buildCompanyOverviewSection(context, isMobile, isTablet),
            _buildMissionVisionSection(context, isMobile, isTablet),
            _buildValuesSection(context, isMobile, isTablet),
            _buildTeamSection(context, isMobile, isTablet),
            _buildLeadershipSection(context, isMobile, isTablet, screenWidth, screenHeight),
            _buildTestimonialsSection(context, isMobile, isTablet, screenWidth, screenHeight),
            _buildHistorySection(context, isMobile, isTablet),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyOverviewSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: VisibilityDetector(
            key: const Key('who-we-are-section'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.5) {
                if (_whoWeAreController.status != AnimationStatus.forward &&
                    _whoWeAreController.status != AnimationStatus.completed) {
                  _whoWeAreController.forward();
                }
              }
            },
            child: AnimatedBuilder(
              animation: _whoWeAreController,
              builder: (context, child) {
                return Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, _titleAnimation.value * 50),
                      child: Opacity(
                        opacity: _whoWeAreController.value,
                        child: Text(
                          'Who We Are',
                          style: TextStyle(
                            fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Transform.translate(
                      offset: Offset(_firstParagraphAnimation.value * 100, 0),
                      child: Opacity(
                        opacity: _whoWeAreController.value,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'JV ALMA C.I.S',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  color: const Color(0xFF0F172A),
                                  fontWeight: FontWeight.bold,
                                  height: 1.6,
                                ),
                              ),
                              TextSpan(
                                text: ' is a leading multi-sector company that specializes in construction, agribusiness, oil & gas services, and information technology solutions. Established with a vision to drive sustainable development across East Africa, we have built a reputation for delivering high-quality projects and innovative solutions that meet the evolving needs of our clients.',
                                style: TextStyle(
                                  fontSize: isMobile ? 16 : 18,
                                  color: const Color(0xFF374151),
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Transform.translate(
                      offset: Offset(_secondParagraphAnimation.value * 100, 0),
                      child: Opacity(
                        opacity: _whoWeAreController.value,
                        child: Text(
                          'Our diverse portfolio spans across multiple industries, allowing us to leverage cross-sector expertise and deliver comprehensive solutions that create lasting value for our stakeholders.',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            color: const Color(0xFF374151),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Transform.translate(
                      offset: Offset(_thirdParagraphAnimation.value * 100, 0),
                      child: Opacity(
                        opacity: _whoWeAreController.value,
                        child: Text(
                          'Our agribusiness work supports food security through rural development and smart farming tools like CoffeeCore and KilimoMkononi. The company also provides regional inspection services in the oil & gas sector and offers NyumbaSmart, our custom CMMS platform for facility maintenance and asset management.',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            color: const Color(0xFF374151),
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMissionVisionSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _buildMissionCard(context, isMobile),
                    const SizedBox(height: 32),
                    _buildVisionCard(context, isMobile),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(child: _buildMissionCard(context, isMobile)),
                    const SizedBox(width: 32),
                    Expanded(child: _buildVisionCard(context, isMobile)),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMissionCard(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              LucideIcons.target,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Our Mission',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'To deliver exceptional construction, agribusiness, energy, and technology solutions that drive sustainable development and create lasting value for our clients and communities across East Africa.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF374151),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildVisionCard(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF059669),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              LucideIcons.eye,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Our Vision',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'To be the leading multi-sector company in East Africa, recognized for innovation, sustainability, and excellence in transforming communities through integrated solutions.',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xFF374151),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildValuesSection(BuildContext context, bool isMobile, bool isTablet) {
    final values = [
      {
        'icon': LucideIcons.award,
        'title': 'Excellence',
        'description': 'We strive for the highest standards in everything we do, delivering quality that exceeds expectations.',
      },
      {
        'icon': LucideIcons.users,
        'title': 'Integrity',
        'description': 'We conduct business with honesty, transparency, and ethical practices in all our interactions.',
      },
      {
        'icon': LucideIcons.lightbulb,
        'title': 'Innovation',
        'description': 'We embrace new technologies and creative solutions to solve complex challenges.',
      },
      {
        'icon': LucideIcons.leaf,
        'title': 'Sustainability',
        'description': 'We are committed to environmentally responsible practices and sustainable development.',
      },
      {
        'icon': LucideIcons.hand,
        'title': 'Partnership',
        'description': 'We build strong, collaborative relationships with clients, partners, and communities.',
      },
      {
        'icon': LucideIcons.zap,
        'title': 'Efficiency',
        'description': 'We optimize processes and resources to deliver maximum value and timely results.',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Our Values',
                style: TextStyle(
                  fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'The principles that guide our work and relationships',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  double childAspectRatio;

                  if (isMobile) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.5;
                  } else if (isTablet) {
                    crossAxisCount = 2;
                    childAspectRatio = 3.0;
                  } else {
                    crossAxisCount = 3;
                    childAspectRatio = 1.2;
                  }

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    children: values.map((value) {
                      return Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              value['icon'] as IconData,
                              size: 32,
                              color: const Color(0xFF1E293B),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              value['title'] as String,
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F172A),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              value['description'] as String,
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 15,
                                color: const Color(0xFF374151),
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 28 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Our Team',
                style: TextStyle(
                  fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'Our success is built on the expertise, dedication, and passion of our diverse team of professionals. From experienced engineers and project managers to innovative IT specialists and agricultural experts, our team brings together decades of combined experience across multiple industries.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF374151),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Join Our Team',
                onPressed: () {
                  developer.log('About: Navigating to careers', name: 'AboutPage');
                  Navigator.pushNamed(context, '/careers').catchError((e) {
                    developer.log('About: Navigation error: $e', name: 'AboutPage');
                    return Future<Null>.value(null);
                  });
                },
                isLarge: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeadershipSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth, double screenHeight) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.03,
        horizontal: screenWidth * 0.04,
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
        child: CustomCard(
          content: Padding(
            padding: EdgeInsets.all(isMobile ? 8 : 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Leadership Team',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: const Color(0xFF1F2937),
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'Experienced professionals driving our success',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF4B5563),
                        fontSize: isMobile ? 14 : 16,
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenHeight * 0.02),
                GridView.count(
                  crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                  shrinkWrap: true,
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: isMobile ? 2.5 : isTablet ? 2.4 : 2.3,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _leadershipCard(
                      initials: 'PD',
                      name: 'Piergiorgio Di Carmine',
                      title: 'CEO and Founder',
                      description: 'Managing Director.',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                      ),
                      fontSize: isMobile ? 12 : 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // FIXED TESTIMONIALS SECTION - No more overflow errors
  Widget _buildTestimonialsSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth, double screenHeight) {
    final testimonials = [
      {
        'quote':
            '"I can now analyze pests and diseases affecting my farm from the comfort of my home. JV ALMA C.I.S agronomists offer real-time insights on the remedies to take when my crop has been affected."',
        'author': 'Gideon',
        'location': 'Farmer in Wote, Makueni County',
      },
      {
        'quote':
            '"We would like to applaud JV ALMA C.I.S for their effort in ensuring the success of the project. Through the use of technology, our yields have increased and food scarcity is now a thing of the past."',
        'author': 'Job Kibet',
        'location': 'Farmer in Kapluk, Baringo County',
      },
      {
        'quote':
            '"I cannot say enough about what a positive and valuable experience working with JV ALMA C.I.S, and having our own fabulous intern has been for the farm and for me personally."',
        'author': 'Oseo Geofrey',
        'location': '',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.05,
        horizontal: isMobile ? 16 : screenWidth * 0.04,
      ),
      color: const Color(0xFFF9FAFB),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth : 1200),
          child: Column(
            children: [
              Text(
                'What People Say About Us',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF1F2937),
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Hear from our community about the impact of our work',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF4B5563),
                      fontSize: isMobile ? 16 : 18,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              
              // Mobile: Single column layout
              if (isMobile)
                Column(
                  children: testimonials.asMap().entries.map((entry) {
                    final index = entry.key;
                    final testimonial = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: _testimonialCard(
                        quote: testimonial['quote']!,
                        author: testimonial['author']!,
                        location: testimonial['location']!,
                        fontSize: 14,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        index: index,
                      ),
                    );
                  }).toList(),
                )
              
              // Tablet/Desktop: Grid layout
              else
                GridView.count(
                  crossAxisCount: isTablet ? 1 : 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isTablet ? 3.5 : 2.5, // Increased for more height
                  physics: const NeverScrollableScrollPhysics(),
                  children: testimonials.asMap().entries.map((entry) {
                    final index = entry.key;
                    final testimonial = entry.value;
                    return _testimonialCard(
                      quote: testimonial['quote']!,
                      author: testimonial['author']!,
                      location: testimonial['location']!,
                      fontSize: 16,
                      isMobile: isMobile,
                      isTablet: isTablet,
                      index: index,
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistorySection(BuildContext context, bool isMobile, bool isTablet) {
    final milestones = [
      {
        'year': '2017',
        'title': 'Company Founded',
        'description': 'JV ALMA C.I.S Kenya was established with a focus on construction services.',
      },
      {
        'year': '2021',
        'title': 'Expansion into Agribusiness',
        'description': 'Diversified operations to include agricultural solutions and climate resilience programs.',
      },
      {
        'year': '2022',
        'title': 'Oil & Gas Services Launch',
        'description': 'Entered the energy sector with professional inspection and partnership services.',
      },
      {
        'year': '2024',
        'title': 'IT Division Established',
        'description': 'Launched technology solutions including NyumbaSmart CMMS management software, Kilimo Mkononi platform and Coffee Core platform systems.',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: VisibilityDetector(
            key: const Key('our-journey-section'),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction > 0.5) {
                if (_journeyController.status != AnimationStatus.forward &&
                    _journeyController.status != AnimationStatus.completed) {
                  _journeyController.forward();
                }
              }
            },
            child: AnimatedBuilder(
              animation: _journeyController,
              builder: (context, child) {
                return Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, _journeyController.value * 50),
                      child: Opacity(
                        opacity: _journeyController.value,
                        child: Text(
                          'Our Journey',
                          style: TextStyle(
                            fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Column(
                      children: milestones.asMap().entries.map((entry) {
                        final index = entry.key;
                        final milestone = entry.value;
                        final isLast = index == milestones.length - 1;

                        return Transform.translate(
                          offset: Offset(_milestoneAnimations[index].value * 100, 0),
                          child: Opacity(
                            opacity: _journeyController.value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1E293B),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          milestone['year']!.substring(2),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (!isLast)
                                      Container(
                                        width: 2,
                                        height: 80,
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 32),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          milestone['year']!,
                                          style: TextStyle(
                                            fontSize: isMobile ? 14 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: const Color(0xFF64748B),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          milestone['title']!,
                                          style: TextStyle(
                                            fontSize: isMobile ? 18 : 20,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFF0F172A),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          milestone['description']!,
                                          style: TextStyle(
                                            fontSize: isMobile ? 14 : 16,
                                            color: const Color(0xFF374151),
                                            height: 1.5,
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
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _leadershipCard({
    required String initials,
    required String name,
    required String title,
    required String description,
    required LinearGradient gradient,
    required double fontSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize + 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: fontSize + 2,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: const Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: fontSize - 2,
                    color: const Color(0xFF6B7280),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FIXED TESTIMONIAL CARD - No more overflow errors
  Widget _testimonialCard({
    required String quote,
    required String author,
    required String location,
    required double fontSize,
    required bool isMobile,
    required bool isTablet,
    required int index,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? 220 : 200,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quote icon at the top
          Icon(
            Icons.format_quote,
            color: const Color(0xFF4B5563),
            size: isMobile ? 20 : 24,
          ),
          
          SizedBox(height: isMobile ? 12 : 16),
          
          // Quote text - FIRST (takes available space)
          Flexible(
            flex: 3,
            child: Text(
              quote,
              style: TextStyle(
                fontSize: fontSize,
                color: const Color(0xFF374151),
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
              maxLines: isMobile ? 8 : 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // Spacer
          const SizedBox(height: 16),
          
          // Author and location section - SECOND (fixed at bottom)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                author,
                style: TextStyle(
                  fontSize: fontSize * 0.95,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
              ),
              if (location.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: fontSize * 0.85,
                    color: const Color(0xFF6B7280),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
