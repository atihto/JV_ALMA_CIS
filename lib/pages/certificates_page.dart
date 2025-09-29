import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({super.key});

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  late ScrollController _scrollController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;


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
      drawer: const Drawer(),
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
                    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
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
                        return Row(
                          children: [
                            IconButton(
                              icon: Icon(LucideIcons.chevronLeft, color: Colors.blue, size: isMobile ? 24 : 32),
                              onPressed: () {
                                _scrollController.animateTo(
                                  _scrollController.offset - 300,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var i = 0; i < 11; i++)
                                      Padding(
                                        padding: EdgeInsets.only(right: screenWidth * 0.02),
                                        child: _CertificateCard(
                                          title: i == 0
                                              ? 'JV Certificate'
                                              : i == 1
                                                  ? 'Business Permit'
                                                  : i == 2
                                                      ? 'KRA Certificate'
                                                      : i == 3
                                                          ? 'NCA Building Certificate'
                                                          : i == 4
                                                              ? 'NCA Mechanical Certificate'
                                                              : i == 5
                                                                  ? 'NCA Water Certificate'
                                                                  : i == 6
                                                                      ? 'Building Works Certificate (2026)'
                                                                      : i == 7
                                                                          ? 'Water Works Certificate (2026)'
                                                                          : i == 8
                                                                              ? 'Mechanical Service Certificate (2026)'
                                                                              : i == 9
                                                                                  ? 'Water Works Certificate (2028)'
                                                                                  : i == 10
                                                                                      ? 'Mechanical Service Certificate (2028)'
                                                                                      : 'Other Certificate',
                                          certificateNo: i == 0
                                              ? 'JV-CERT-2023'
                                              : i == 1
                                                  ? 'BUS-PERMIT-2023'
                                                  : i == 2
                                                      ? 'KRA-CERT-2023'
                                                      : i == 3
                                                          ? 'NCA-BUILD-2023'
                                                          : i == 4
                                                              ? 'NCA-MECH-2023'
                                                              : i == 5
                                                                  ? 'NCA-WATER-2023'
                                                                  : i == 6
                                                                      ? '61515/B/0920'
                                                                      : i == 7
                                                                          ? '61515/W/0920'
                                                                          : i == 8
                                                                              ? '61515/M/0920'
                                                                              : i == 9
                                                                                  ? '61515/W/0920'
                                                                                  : i == 10
                                                                                      ? '61515/M/0920'
                                                                                      : 'PENDING',
                                          description: i == 0
                                              ? 'Joint Venture Certification'
                                              : i == 1
                                                  ? 'Business Operating Permit'
                                                  : i == 2
                                                      ? 'Kenya Revenue Authority Certificate'
                                                      : i == 3
                                                          ? 'NCA Building Compliance'
                                                          : i == 4
                                                              ? 'NCA Mechanical Compliance'
                                                              : i == 5
                                                                  ? 'NCA Water Compliance'
                                                                  : i == 6
                                                                      ? 'Building Works Contractor Certificate'
                                                                      : i == 7
                                                                          ? 'Water Works Contractor Certificate'
                                                                          : i == 8
                                                                              ? 'Mechanical Service Contractor Certificate'
                                                                              : i == 9
                                                                                  ? 'Water Works Contractor Certificate (2028)'
                                                                                  : i == 10
                                                                                      ? 'Mechanical Service Contractor Certificate (2028)'
                                                                                      : 'Pending certificate',
                                          issuer: i == 0
                                              ? 'JV Authority'
                                              : i == 1
                                                  ? 'Local Government'
                                                  : i == 2
                                                      ? 'KRA'
                                                      : i == 3
                                                          ? 'NCA'
                                                          : i == 4
                                                              ? 'NCA'
                                                              : i == 5
                                                                  ? 'NCA'
                                                                  : i == 6
                                                                      ? 'NCA'
                                                                      : i == 7
                                                                          ? 'NCA'
                                                                          : i == 8
                                                                              ? 'NCA'
                                                                              : i == 9
                                                                                  ? 'NCA'
                                                                                  : i == 10
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
                                                          : i == 4
                                                              ? '2023-05-01'
                                                              : i == 5
                                                                  ? '2023-06-01'
                                                                  : i == 6
                                                                      ? '2025-08-09'
                                                                      : i == 7
                                                                          ? '2025-08-09'
                                                                          : i == 8
                                                                              ? '2025-08-09'
                                                                              : i == 9
                                                                                  ? '2025-08-09'
                                                                                  : i == 10
                                                                                      ? '2025-08-09'
                                                                                      : null,
                                          expiryDate: i == 0
                                              ? '2026-01-01'
                                              : i == 1
                                                  ? '2026-02-01'
                                                  : i == 2
                                                      ? '2026-03-01'
                                                  : i == 3
                                                      ? '2026-04-01'
                                                      : i == 4
                                                          ? '2026-05-01'
                                                          : i == 5
                                                              ? '2026-06-01'
                                                              : i == 6
                                                                  ? '2026-07-31'
                                                                  : i == 7
                                                                      ? '2026-07-31'
                                                                      : i == 8
                                                                          ? '2026-07-31'
                                                                          : i == 9
                                                                              ? '2028-07-31'
                                                                              : i == 10
                                                                                  ? '2028-07-31'
                                                                                  : null,
                                          filePath: i == 0
                                              ? 'assets/certificates/jv_certificate.jpg'
                                              : i == 1
                                                  ? 'assets/certificates/business_permit.jpg'
                                                  : i == 2
                                                      ? 'assets/certificates/kra_certificate.jpg'
                                                      : i == 3
                                                          ? 'assets/certificates/nca_building_certificate.jpg'
                                                          : i == 4
                                                              ? 'assets/certificates/nca_mechanical_certificate.jpg'
                                                              : i == 5
                                                                  ? 'assets/certificates/nca_water_certificate.jpg'
                                                                  : i == 6
                                                                      ? 'assets/certificates/Building_Works_Certificate 2026.jpg'
                                                                      : i == 7
                                                                          ? 'assets/certificates/Water_Works_Certificate%202026.jpg'
                                                                          : i == 8
                                                                              ? 'assets/certificates/Mechanical_Service_Certificate 2026.jpg'
                                                                          : i == 9
                                                                              ? 'assets/certificates/Water_Works_Certificate%202028.jpg'
                                                                              : i == 10
                                                                                  ? 'assets/certificates/Mechanical_Service_Certificate 2028.jpg'
                                                                                  : null,
                                          isImage: true,
                                          isMobile: isMobile,
                                          isTablet: isTablet,
                                          onImageTap: i <= 10
                                              ? () => showImageDialog(i == 0
                                                  ? 'assets/certificates/jv_certificate.jpg'
                                                  : i == 1
                                                      ? 'assets/certificates/business_permit.jpg'
                                                      : i == 2
                                                          ? 'assets/certificates/kra_certificate.jpg'
                                                          : i == 3
                                                              ? 'assets/certificates/nca_building_certificate.jpg'
                                                              : i == 4
                                                                  ? 'assets/certificates/nca_mechanical_certificate.jpg'
                                                                  : i == 5
                                                                      ? 'assets/certificates/nca_water_certificate.jpg'
                                                                      : i == 6
                                                                          ? 'assets/certificates/Building_Works_Certificate 2026.jpg'
                                                                          : i == 7
                                                                              ? 'assets/certificates/Water_Works_Certificate%202026.jpg'
                                                                              : i == 8
                                                                                  ? 'assets/certificates/Mechanical_Service_Certificate 2026.jpg'
                                                                                  : i == 9
                                                                                      ? 'assets/certificates/Water_Works_Certificate%202028.jpg'
                                                                                      : 'assets/certificates/Mechanical_Service_Certificate 2028.jpg')
                                              : null,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(LucideIcons.chevronRight, color: Colors.blue, size: isMobile ? 24 : 32),
                              onPressed: () {
                                _scrollController.animateTo(
                                  _scrollController.offset + 300,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                            ),
                          ],
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
  final String? filePath;
  final bool isImage;
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
    this.filePath,
    required this.isImage,
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
            if (filePath != null)
              GestureDetector(
                onTap: onImageTap,
                child: Container(
                  height: isMobile ? 25 : 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(filePath!),
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
            if (issuer != null)
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