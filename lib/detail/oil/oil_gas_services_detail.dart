import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'dart:developer' as developer;

class OilAndGasServicesDetail extends StatelessWidget {
  const OilAndGasServicesDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth >= 600 && screenWidth <= 896;
        final isDesktop = screenWidth > 896;

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
                    vertical: isMobile ? 40 : 80,
                    horizontal: 16,
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
                            developer.log('OilAndGasServicesDetail: Navigating back to /business-units', name: 'OilAndGasServicesDetail');
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/business-units',
                              (route) => false,
                            );
                          },
                          tooltip: 'Back to Business Units',
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                            child: Column(
                              children: [
                                Text(
                                  'Oil & Gas Services',
                                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        color: Colors.white,
                                        fontSize: isMobile ? 24 : 32,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Comprehensive solution across the oil & gas services sector, powered by partnerships and decades of expertise.',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: isMobile ? 16 : 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: isMobile ? 32 : 48,
                          horizontal: screenWidth * 0.04,
                        ),
                        child: Center(
                          child: Container(
                            constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Us',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1F2937),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'JV ALMA C.I.S',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF0F172A),
                                          fontWeight: FontWeight.bold,
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' based on the experience in construction of oil and gas pipelines ventured as shareholders together with ',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF374151),
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'BRISMA AFRICA',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF0F172A),
                                          fontWeight: FontWeight.bold,
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF374151),
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'TIC GROUP',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF0F172A),
                                          fontWeight: FontWeight.bold,
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' to create ',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF374151),
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'TIC East Africa',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF0F172A),
                                          fontWeight: FontWeight.bold,
                                          height: 1.6,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '. TIC EA is a company specializing in inspection services, built on the extensive experience of the TIC Group a global organization with a presence in multiple countries and a workforce of over 500 employees, 70% of whom are specialized technicians.',
                                        style: TextStyle(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF374151),
                                          height: 1.6,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                    child: Semantics(
                                      label: 'TIC East Africa overview image',
                                      child: Image.asset(
                                        'assets/images/tic/tic_1.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Subsidiaries',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1F2937),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 16),
                                // Featured Subsidiary and Other Subsidiaries
                                isMobile
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Featured Subsidiary',
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  fontSize: isMobile ? 14 : 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFF374151),
                                                ),
                                          ),
                                          const SizedBox(height: 8),
                                          _buildFeaturedSubsidiary(context, isMobile, screenWidth),
                                          const SizedBox(height: 24),
                                          Text(
                                            'Other Subsidiaries',
                                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                  fontSize: isMobile ? 14 : 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(0xFF374151),
                                                ),
                                          ),
                                          const SizedBox(height: 8),
                                          Semantics(
                                            label: 'Other subsidiaries list',
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: _buildOtherSubsidiariesList(context, isMobile),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Featured Subsidiary',
                                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                        fontSize: isMobile ? 14 : 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: const Color(0xFF374151),
                                                      ),
                                                ),
                                                const SizedBox(height: 8),
                                                _buildFeaturedSubsidiary(context, isMobile, screenWidth),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Other Subsidiaries',
                                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                                        fontSize: isMobile ? 14 : 16,
                                                        fontWeight: FontWeight.bold,
                                                        color: const Color(0xFF374151),
                                                      ),
                                                ),
                                                const SizedBox(height: 8),
                                                Semantics(
                                                  label: 'Other subsidiaries list',
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: _buildOtherSubsidiariesList(context, isMobile),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                const SizedBox(height: 24),
                                // Map of All Subsidiaries
                                Text(
                                  'Our Global Presence',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF374151),
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 500),
                                    child: Semantics(
                                      label: 'Map of all TIC subsidiaries',
                                      child: Image.asset(
                                        'assets/images/tic/tic_2.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                // Rest of the content
                                Text(
                                  'Our Services',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1F2937),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'a. Inspection and integrity management',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF374151),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "• TIC EA guarantees the information and resources needed to ensure the safety of customers' activities and products. • TIC EA is a leader in facility integrity and risk management for the oil and gas industry.",
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        color: const Color(0xFF374151),
                                        height: 1.6,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                    child: Semantics(
                                      label: 'Inspection and integrity management',
                                      child: Image.asset(
                                        'assets/images/tic/tic_3.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'b. Non-Destructive Examination',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF374151),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• TIC EA specializes in non-destructive testing of materials and metal structures. Customers trust us for. Characterize the state of integrity of their equipment, without damaging it, either during production, use or maintenance.',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        color: const Color(0xFF374151),
                                        height: 1.6,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '• Our inspectors are certified, empowered and qualified to international standards. Thanks to a wide range of conventional and advanced control methods, we offer a high value-added service that helps to control risks and reduce lead times and costs.',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        color: const Color(0xFF374151),
                                        height: 1.6,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                    child: Semantics(
                                      label: 'Non-Destructive Examination',
                                      child: Image.asset(
                                        'assets/images/tic/tic_4.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'c. Regulatory Compliance Services',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF374151),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• Regulatory auditing and inspection at TIC EA is a service-focused process that goes beyond routine compliance checks. Its purpose is to identify and address a range of risks that can directly impact operational safety, integrity, and continuity.',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: isMobile ? 14 : 16,
                                        color: const Color(0xFF374151),
                                        height: 1.6,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                    child: Semantics(
                                      label: 'Regulatory Compliance Services',
                                      child: Image.asset(
                                        'assets/images/tic/tic_5.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Certifications',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1F2937),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                    child: Semantics(
                                      label: 'Certifications',
                                      child: Image.asset(
                                        'assets/images/tic/tic_6.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Clients',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        fontSize: isMobile ? 16 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF1F2937),
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                Center(
                                  child: Container(
                                    constraints: BoxConstraints(maxWidth: isMobile ? 500 : 700),
                                    child: Semantics(
                                      label: 'Clients',
                                      child: Image.asset(
                                        'assets/images/tic/tic_7.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Footer(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeaturedSubsidiary(BuildContext context, bool isMobile, double screenWidth) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 400),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Semantics(
                label: 'TIC East Africa',
                child: Image.asset(
                  'assets/images/subsidiaries/TIC-ea.jpg',
                  fit: BoxFit.contain,
                  height: isMobile ? 150 : 200,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(LucideIcons.mapPin, size: 16, color: Color(0xFF374151)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'TIC East Africa - Kenya/2022',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF374151),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Address: 5th-floor Brisma Towers, Off Magadi 74429-00200 Nairobi, Kenya',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF374151),
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Phone: +254 72 28 46 458',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF374151),
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Email: tic@tic-inspectiongroup.com',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: const Color(0xFF374151),
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildOtherSubsidiariesList(BuildContext context, bool isMobile) {
    final otherSubsidiaries = [
      {
        'title': 'Technique Inspection & Contrôle - Tunisia/1993',
        'phone': '+216 71 180 140',
        'email': 'tic@tic-inspectiongroup.com',
      },
      {
        'title': 'TIC Gabon - Gabon/2014',
        'phone': '+241 01 53 08 52',
        'email': 'contact@tic-ga.com',
      },
      {
        'title': 'TIC JSC - Libya/2003',
        'phone': '+218 21 44 40 504',
        'email': 'tic@tic-inspectiongroup.com',
      },
      {
        'title': 'ICT Algeria - Algeria/2023',
        'phone': '+213 (0) 23 469 808',
        'email': null,
      },
      {
        'title': 'TIC Gc - Tunisia/2010',
        'phone': '+216 71 180 029',
        'email': 'ticgc@tic-inspectiongroup.com',
      },
      {
        'title': 'CETIM International Engineering Services - 2008',
        'phone': null,
        'email': null,
      },
      {
        'title': 'Advanced inspection services - KSA/2010',
        'phone': '+966 (3) 340 1100 (Extn 112)',
        'email': 'info@ais-ksa.com',
      },
    ];

    return otherSubsidiaries.asMap().entries.expand((entry) {
      final subsidiary = entry.value;
      return [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(LucideIcons.mapPin, size: 14, color: Color(0xFF374151)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subsidiary['title'] as String,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF374151),
                          ),
                    ),
                    const SizedBox(height: 4),
                    if (subsidiary['phone'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 2.0),
                        child: Text(
                          '• Phone: ${subsidiary['phone']}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 12,
                                color: const Color(0xFF374151),
                                height: 1.5,
                              ),
                        ),
                      ),
                    if (subsidiary['email'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 2.0),
                        child: Text(
                          '• Email: ${subsidiary['email']}',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 12,
                                color: const Color(0xFF374151),
                                height: 1.5,
                              ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ];
    }).toList();
  }
}