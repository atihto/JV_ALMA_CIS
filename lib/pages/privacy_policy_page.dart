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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onMenuPressed: () {
              },
            ),
            // Hero Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFEFF6FF), Colors.white],
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
                              color: const Color(0xFF111827),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Last updated: ${DateTime.now().toLocal().toString().split(' ')[0]}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 14 : 16,
                              color: const Color(0xFF4B5563),
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
                    // Introduction
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
                                'Introduction',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'At JV ALMA CIS, we are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or engage with our services.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Information We Collect
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
                                'Information We Collect',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'JV ALMA CIS collects information you provide directly to us, such as when you:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Fill out contact forms on our website',
                            'Subscribe to our newsletters or updates',
                            'Apply for employment opportunities',
                            'Request information about our services',
                            'Communicate with us via email or phone',
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
                            'This may include your name, email address, phone number, company information, and any messages you send to us.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // How We Use Your Information
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
                                'How We Use Your Information',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We use the information we collect to:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Respond to your inquiries and provide customer support',
                            'Send you information about our services and projects',
                            'Process employment applications',
                            'Improve our website and services',
                            'Comply with legal obligations',
                            'Protect our rights and prevent fraud',
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
                    // Information Sharing
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
                                'Information Sharing',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We do not sell, trade, or otherwise transfer your personal information to third parties without your consent, except:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'To trusted service providers who assist us in operating our website and conducting business',
                            'When required by law or to protect our rights',
                            'In connection with a merger, acquisition, or sale of assets',
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
                            'We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Your Rights
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
                                'Your Rights',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'You have the right to:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Access the personal information we hold about you',
                            'Request correction of inaccurate information',
                            'Request deletion of your personal information',
                            'Object to processing of your personal information',
                            'Request data portability',
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
                    // Cookies
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Our website may use cookies to enhance your experience. You can choose to disable cookies through your browser settings, though this may affect website functionality. For more information, see our ',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: isMobile ? 12 : 14,
                                    color: const Color(0xFF4B5563),
                                  ),
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
                    // Contact Us
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
                                'Contact Us',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'If you have any questions about this Privacy Policy or our data practices, please contact us:',
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
                                'Email: privacy@jvalmacis.com',
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
                                'Phone: +254-XXX-XXXXXX',
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
                    const SizedBox(height: 32),
                    // Changes to This Policy
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.refreshCw, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Changes to This Policy',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
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