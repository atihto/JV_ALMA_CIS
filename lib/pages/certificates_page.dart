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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                        childAspectRatio: isMobile ? 0.8 : isTablet ? 1.0 : 1.2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: certificates.length,
                      itemBuilder: (context, index) {
                        final cert = certificates[index];
                        return _CertificateCard(
                          title: cert['title'],
                          certificateNo: cert['certificateNo'],
                          description: cert['description'],
                          issuer: cert['issuer'],
                          issueDate: cert['issueDate'],
                          expiryDate: cert['expiryDate'],
                          filePath: cert['filePath'],
                          isMobile: isMobile,
                          isTablet: isTablet,
                          onTap: () => showImageDialog(context, index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  children: [
                    Text(
                      'Compliance Commitments',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Our commitment to standards',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _CommitmentCard(
                            icon: LucideIcons.award,
                            title: 'Quality Assured',
                            description: 'ISO 9001:2015 Certified.',
                            iconColor: const Color(0xFF2563EB),
                            fontSize: isMobile ? 12 : 14,
                            isMobile: isMobile,
                          ),
                        ),
                        Expanded(
                          child: _CommitmentCard(
                            icon: LucideIcons.checkCircle,
                            title: 'Fully Compliant',
                            description: 'Requirements met.',
                            iconColor: const Color(0xFF2563EB),
                            fontSize: isMobile ? 12 : 14,
                            isMobile: isMobile,
                          ),
                        ),
                        Expanded(
                          child: _CommitmentCard(
                            icon: LucideIcons.globe,
                            title: 'Internationally Recognized',
                            description: 'Global operations.',
                            iconColor: const Color(0xFF2563EB),
                            fontSize: isMobile ? 12 : 14,
                            isMobile: isMobile,
                          ),
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

  void showImageDialog(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => CertificateImageDialog(
        certificates: certificates,
        initialIndex: initialIndex,
      ),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final String title;
  final String certificateNo;
  final String description;
  final String? issuer;
  final String? issueDate;
  final String? expiryDate;
  final String? filePath;
  final bool isMobile;
  final bool isTablet;
  final VoidCallback onTap;

  const _CertificateCard({
    required this.title,
    required this.certificateNo,
    required this.description,
    this.issuer,
    this.issueDate,
    this.expiryDate,
    this.filePath,
    required this.isMobile,
    required this.isTablet,
    required this.onTap,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: InkWell(
            onTap: widget.onTap,
            hoverColor: const Color(0xFFDBEAFE),
            splashColor: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: isHovered ? Matrix4.identity().scaled(1.02) : Matrix4.identity(),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(isHovered ? 0.3 : 0.1),
                    blurRadius: isHovered ? 12 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey[200],
                      ),
                      child: widget.filePath != null
                          ? Image.asset(
                              widget.filePath!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Center(
                                child: Icon(LucideIcons.alertTriangle, color: Colors.red),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Pending',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                          fontSize: widget.isMobile ? 14 : 16,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'No: ${widget.certificateNo}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF4B5563),
                          fontSize: widget.isMobile ? 12 : 14,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF4B5563),
                          fontSize: widget.isMobile ? 12 : 14,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.issuer != null)
                    Text(
                      'Issuer: ${widget.issuer}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: widget.isMobile ? 10 : 12,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (widget.issueDate != null)
                    Text(
                      'Issue: ${widget.issueDate}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: widget.isMobile ? 10 : 12,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  if (widget.expiryDate != null)
                    Text(
                      'Expiry: ${widget.expiryDate}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: widget.isMobile ? 10 : 12,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CertificateImageDialog extends StatefulWidget {
  final List<Map<String, dynamic>> certificates;
  final int initialIndex;

  const CertificateImageDialog({
    super.key,
    required this.certificates,
    required this.initialIndex,
  });

  @override
  State<CertificateImageDialog> createState() => _CertificateImageDialogState();
}

class _CertificateImageDialogState extends State<CertificateImageDialog> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _previousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _nextImage() {
    if (currentIndex < widget.certificates.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final cert = widget.certificates[currentIndex];

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? screenWidth * 0.9 : screenWidth * 0.8,
          maxHeight: isMobile ? screenHeight * 0.8 : screenHeight * 0.7,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      cert['filePath'] ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Text('Failed to load image', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cert['title'],
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF1F2937),
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'No: ${cert['certificateNo']}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: isMobile ? 12 : 14,
                                color: const Color(0xFF4B5563),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          cert['description'],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: isMobile ? 12 : 14,
                                color: const Color(0xFF4B5563),
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (cert['issuer'] != null)
                          Text(
                            'Issuer: ${cert['issuer']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: isMobile ? 10 : 12,
                                  color: const Color(0xFF4B5563),
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (cert['issueDate'] != null)
                          Text(
                            'Issue: ${cert['issueDate']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: isMobile ? 10 : 12,
                                  color: const Color(0xFF4B5563),
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (cert['expiryDate'] != null)
                          Text(
                            'Expiry: ${cert['expiryDate']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: isMobile ? 10 : 12,
                                  color: const Color(0xFF4B5563),
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(LucideIcons.x, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              left: 8,
              top: screenHeight * 0.3,
              child: IconButton(
                icon: Icon(
                  LucideIcons.chevronLeft,
                  color: currentIndex > 0 ? Colors.black : Colors.grey,
                  size: isMobile ? 24 : 32,
                ),
                onPressed: currentIndex > 0 ? _previousImage : null,
              ),
            ),
            Positioned(
              right: 8,
              top: screenHeight * 0.3,
              child: IconButton(
                icon: Icon(
                  LucideIcons.chevronRight,
                  color: currentIndex < widget.certificates.length - 1 ? Colors.black : Colors.grey,
                  size: isMobile ? 24 : 32,
                ),
                onPressed: currentIndex < widget.certificates.length - 1 ? _nextImage : null,
              ),
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
  /*{
    'title': 'Building Works Certificate',
    'certificateNo': 'Building Works Contractor',
    'description': 'Construction',
    'filePath': 'assets/certificates/Building_Works_Certificate_2028.jpg',
  },*/
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