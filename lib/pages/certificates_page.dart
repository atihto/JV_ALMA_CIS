import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class CertificatesPage extends StatefulWidget {
  const CertificatesPage({super.key});

  @override
  State<CertificatesPage> createState() => _CertificatesPageState();
}

class _CertificatesPageState extends State<CertificatesPage> {
  void showImageDialog(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => _ImageDialog(
        certificates: certificates,
        initialIndex: initialIndex,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

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
                  colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 64,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0x33FFFFFF),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          LucideIcons.award,
                          size: isMobile ? 40 : 56,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Certificates & Compliance',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontSize: isMobile ? 28 : 40,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Committed to the highest standards of quality, safety, and compliance in everything we do',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFFDDD6FE),
                              fontSize: isMobile ? 14 : 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Our Commitment Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 56,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  children: [
                    Text(
                      'Our Commitment to Excellence',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 24 : 32,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildCommitmentCard(
                          context,
                          isMobile,
                          LucideIcons.shieldCheck,
                          'ISO 9001:2015',
                          'Quality Management System certified for consistent, high-quality service delivery',
                          const Color(0xFF2563EB),
                        ),
                        _buildCommitmentCard(
                          context,
                          isMobile,
                          LucideIcons.checkCircle2,
                          'Fully Compliant',
                          'All regulatory requirements met and maintained across all operations',
                          const Color(0xFF059669),
                        ),
                        _buildCommitmentCard(
                          context,
                          isMobile,
                          LucideIcons.globe2,
                          'Internationally Recognized',
                          'Certifications accepted globally for cross-border operations',
                          const Color(0xFF7C3AED),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Certificates Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 56,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  children: [
                    Text(
                      'Our Certifications',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 24 : 32,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Click on any certificate to view details',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 13 : 15,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: List.generate(certificates.length, (index) {
                        final cert = certificates[index];
                        return SizedBox(
                          width: isMobile
                              ? double.infinity
                              : isTablet
                                  ? (screenWidth - 64) / 2
                                  : (screenWidth - 96) / 3,
                          child: _buildCertificateCard(
                            context,
                            isMobile,
                            cert,
                            () => showImageDialog(context, index),
                          ),
                        );
                      }),
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

  Widget _buildCommitmentCard(
    BuildContext context,
    bool isMobile,
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, size: 32, color: color),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                  fontSize: isMobile ? 16 : 18,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF6B7280),
                  fontSize: isMobile ? 13 : 14,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(
    BuildContext context,
    bool isMobile,
    Map<String, dynamic> cert,
    VoidCallback onTap,
  ) {
    // Determine certificate type and color
    final String title = cert['title'] ?? '';
    Color cardColor;
    IconData cardIcon;

    if (title.contains('Building') || title.contains('Construction')) {
      cardColor = const Color(0xFF2563EB);
      cardIcon = LucideIcons.building2;
    } else if (title.contains('Mechanical')) {
      cardColor = const Color(0xFFDC2626);
      cardIcon = LucideIcons.cog;
    } else if (title.contains('Water')) {
      cardColor = const Color(0xFF0891B2);
      cardIcon = LucideIcons.droplet;
    } else if (title.contains('KRA') || title.contains('Tax')) {
      cardColor = const Color(0xFF059669);
      cardIcon = LucideIcons.fileText;
    } else {
      cardColor = const Color(0xFF7C3AED);
      cardIcon = LucideIcons.award;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cardColor.withValues(alpha: 0.2), width: 2),
          boxShadow: [
            BoxShadow(
              color: cardColor.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Certificate Image Preview
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    cert['filePath'],
                    width: double.infinity,
                    height: isMobile ? 180 : 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: isMobile ? 180 : 200,
                      color: cardColor.withValues(alpha: 0.1),
                      child: Center(
                        child: Icon(
                          LucideIcons.fileText,
                          size: 48,
                          color: cardColor.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(cardIcon, color: Colors.white, size: 20),
                    ),
                  ),
                ],
              ),
            ),

            // Certificate Details
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          cert['title'],
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF111827),
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (cert['certificateNo'] != null)
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.hash,
                          size: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            cert['certificateNo'],
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: isMobile ? 12 : 13,
                                  color: const Color(0xFF6B7280),
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 6),
                  if (cert['description'] != null)
                    Text(
                      cert['description'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 13 : 14,
                            color: const Color(0xFF4B5563),
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.eye,
                              size: 16,
                              color: cardColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'View Certificate',
                              style: TextStyle(
                                fontSize: isMobile ? 13 : 14,
                                color: cardColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        LucideIcons.arrowRight,
                        size: 20,
                        color: cardColor,
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
}

class _ImageDialog extends StatefulWidget {
  final List<Map<String, dynamic>> certificates;
  final int initialIndex;

  const _ImageDialog({
    required this.certificates,
    required this.initialIndex,
  });

  @override
  State<_ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<_ImageDialog> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _nextImage() {
    if (currentIndex < widget.certificates.length - 1) {
      setState(() => currentIndex++);
    }
  }

  void _previousImage() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final cert = widget.certificates[currentIndex];

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 24 : 40,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 900,
          maxHeight: screenHeight * 0.9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0x193B82F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              LucideIcons.award,
                              color: Color(0xFF3B82F6),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cert['title'],
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (cert['certificateNo'] != null)
                                  Text(
                                    cert['certificateNo'],
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          fontSize: isMobile ? 12 : 13,
                                          color: const Color(0xFF6B7280),
                                        ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (cert['description'] != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          cert['description'],
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 13 : 14,
                                color: const Color(0xFF4B5563),
                              ),
                        ),
                      ],
                      if (widget.certificates.length > 1) ...[
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${currentIndex + 1} of ${widget.certificates.length}',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF9CA3AF),
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Image
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      cert['filePath'],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 300,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(LucideIcons.imageOff, color: Colors.grey, size: 64),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Close Button
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(LucideIcons.x, color: Colors.black, size: 20),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            // Navigation Arrows
            if (widget.certificates.length > 1) ...[
              if (currentIndex > 0)
                Positioned(
                  left: 8,
                  top: screenHeight * 0.4,
                  child: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        LucideIcons.chevronLeft,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    onPressed: _previousImage,
                  ),
                ),
              if (currentIndex < widget.certificates.length - 1)
                Positioned(
                  right: 8,
                  top: screenHeight * 0.4,
                  child: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        LucideIcons.chevronRight,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                    onPressed: _nextImage,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> certificates = [
  {
    'title': 'JV Certificate',
    'certificateNo': 'JV ALMA C.I.S',
    'description': 'Incorporation',
    'filePath': 'assets/certificates/jv_certificate.jpg',
  },
  {
    'title': 'KRA Certificate',
    'certificateNo': 'KRA',
    'description': 'Tax Compliance',
    'filePath': 'assets/certificates/kra_certificate.jpg',
  },
  {
    'title': 'Business Permit',
    'certificateNo': 'Business Permit',
    'description': 'Valid',
    'filePath': 'assets/certificates/business_permit.jpg',
  },
  {
    'title': 'Building Works Certificate',
    'certificateNo': 'Building Works Contractor',
    'description': 'Construction',
    'filePath': 'assets/certificates/Building_Works_Certificate_2026.jpg',
  },
  {
    'title': 'Mechanical Service Certificate',
    'certificateNo': 'Mechanical Service Contractor',
    'description': 'Mechanical',
    'filePath': 'assets/certificates/Mechanical_Service_Certificate_2026.jpg',
  },
  {
    'title': 'Water Works Certificate',
    'certificateNo': 'Water Works Contractor',
    'description': 'Water Management',
    'filePath': 'assets/certificates/Water_Works_Certificate_2026.jpg',
  },
  {
    'title': 'Mechanical Service Certificate',
    'certificateNo': 'Mechanical Service Contractor',
    'description': 'Mechanical',
    'filePath': 'assets/certificates/Mechanical_Service_Certificate_2028.jpg',
  },
  {
    'title': 'Water Works Certificate',
    'certificateNo': 'Water Works Contractor',
    'description': 'Water Management',
    'filePath': 'assets/certificates/Water_Works_Certificate_2028.jpg',
  },
];