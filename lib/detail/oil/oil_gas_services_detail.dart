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
                                    child: Image.asset(
                                      'assets/images/tic/tic_1.jpg',
                                      fit: BoxFit.contain,
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
                                // Subsidiaries Section
                                isMobile
                                    ? Column(
                                        children: _buildSubsidiaryCards(context, screenWidth),
                                      )
                                    : isTablet
                                        ? Column(
                                            children: [
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .take(2)
                                                    .toList(),
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .skip(2)
                                                    .take(2)
                                                    .toList(),
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .skip(4)
                                                    .take(2)
                                                    .toList(),
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .skip(6)
                                                    .take(2)
                                                    .toList(),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .take(3)
                                                    .toList(),
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .skip(3)
                                                    .take(3)
                                                    .toList(),
                                              ),
                                              const SizedBox(height: 16),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 16,
                                                alignment: WrapAlignment.center,
                                                children: _buildSubsidiaryCards(context, screenWidth)
                                                    .skip(6)
                                                    .take(2)
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Card(
                                        child: Container(
                                          constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/tic/tic_2.jpg',
                                                fit: BoxFit.contain,
                                                width: double.infinity,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                                Text(
                                  'Services',
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
                                    child: Image.asset(
                                      'assets/images/tic/tic_3.jpg',
                                      fit: BoxFit.contain,
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
                                    child: Image.asset(
                                      'assets/images/tic/tic_4.jpg',
                                      fit: BoxFit.contain,
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
                                    child: Image.asset(
                                      'assets/images/tic/tic_5.jpg',
                                      fit: BoxFit.contain,
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
                                    child: Image.asset(
                                      'assets/images/tic/tic_6.jpg',
                                      fit: BoxFit.contain,
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
                                    child: Image.asset(
                                      'assets/images/tic/tic_7.jpg',
                                      fit: BoxFit.contain,
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

  List<Widget> _buildSubsidiaryCards(BuildContext context, double screenWidth) {
    final subsidiaries = [
      {
        'image': 'assets/images/subsidiaries/TIC-hq.jpg',
        'title': 'TIC, Technique inspection & Contrôle-Tunisia/1993',
        'details': [
          'Address: Zone industrielle Kheireddine, lot 1-1-18, le Kram',
          'Phone: +216 71 180 140, +216 25 987 000',
          'Fax: +216 71 180 141',
          'E-mail: tic@tic-inspectiongroup.com',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/TIC-gabon.jpg',
        'title': 'TIC Gabon - Gabon/2014',
        'details': [
          'Address: Quartier SOGEC – BP 1034 – PORT GENTIL GABON',
          'Tel: +241 01 53 08 52, +241 01 53 08 53',
          'Fax: +241 01 53 08 51',
          'E-mail: contact@tic-ga.com',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/TIC-ea.jpg',
        'title': 'TIC East Africa - Kenya/2022',
        'details': [
          'Address: 5th-floor Brisma Towers, Off Magadi 74429-00200 Nairobi, Kenya',
          'Tel: +254 72 28 46 458',
          'Fax: +254 72 28 46 458',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/TIC-libya.jpg',
        'title': 'TIC JSC - Libya/2003',
        'details': [
          'Address: Rue Hassouna Pacha, Branche de l’avenue 24 décembre – BP 2755 – Tripoli – Libya',
          'Tel: +218 21 44 40 504',
          'Fax: +218 213 34 10 94',
          'E-mail: tic@tic-inspectiongroup.com',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/TIC-algeria.jpg',
        'title': 'ICT Algeria - Algeria/2023',
        'details': [
          'Address: 25, Haouche SIDALI BtD, Bloc D SIDI YAHIA, HYDRA, ALGER',
          'Tel: +213 (0) 23 469 808',
          'Fax: +213 (0) 23 469 808',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/TIC-tunisia.jpg',
        'title': 'TIC Gc - Tunisia/2010',
        'details': [
          'Tel: +216 71 180 029',
          'Fax: +216 71 180 028',
          'E-mail: ticgc@tic-inspectiongroup.com',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/cetim.jpg',
        'title': 'CETIM International Engineering Services - 2008',
        'details': [
          'Partnership for CETIM France',
        ],
      },
      {
        'image': 'assets/images/subsidiaries/ais.jpg',
        'title': 'Advanced inspection services - KSA/2010',
        'details': [
          'Address: P.O. Box 36400 – Jubail Industrial City 31961 – K.S.A.',
          'Tel: +966 (3) 340 1100 (Extn 112)',
          'Fax: +966 (3) 340 7182',
          'E-mail: info@ais-ksa.com',
        ],
      },
    ];

    return subsidiaries.asMap().entries.map((entry) {
      final subsidiary = entry.value;
      return Card(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 280), // Uniform width for all cards
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                subsidiary['image'] as String,
                fit: BoxFit.contain,
                height: 180, // Uniform height for images
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subsidiary['title'] as String,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF374151),
                          ),
                    ),
                    const SizedBox(height: 8),
                    ...((subsidiary['details'] as List?)?.map<Widget>((detail) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          detail as String,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 14,
                                color: const Color(0xFF374151),
                                height: 1.5,
                              ),
                        ),
                      );
                    }).toList() ?? []),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}