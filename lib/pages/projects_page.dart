import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_widgets.dart';
import 'dart:developer' as developer;

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String _selectedCategory = 'All';
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        developer.log('ProjectsPage: Page loaded successfully', name: 'ProjectsPage');
      }
    });
  }

  void _navigateToProject(String redirectLink) {
    final route = redirectLink.isNotEmpty ? redirectLink : '/business-units';
    developer.log('ProjectsPage: Navigating to $route', name: 'ProjectsPage');
    if (mounted) {
      Navigator.pushNamed(context, route).catchError((e) {
        developer.log('ProjectsPage: Navigation error to $route: $e', name: 'ProjectsPage');
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
        developer.log('Navigation error: $e', name: 'ProjectsPage');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigation error: $e')),
          );
        }
        return null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 640 && screenWidth < 1024;

    final allProjects = [
      {
        'id': '1',
        'title': 'United States Embassy - Rosslyn Ridge Renovation',
        'category': 'Construction',
        'location': 'Nairobi, Kenya',
        'year': '2018-2023',
        'status': 'Completed',
        'description': 'Multi-phase renovation of 30+ residential units with modern upgrades including electrical, plumbing, and interior finishing.',
        'image': 'assets/images/construction/rosslyn_ridge_1.jpg',
        'features': [
          '30+ residential units renovated',
          'Modern electrical systems',
          'Complete plumbing overhaul',
          'Interior and exterior finishing',
        ],
        'client': 'United States Embassy',
        'redirectLink': '/construction-detail',
      },
      {
        'id': '2',
        'title': 'Sigor Wei Wei Irrigation Scheme',
        'category': 'Agribusiness',
        'location': 'West Pokot, Kenya',
        'year': '2017-2020',
        'status': 'Completed',
        'description': 'Major civil works for large-scale irrigation scheme including 29 km of underground pipelines to irrigate over 325 hectares.',
        'image': 'assets/images/agribusiness/sigor_1.jpg',
        'features': [
          '29 km underground PVC and HDPE pipelines',
          '325+ hectares irrigation coverage',
          'Community capacity building',
          'Sustainable water management',
        ],
        'client': 'KVDA',
        'redirectLink': '/agribusiness',
      },
      {
        'id': '3',
        'title': 'Coffee Core Mobile Application',
        'category': 'IT Division',
        'location': 'Kenya',
        'year': '2024-2025',
        'status': 'Ongoing',
        'description': 'Mobile application serving over 5,000+ coffee farmers with agricultural management tools and market access.',
        'image': 'assets/images/it/coffee_core.jpg',
        'features': [
          '5,000+ active farmers',
          'Real-time market prices',
          'Farm management tools',
          'Training and resources',
        ],
        'client': 'Coffee Cooperatives',
        'redirectLink': '/coffee-core',
      },
      {
        'id': '4',
        'title': 'CMMS Implementation - Maintenance Facilities',
        'category': 'IT Division',
        'location': 'Multiple Sites',
        'year': '2024-2025',
        'status': 'Ongoing',
        'description': 'Deployment of computerized maintenance management system across multiple industrial facilities.',
        'image': 'assets/images/it/cmms.jpg',
        'features': [
          'Multi-site deployment',
          'Preventive maintenance scheduling',
          'Asset tracking and management',
          'Performance analytics',
        ],
        'client': 'Diplomatic Partners',
        'redirectLink': '/cmms',
      },
      {
        'id': '5',
        'title': 'Oil & Gas Pipeline Inspection Services',
        'category': 'Oil & Gas Services',
        'location': 'East Africa',
        'year': '2022-2025',
        'status': 'Completed',
        'description': 'Professional inspection services for major oil pipeline infrastructure ensuring safety and compliance.',
        'image': 'assets/images/tic/tic_1.jpg',
        'features': [
          'Advanced NDT techniques',
          'Safety compliance audits',
          'Environmental impact assessment',
          'Technical documentation',
        ],
        'client': 'Energy Partners',
        'redirectLink': '/oil-gas',
      },
      {
        'id': '6',
        'title': 'Community Empowerment Training Program',
        'category': 'Agribusiness',
        'location': 'Northern Kenya',
        'year': '2021-2024',
        'status': 'Ongoing',
        'description': 'Comprehensive training program helping pastoralists adapt to climate change through innovative farming techniques.',
        'image': 'assets/images/agribusiness/training_2.jpg',
        'features': [
          '2,000+ farmers trained',
          'Climate-smart agriculture',
          'Drought-resistant crops',
          'Water conservation techniques',
        ],
        'client': 'Development Partners',
        'redirectLink': '/agribusiness',
      },
    ];

    final filteredProjects = _selectedCategory == 'All'
        ? allProjects
        : allProjects.where((project) => project['category'] == _selectedCategory).toList();

    return AppScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section
            _buildHeroSection(context, screenWidth, screenHeight, isMobile, isTablet),
            
            // Filter Section
            _buildFilterSection(context, screenWidth, screenHeight, isMobile, isTablet),
            
            // Projects Grid
            _buildProjectsSection(context, screenWidth, screenHeight, isMobile, isTablet, filteredProjects),
            
            // Call to Action
            _buildCallToActionSection(context, screenWidth, screenHeight, isMobile, isTablet),
            
            SizedBox(height: screenHeight * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, double screenWidth, double screenHeight, bool isMobile, bool isTablet) {
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
        vertical: screenHeight * 0.08,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Our Projects',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Showcasing our commitment to excellence across construction, agribusiness, oil & gas services, and IT sectors',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 16 : isTablet ? 18 : 20,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Delivering innovative solutions that drive sustainable development across East Africa',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 14 : 16,
                      color: Colors.white.withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, double screenWidth, double screenHeight, bool isMobile, bool isTablet) {
    final categories = ['All', 'Construction', 'Agribusiness', 'Oil & Gas Services', 'IT Division'];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.04,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
          child: Column(
            children: [
              Text(
                'Filter by Category',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFF1E293B) : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
                          width: 2,
                        ),
                        boxShadow: isSelected ? [
                          BoxShadow(
                            color: const Color(0xFF1E293B).withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ] : null,
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF374151),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context, double screenWidth, double screenHeight, bool isMobile, bool isTablet, List<Map<String, dynamic>> filteredProjects) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.06,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
          child: Column(
            children: [
              Text(
                'Featured Projects',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              if (filteredProjects.isEmpty)
                Container(
                  padding: const EdgeInsets.all(48),
                  child: Column(
                    children: [
                      const Icon(
                        LucideIcons.search,
                        size: 64,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No projects found for this category',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 20,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                )
              else
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                  childAspectRatio: isMobile ? 0.85 : isTablet ? 0.8 : 0.75,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  children: filteredProjects.map((project) {
                    return _buildProjectCard(context, project, isMobile, isTablet);
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project, bool isMobile, bool isTablet) {
    Color getCategoryColor(String category) {
      switch (category) {
        case 'Construction':
          return const Color(0xFF1E293B);
        case 'Agribusiness':
          return const Color(0xFF059669);
        case 'Oil & Gas Services':
          return const Color(0xFFDC2626);
        case 'IT Division':
          return const Color(0xFF7C3AED);
        default:
          return const Color(0xFF64748B);
      }
    }

    Color getStatusColor(String status) {
      switch (status) {
        case 'Completed':
          return const Color(0xFF059669);
        case 'Ongoing':
          return const Color(0xFFEAB308);
        case 'Planning':
          return const Color(0xFF3B82F6);
        default:
          return const Color(0xFF64748B);
      }
    }

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => _navigateToProject(project['redirectLink']!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            Container(
              height: isMobile ? 180 : 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(project['image']!),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    developer.log('Project image error: $exception', name: 'ProjectsPage');
                  },
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.4),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: getCategoryColor(project['category']!),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              project['category']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: getStatusColor(project['status']!),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              project['status']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            project['year']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (project['value'] != null)
                            Text(
                              project['value']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Project Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title']!,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    if (project['location'] != null)
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.mapPin,
                            size: 14,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              project['location']!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        project['description']!,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 15,
                          color: const Color(0xFF374151),
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Key Features
                    if (project['features'] != null && (project['features'] as List).isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Key Features:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...((project['features'] as List).take(2).map((feature) => 
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Row(
                                children: [
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: getCategoryColor(project['category']!),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      feature,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF64748B),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(height: 12),
                        ],
                      ),
                    
                    // View Details Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 14,
                            color: getCategoryColor(project['category']!),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          LucideIcons.arrowRight,
                          size: 16,
                          color: getCategoryColor(project['category']!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallToActionSection(BuildContext context, double screenWidth, double screenHeight, bool isMobile, bool isTablet) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E40AF),
            Color(0xFF065F46),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.08,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ready to Start Your Next Project?',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Let\'s collaborate to bring your vision to life with our expertise in construction, agribusiness, oil & gas services, and IT solutions.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.6,
                    ),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.04),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  CustomButton(
                    text: 'Get Quote',
                    onPressed: () => _navigate('/contact'),
                    isLarge: isMobile || isTablet,
                    icon: LucideIcons.messageCircle,
                  ),
                  CustomButton(
                    text: 'View Business Units',
                    onPressed: () => _navigate('/business-units'),
                    isOutline: true,
                    isLarge: isMobile || isTablet,
                    icon: LucideIcons.building2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}