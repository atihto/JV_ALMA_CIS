import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class CertificatesPage extends StatelessWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void navigate(String route) {
      debugPrint('CertificatesPage: Navigating to $route');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        try {
          Navigator.pushNamed(context, route);
          debugPrint('CertificatesPage: Navigation to $route successful');
        } catch (e) {
          debugPrint('CertificatesPage: Navigation error to $route: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Navigation error: $e')),
          );
        }
      });
    }

    void showImageDialog(String imagePath) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: SizedBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.8,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Text('Failed to load image'),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(), // Assuming AppDrawer exists; adjust if needed
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Header(onMenuPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: isMobile ? screenHeight * 0.4 : screenHeight * 0.5,
                ),
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
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Certificates & Compliance',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: isMobile ? 24 : 28,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'JV ALMA C.I.S maintains high standards of compliance.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  children: [
                    Text(
                      'Our Certifications',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Commitment to quality, safety, and compliance.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < 10; i++)
                                Padding(
                                  padding: EdgeInsets.only(right: screenWidth * 0.02),
                                  child: _CertificateCard(
                                    title: i == 0
                                        ? 'ISO 9001:2015 Certification'
                                        : i == 1
                                            ? 'NCA 1 - Building Works'
                                            : i == 2
                                                ? 'NCA 1 - Water Works'
                                                : i == 3
                                                    ? 'NCA 1 - Mechanical Engineering Services'
                                                    : 'Other Certificate',
                                    certificateNo: i == 0
                                        ? 'CERT-9001-2023'
                                        : i == 1
                                            ? 'NCA-BUILD-2023'
                                            : i == 2
                                                ? 'NCA-WATER-2023'
                                                : i == 3
                                                    ? 'NCA-MECH-2023'
                                                    : 'PENDING',
                                    description: i == 0
                                        ? 'Quality Management System'
                                        : i == 1
                                            ? 'Building Works Compliance'
                                            : i == 2
                                                ? 'Water Works Compliance'
                                                : i == 3
                                                    ? 'Mechanical Engineering Compliance'
                                                    : 'Pending certificate',
                                    issuer: i == 0
                                        ? 'ISO'
                                        : i == 1
                                            ? 'NCA'
                                            : i == 2
                                                ? 'NCA'
                                                : i == 3
                                                    ? 'NCA'
                                                    : null,
                                    issueDate: i == 0
                                        ? '2023-01-01'
                                        : i == 1
                                            ? '2023-02-01'
                                            : i == 2
                                                ? '2023-03-01'
                                                : i == 3
                                                    ? '2023-04-01'
                                                    : null,
                                    expiryDate: i == 0
                                        ? '2026-01-01'
                                        : i == 1
                                            ? '2026-02-01'
                                            : i == 2
                                                ? '2026-03-01'
                                                : i == 3
                                                    ? '2026-04-01'
                                                    : null,
                                    image: i == 0
                                        ? 'assets/certificates/jv_certificate.jpg'
                                        : i == 1
                                            ? 'assets/certificates/nca_building_certificate.jpg'
                                            : i == 2
                                                ? 'assets/certificates/nca_water_certificate.jpg'
                                                : i == 3
                                                    ? 'assets/certificates/nca_mechanical_certificate.jpg'
                                                    : null,
                                    isMobile: isMobile,
                                    isTablet: isTablet,
                                    onImageTap: i < 4
                                        ? () => showImageDialog(
                                              i == 0
                                                  ? 'assets/certificates/jv_certificate.jpg'
                                                  : i == 1
                                                      ? 'assets/certificates/nca_building_certificate.jpg'
                                                      : i == 2
                                                          ? 'assets/certificates/nca_water_certificate.jpg'
                                                          : 'assets/certificates/nca_mechanical_certificate.jpg',
                                            )
                                        : null,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Our Commitment to Compliance',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: isMobile ? 20 : 24,
                                color: const Color(0xFF111827),
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Dedicated to compliance, quality, and certification.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF4B5563),
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Wrap(
                          spacing: screenWidth * 0.03,
                          runSpacing: screenHeight * 0.015,
                          alignment: WrapAlignment.center,
                          children: [
                            _CommitmentCard(
                              icon: LucideIcons.award,
                              title: 'Quality Assured',
                              description: 'ISO 9001:2015 certified.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _CommitmentCard(
                              icon: LucideIcons.checkCircle,
                              title: 'Fully Compliant',
                              description: 'Requirements met.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _CommitmentCard(
                              icon: LucideIcons.globe,
                              title: 'Internationally Recognized',
                              description: 'Global operations.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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

class _CertificateCard extends StatelessWidget {
  final String title;
  final String certificateNo;
  final String description;
  final String? issuer;
  final String? issueDate;
  final String? expiryDate;
  final String? image;
  final bool isMobile;
  final bool isTablet;
  final VoidCallback? onImageTap;

  const _CertificateCard({
    required this.title,
    required this.certificateNo,
    required this.description,
    this.issuer,
    this.issueDate,
    this.expiryDate,
    this.image,
    required this.isMobile,
    required this.isTablet,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomCard(
      content: Container(
        width: isMobile ? screenWidth * 0.9 : 300,
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null)
              GestureDetector(
                onTap: onImageTap,
                child: Container(
                  height: isMobile ? 25 : 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              )
            else
              Container(
                height: isMobile ? 25 : 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Pending',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          fontSize: isMobile ? 8 : 10,
                        ),
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                    fontSize: isMobile ? 10 : 12,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'No: $certificateNo',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: isMobile ? 6 : 8,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: isMobile ? 8 : 10,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
              Text(
                'Issuer: $issuer',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6B7280),
                      fontSize: isMobile ? 6 : 8,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (issueDate != null)
              Text(
                'Issue: $issueDate',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6B7280),
                      fontSize: isMobile ? 6 : 8,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (expiryDate != null)
              Text(
                'Expiry: $expiryDate',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6B7280),
                      fontSize: isMobile ? 6 : 8,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}

class _CommitmentCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final double fontSize;
  final bool isMobile;

  const _CommitmentCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: isMobile ? 20 : 24, color: iconColor),
            const SizedBox(height: 6),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: fontSize * 0.8,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}