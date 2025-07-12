import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
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
                vertical: screenHeight * 0.08,
                horizontal: screenWidth * 0.04,
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 896),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBFDBFE),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: const Icon(LucideIcons.shield, size: 48, color: Color(0xFF2563EB)),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Privacy Policy',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: isMobile ? 24 : 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Last updated: July 10, 2025',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 14 : 16,
                              color: const Color(0xFFBFDBFE),
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Privacy Policy Content
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 896),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // About this Notice
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.info, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'About this Notice',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'This Privacy and Cookie Notice explains how JV ALMA C.I.S collects and processes your personal data when you interact with our website, mobile applications (KilimoMkononi, CoffeeCore, NyumbaSmart), or engage with our services in Construction, Oil and Gas Services, Agribusiness, or IT Division.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // The Data We Collect About You
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.eye, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'The Data We Collect About You',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We collect personal data to deliver and enhance our services across our business units. The types of personal data we collect include:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Information you provide to us:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ...[
                            'KilimoMkononi: Full name, email, county, constituency, ward, phone number, and password for user registration and login.',
                            'CoffeeCore: Full name, email, county, constituency, ward, phone number, password, and cooperative information for user registration and login.',
                            'NyumbaSmart: Username, email, password, and facility information (e.g., facility name and location) for client registration and login.',
                            'Website: Email for newsletter subscriptions; full name, email, phone number, and other relevant details for careers applications and contact us form submissions.',
                            'Additional data such as identity data, contact data, billing information, or project-specific details provided during service requests.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 16),
                          Text(
                            'Information on your use of our website and/or mobile applications:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ...[
                            'We automatically collect information about your interactions, including searches, views, downloads, project submissions, and usage of our apps (KilimoMkononi, CoffeeCore, NyumbaSmart).',
                            'Mobile: When using our apps, we may collect location data and device information (e.g., unique device identifiers) to provide location-based services, such as agricultural insights, facility management updates, or project tracking. You can disable location services in your device settings.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 16),
                          Text(
                            'Information from third parties and publicly available sources:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ...[
                            'We may receive data from partners (e.g., KALRO, Moi University), service providers, or public sources related to our construction, agribusiness, or oil and gas services.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // What About Cookies?
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.cookie, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'What About Cookies?',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Cookies are small files of letters and numbers placed on your device with your consent. They help us distinguish you from other users, improving your experience on our website and apps. For more information, see our ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/cookies'),
                            child: Text(
                              'Cookies Policy',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: isMobile ? 12 : 14,
                                    color: const Color(0xFF2563EB),
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                          Text(
                            '.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // How We Use Your Personal Data
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.lock, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'How We Use Your Personal Data',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We use your personal data to operate, provide, develop, and improve our offerings, including:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Registering and managing user accounts for KilimoMkononi, CoffeeCore, and NyumbaSmart.',
                            'Processing and fulfilling project requests, service orders, or software subscriptions.',
                            'Managing client and partner relationships, including customer support, project updates, and career application processing.',
                            'Enabling participation in agribusiness training, community infrastructure projects, or software trials.',
                            'Managing newsletter subscriptions and delivering tailored communications.',
                            'Improving our website, apps, and services across Construction, Oil and Gas Services, Agribusiness, and IT Division.',
                            'Recommending relevant services or products, such as facility management tools or agricultural solutions.',
                            'Complying with legal obligations, including identity verification for contracts or partnerships.',
                            'Detecting fraud or misuse of our services.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // How We Share Your Personal Data
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.users, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'How We Share Your Personal Data',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We may share your personal data with third parties for the following purposes:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Service delivery: To provide services in Construction (e.g., facility remodeling, NyumbaSmart CMMS), Oil and Gas Services, Agribusiness (e.g., training with KALRO or Moi University), or IT Division (e.g., app support), we may share data with partners or subcontractors.',
                            'Third-party service providers: We engage third parties for functions like project logistics, data analysis, marketing, or customer support.',
                            'Fraud prevention and compliance: We may share data with organizations to prevent fraud, manage risks, or comply with legal requirements.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(height: 16),
                          Text(
                            'When sharing data, we require third parties to use your data in accordance with this Privacy and Cookie Notice and applicable laws, and permit them to process your data only for specified purposes and per our instructions.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // International Transfers
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.globe, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'International Transfers',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We may transfer your personal data to locations in another country if permissible under applicable laws. We implement safeguards to protect your data and respect your legal rights in accordance with this notice and local regulations.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Data Security
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.shieldCheck, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Data Security',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We maintain appropriate security measures to prevent your personal data from being accidentally lost, used, accessed, altered, or disclosed without authorization. Access to your data is restricted to employees, agents, contractors, and third parties with a business need, who process it only on our instructions and are bound by confidentiality.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We have procedures to address suspected data breaches and will notify you and any applicable regulator as required by law.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Your Legal Rights
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.userCheck, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Your Legal Rights',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We aim to keep your personal data accurate and current. Please inform us of any changes to your data during your relationship with us. Under data protection laws, you may have rights to:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Access, correct, erase, or restrict the processing of your personal data.',
                            'Unsubscribe from our communications.',
                          ].map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('• ', style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontSize: isMobile ? 12 : 14,
                                              color: const Color(0xFF4B5563),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Further Details
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.mail, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Further Details',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'For more information on how we process your personal data or to exercise your legal rights, please contact us:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(LucideIcons.mail, size: 16, color: Color(0xFF6B7280)),
                              const SizedBox(width: 8),
                              Text(
                                'Email: info@jvalmacis.com',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
                                      color: const Color(0xFF4B5563),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(LucideIcons.phone, size: 16, color: Color(0xFF6B7280)),
                              const SizedBox(width: 8),
                              Text(
                                'Phone: +254 712 174 516',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
                                      color: const Color(0xFF4B5563),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(LucideIcons.mapPin, size: 16, color: Color(0xFF6B7280)),
                              const SizedBox(width: 8),
                              Text(
                                'Address: Kin’gara Heights PQ66+2FM Junction, James Gichuru Rd, P.O. Box 12345-00100, Nairobi, Kenya',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
                                      color: const Color(0xFF4B5563),
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
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