import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firestore
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_widgets.dart';
import '../config.dart';
import 'dart:developer' as developer;

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        // Save form data to Firestore
        await FirebaseFirestore.instance.collection('contacts').add({
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'subject': _subjectController.text,
          'message': _messageController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Message sent successfully! We will get back to you soon.'),
              backgroundColor: Color(0xFF059669),
            ),
          );

          // Clear form
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _subjectController.clear();
          _messageController.clear();
        }
      } catch (e) {
        developer.log('ContactPage: Form submission error: $e', name: 'ContactPage');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting form: $e')),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  Future<void> _launchURL(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        developer.log('ContactPage: Launched URL: $url', name: 'ContactPage');
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      }
    } catch (e) {
      developer.log('ContactPage: URL launch error: $e', name: 'ContactPage');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _launchPhone() async {
    try {
      final uri = Uri.parse('tel:${Config.companyPhone.replaceAll(' ', '')}');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        developer.log('ContactPage: Launched phone: ${Config.companyPhone}', name: 'ContactPage');
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch phone: ${Config.companyPhone}')),
          );
        }
      }
    } catch (e) {
      developer.log('ContactPage: Phone launch error: $e', name: 'ContactPage');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _launchEmail() async {
    try {
      final uri = Uri.parse('mailto:${Config.companyEmail}');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        developer.log('ContactPage: Launched email: ${Config.companyEmail}', name: 'ContactPage');
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not launch email: ${Config.companyEmail}')),
          );
        }
      }
    } catch (e) {
      developer.log('ContactPage: Email launch error: $e', name: 'ContactPage');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return AppScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section (unchanged)
            ClipRRect(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? screenHeight * 0.06 : screenHeight * 0.08,
                  horizontal: screenWidth * 0.04,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Contact Us',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: isMobile ? 24 : 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
            // Form and Contact Info Section (unchanged)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: isMobile
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildForm(context, screenWidth, screenHeight, isMobile, isTablet),
                          SizedBox(height: screenHeight * 0.03),
                          _buildContactInfo(context, isMobile),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildForm(context, screenWidth, screenHeight, isMobile, isTablet)),
                          SizedBox(width: screenWidth * 0.03),
                          Expanded(child: _buildContactInfo(context, isMobile)),
                        ],
                      ),
              ),
            ),
            // Locations Section (unchanged)
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Our Locations',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomCard(
                          hoverEffect: false,
                          content: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Nairobi',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF111827),
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'King\'ara Heights\nNairobi, Kenya',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 14,
                                        color: const Color(0xFF4B5563),
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                CustomButton(
                                  text: 'Map',
                                  onPressed: () => _openMap('King\'ara Heights, Nairobi, Kenya'),
                                  isLarge: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomCard(
                          hoverEffect: false,
                          content: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Mombasa',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF111827),
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'Manipur Plaza\nMombasa, Kenya',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 14,
                                        color: const Color(0xFF4B5563),
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                CustomButton(
                                  text: 'Map',
                                  onPressed: () => _openMap('Manipur Plaza, Mombasa, Kenya'),
                                  isLarge: false,
                                ),
                              ],
                            ),
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

  // _buildContactInfo, _buildContactInfoCard, _buildSocialButton unchanged
  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Connect with us to explore how our construction, agribusiness, oil & gas services, and IT solutions can support your goals. We’ll get back to you promptly.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: const Color(0xFF374151),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _buildContactInfoCard(
          icon: LucideIcons.mapPin,
          title: 'Address',
          content: "King'ara Heights, Nairobi, Kenya",
          onTap: null,
        ),
        const SizedBox(height: 16),
        _buildContactInfoCard(
          icon: LucideIcons.phone,
          title: 'Phone',
          content: Config.companyPhone,
          onTap: _launchPhone,
        ),
        const SizedBox(height: 16),
        _buildContactInfoCard(
          icon: LucideIcons.mail,
          title: 'Email',
          content: Config.companyEmail,
          onTap: _launchEmail,
        ),
        const SizedBox(height: 32),
        Text(
          'Follow Us',
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialButton(
              icon: LucideIcons.twitter,
              onTap: () => _launchURL(Config.twitterUrl),
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              icon: LucideIcons.linkedin,
              onTap: () => _launchURL(Config.linkedinUrl),
            ),
            const SizedBox(width: 16),
            _buildSocialButton(
              icon: LucideIcons.instagram,
              onTap: () => _launchURL(Config.instagramUrl),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              const Icon(
                LucideIcons.externalLink,
                size: 16,
                color: Color(0xFF64748B),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context, double screenWidth, double screenHeight, bool isMobile, bool isTablet) {
    return Card(
      elevation: 4,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03, horizontal: screenWidth * 0.03),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send us a message',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: isMobile ? 18 : 20,
                      color: const Color(0xFF111827),
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: screenHeight * 0.03),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Subject',
                  hintText: 'Enter the subject',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              TextFormField(
                controller: _messageController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Message',
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: _isSubmitting ? 'Sending...' : 'Send Message',
                  onPressed: _isSubmitting ? () {} : () => _submitForm(),
                  isLarge: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";
    _launchURL(googleUrl);
  }
}