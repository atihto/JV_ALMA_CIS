import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class CookiesPage extends StatelessWidget {
  const CookiesPage({super.key});

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
                        child: const Icon(LucideIcons.cookie, size: 48, color: Color(0xFF2563EB)),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'Cookies Policy',
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
            // Cookies Policy Content
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
                    // About this Cookies Policy
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
                                'About this Cookies Policy',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'This Cookies Policy explains how JV ALMA C.I.S, established in 2017, uses cookies and similar technologies on our website (jvalmacis.com) and mobile applications (KilimoMkononi, CoffeeCore, NyumbaSmart) to enhance your experience across our Construction, Oil and Gas Services, Agribusiness, and IT Division services.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // What Are Cookies?
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
                                'What Are Cookies?',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Cookies are small files of letters and numbers placed on your device with your consent. They help us distinguish you from other users, improving your experience on our website and apps. We may also use similar technologies, such as web beacons or pixel tags, to track user interactions.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Types of Cookies We Use
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.list, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Types of Cookies We Use',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'We use the following types of cookies to enhance functionality and analyze usage:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          ...[
                            'Essential Cookies: Required for basic site and app functionality, such as session management, user authentication for KilimoMkononi, CoffeeCore, and NyumbaSmart, and maintaining website navigation.',
                            'Analytics Cookies: Help us understand how visitors interact with our website and apps, tracking visitor numbers, navigation patterns, and app usage to improve performance and user experience.',
                            'Marketing Cookies: Used to deliver targeted advertisements and personalized updates, such as newsletters, project alerts, or software notifications, based on your interests.',
                            'Preference Cookies: Save your preferences, such as language settings, project types, or app configurations, to provide a tailored experience.',
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
                    // Third-Party Cookies
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
                                'Third-Party Cookies',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Our approved third parties (e.g., analytics providers, search engines, or project management platforms) may set cookies when you use our services to support analytics, advertising, or functionality. These third parties are required to use cookies in accordance with this Cookies Policy and applicable laws.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Managing Cookies
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(LucideIcons.settings, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Managing Cookies',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: isMobile ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'You can manage your cookie preferences through your browser or device settings. You may disable cookies, though this may affect the functionality of our website and apps (e.g., KilimoMkononi, CoffeeCore, NyumbaSmart). For example, disabling essential cookies may prevent login or navigation.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'To manage cookies, follow these steps:',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF4B5563),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ...[
                            'Access your browser settings (e.g., Chrome, Firefox, Safari) and locate the cookies or privacy section.',
                            'Choose to block all cookies, allow specific cookies, or clear existing cookies.',
                            'For mobile apps, adjust location and tracking permissions in your device settings.',
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
                            'If you have any questions about this Cookies Policy or our use of cookies, please contact us:',
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
                            'We may update this Cookies Policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the "Last updated" date.',
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