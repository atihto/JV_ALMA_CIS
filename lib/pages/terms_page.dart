import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

// ── Data classes ──────────────────────────────────────────────────────────────

class _Sub {
  final String heading;
  final List<String> bullets;
  const _Sub(this.heading, this.bullets);
}

class _Contact {
  final IconData icon;
  final String text;
  const _Contact(this.icon, this.text);
}

// ── Shared widget builders ────────────────────────────────────────────────────

Widget _hero(BuildContext ctx, double sw, double sh, bool mob,
    {required IconData icon,
    required String title,
    required String subtitle}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
      ),
    ),
    padding:
        EdgeInsets.symmetric(vertical: sh * 0.08, horizontal: sw * 0.04),
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 896),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFBFDBFE),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF2563EB)),
          ),
          SizedBox(height: sh * 0.02),
          Text(title,
              style: TextStyle(
                  fontSize: mob ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center),
          SizedBox(height: sh * 0.01),
          Text(subtitle,
              style: TextStyle(
                  fontSize: mob ? 14 : 16,
                  color: const Color(0xFFBFDBFE)),
              textAlign: TextAlign.center),
        ]),
      ),
    ),
  );
}

Widget _sec(BuildContext ctx, bool mob,
    {required IconData icon,
    required String title,
    String? body,
    List<String>? bullets,
    List<_Sub>? subs,
    List<_Contact>? contacts,
    String? footer}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 32),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title,
              style: TextStyle(
                  fontSize: mob ? 16 : 18, fontWeight: FontWeight.bold)),
        ),
      ]),
      const SizedBox(height: 16),
      if (body != null) ...[
        Text(body,
            style: TextStyle(
                fontSize: mob ? 12 : 14,
                color: const Color(0xFF4B5563),
                height: 1.6)),
        const SizedBox(height: 12),
      ],
      if (subs != null)
        ...subs.map((s) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.heading,
                style: TextStyle(
                    fontSize: mob ? 12 : 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4B5563))),
            const SizedBox(height: 6),
            ...s.bullets.map((b) => _bul(b, mob)),
          ]),
        )),
      if (bullets != null) ...bullets.map((b) => _bul(b, mob)),
      if (contacts != null)
        ...contacts.map((c) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(c.icon, size: 16, color: const Color(0xFF6B7280)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(c.text,
                  style: TextStyle(
                      fontSize: mob ? 12 : 14,
                      color: const Color(0xFF4B5563))),
            ),
          ]),
        )),
      if (footer != null)
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(footer,
              style: TextStyle(
                  fontSize: mob ? 12 : 14,
                  color: const Color(0xFF4B5563),
                  height: 1.6)),
        ),
    ]),
  );
}

Widget _bul(String text, bool mob) => Padding(
  padding: const EdgeInsets.only(bottom: 8),
  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('• ',
        style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
    Expanded(
      child: Text(text,
          style: TextStyle(
              fontSize: mob ? 12 : 14,
              color: const Color(0xFF4B5563),
              height: 1.5)),
    ),
  ]),
);

Widget _callout(bool mob, String text) => Container(
  margin: const EdgeInsets.only(bottom: 32),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: const Color(0xFFEFF6FF),
    borderRadius: BorderRadius.circular(8),
    border:
        const Border(left: BorderSide(color: Color(0xFF2563EB), width: 4)),
  ),
  child: Text(text,
      style: TextStyle(
          fontSize: mob ? 12 : 14,
          color: const Color(0xFF1E40AF),
          fontWeight: FontWeight.w500,
          height: 1.6)),
);

// ── Page ──────────────────────────────────────────────────────────────────────

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final mob = sw < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          _hero(context, sw, sh, mob,
              icon: LucideIcons.fileText,
              title: 'Terms and Conditions',
              subtitle: 'Last updated: July 10, 2025  |  Version 1.0'),

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: sh * 0.06, horizontal: sw * 0.04),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 896),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _sec(context, mob,
                    icon: LucideIcons.info,
                    title: '1.  Introduction',
                    body: 'These Terms and Conditions ("Terms") govern your access to and use of the '
                          'JV ALMA C.I.S website (jvalmacis.com) and mobile applications (KilimoMkononi, '
                          'CoffeeCore, NyumbaSmart), operated by JV ALMA C.I.S ("JV", "we", "us", "our"), '
                          'a company established in 2017 and registered in Kenya.\n\n'
                          'By accessing or using our website or applications, you agree to be bound by '
                          'these Terms. If you do not agree, please do not use our platforms.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.building2,
                    title: '2.  About JV ALMA C.I.S',
                    body: 'JV ALMA C.I.S is a multi-sector company operating across four business units:',
                    bullets: [
                      'Construction: Facility remodeling, renovation, landscaping, and civil works.',
                      'Oil and Gas Services: Technical services for the energy sector.',
                      'Agribusiness: Agricultural training, market connectivity, and field management through KilimoMkononi and partnerships with KALRO and Moi University.',
                      'IT Division: Software products including KilimoMkononi (Enterprise & Education), CoffeeCore, NyumbaSmart CMMS, and AlmaWorks.',
                    ],
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.users,
                    title: '3.  Who May Use Our Platforms',
                    subs: [
                      const _Sub('Website (jvalmacis.com):', [
                        'Any individual may browse the website for informational purposes.',
                        'Users must be 18 or older to submit contact forms, career applications, or newsletter sign-ups.',
                      ]),
                      const _Sub('KilimoMkononi — Enterprise:', [
                        'Any individual aged 18 and above may register to access farming tools, market data, and weather features.',
                      ]),
                      const _Sub('KilimoMkononi — Education:', [
                        'Students may only access the app under the supervision and explicit approval of a registered Teacher at a registered institution.',
                        'Students under 18 are considered minor users and are subject to additional data protections.',
                        'Teachers must be registered and approved by the Head Teacher of a registered institution.',
                        'Head Teachers are responsible for approving Teachers and for the proper use of the app within their institution.',
                      ]),
                      const _Sub('CoffeeCore:', [
                        'Open to registered cooperative members and administrators aged 18 and above.',
                      ]),
                      const _Sub('NyumbaSmart:', [
                        'Open to registered facility managers, clients, and administrators aged 18 and above.',
                      ]),
                    ],
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.userCheck,
                    title: '4.  Account Registration',
                    bullets: [
                      'You must provide accurate, complete, and current information at registration on all platforms.',
                      'You are responsible for maintaining the confidentiality of your login credentials. Do not share your password.',
                      'Notify us immediately at support@jvalmacis.co.ke if you suspect unauthorised access to your account.',
                      'JV reserves the right to suspend or terminate accounts that provide false information or violate these Terms.',
                    ],
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.checkSquare,
                    title: '5.  Permitted and Prohibited Conduct',
                    subs: [
                      const _Sub('Permitted use:', [
                        'Our platforms are provided for personal and professional use appropriate to your registered role.',
                        'You may access and use features available within your registered platform and role.',
                      ]),
                      const _Sub('You must NOT:', [
                        'Use any platform for unlawful purposes.',
                        'Attempt to access another user\'s account, data, or features beyond your assigned role.',
                        'Upload false, misleading, or harmful information.',
                        'Attempt to reverse-engineer, copy, distribute, or exploit any platform\'s source code.',
                        'Use the platforms to send unsolicited communications or spam.',
                        'Attempt to bypass, circumvent, or disable any security control.',
                        'Allow a minor student to create a KilimoMkononi Education account independently, without Teacher and Head Teacher approval.',
                        'Access any platform using someone else\'s credentials.',
                        'Scrape, data-mine, or harvest information from any platform by automated means.',
                      ]),
                    ],
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.school,
                    title: '6.  KilimoMkononi Education — Institutional Obligations',
                    body: 'By registering their institution on the Education Module, the Head Teacher and the institution agree to:',
                    bullets: [
                      'Ensure all student accounts are for genuine enrolled students only.',
                      'Obtain written parental or guardian consent for each minor student before creating their account.',
                      'Notify JV immediately if a student leaves the institution so the account can be deactivated.',
                      'Report any concern, complaint, or incident relating to a minor user\'s safety or data to JV immediately at support@jvalmacis.co.ke.',
                      'Ensure no direct communication is facilitated between minor students and adult users outside the defined teacher-student class structure.',
                    ],
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.bookOpen,
                    title: '7.  Content and Information Accuracy',
                    body: 'Farming tips, market prices, weather data, pest and disease information, '
                          'construction project details, and other content provided on our platforms are '
                          'for informational and educational purposes only.',
                  ),

                  _callout(mob,
                    'JV does not guarantee the accuracy, completeness, or timeliness of any content provided '
                    'on our platforms. Users should exercise independent judgement before making business, '
                    'farming, or construction decisions based on platform content. JV is not liable for any '
                    'agricultural, financial, or commercial loss resulting from reliance on platform information.'),

                  _sec(context, mob,
                    icon: LucideIcons.heartHandshake,
                    title: '8.  Partner Content (KALRO & MOI University)',
                    body: 'Certain agronomic content within KilimoMkononi is developed in collaboration with '
                          'KALRO and MOI University under formal agreements. Such content is provided for '
                          'educational purposes only and is the intellectual property of the respective partners. '
                          'You may not reproduce or commercially exploit partner content outside the app.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.shield,
                    title: '9.  Intellectual Property',
                    body: 'All content, software, design, trademarks, and data on our website and applications '
                          'are the intellectual property of JV ALMA C.I.S or its licensed partners. All rights '
                          'reserved. You may not reproduce, distribute, modify, or create derivative works from '
                          'any platform content without prior written permission from JV. Our platforms are '
                          'licensed to you for personal or professional use only — they are not sold to you.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.wifi,
                    title: '10.  Service Availability',
                    body: 'JV targets high platform availability but does not guarantee uninterrupted service. '
                          'Platforms may be temporarily unavailable due to:',
                    bullets: [
                      'Planned maintenance (notified via in-app message or website notice at least 24 hours in advance).',
                      'Google Firebase or third-party infrastructure issues.',
                      'Network outages or force majeure events.',
                      'Emergency security updates.',
                    ],
                    footer: 'JV is not liable for any loss or inconvenience arising from platform unavailability.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.globe,
                    title: '11.  Third-Party Services',
                    body: 'Our platforms rely on third-party services including:',
                    bullets: [
                      'Google Firebase (Google LLC) — database, authentication, storage, and hosting.',
                      'OpenWeather API — weather forecast data for KilimoMkononi.',
                      'KALRO and MOI University — agricultural content partners.',
                    ],
                    footer: 'JV is not responsible for any data loss, outage, or security incident caused by these third-party services.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.lock,
                    title: '12.  Privacy',
                    body: 'Your use of our platforms is governed by our Privacy Policy, accessible at '
                          'jvalmacis.com/privacy-policy. By using our platforms, you consent to data collection '
                          'and processing as described in that policy.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.alertTriangle,
                    title: '13.  Limitation of Liability',
                    body: 'To the fullest extent permitted by Kenyan law, JV ALMA C.I.S shall not be liable for:',
                    bullets: [
                      'Any indirect, incidental, special, or consequential loss arising from use of our platforms.',
                      'Agricultural, financial, or commercial loss arising from reliance on platform content.',
                      'Loss of data due to infrastructure outages beyond JV\'s reasonable control.',
                      'Unauthorised access caused by a user\'s breach of these Terms (e.g. sharing credentials).',
                    ],
                    footer: 'JV\'s total aggregate liability for any claim shall not exceed the amount (if any) paid by you for the relevant platform in the twelve months preceding the claim.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.xCircle,
                    title: '14.  Termination',
                    body: 'JV reserves the right to suspend or permanently terminate your access if you:',
                    bullets: [
                      'Violate any of these Terms.',
                      'Provide false registration information.',
                      'Engage in conduct harmful to other users, the platform, or the integrity of its data.',
                      'Breach the minor user protection requirements for KilimoMkononi Education.',
                    ],
                    footer: 'Upon termination, your personal data will be handled in accordance with our Privacy Policy. '
                            'You may request deletion of your account at any time by contacting support@jvalmacis.co.ke.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.scale,
                    title: '15.  Governing Law',
                    body: 'These Terms are governed by and construed in accordance with the laws of Kenya. '
                          'Any dispute arising from or relating to these Terms shall be subject to the exclusive '
                          'jurisdiction of the Kenyan courts.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.refreshCw,
                    title: '16.  Changes to These Terms',
                    body: 'JV may update these Terms from time to time. We will notify users of material changes '
                          'via in-app notification and/or a prominent notice on this website at least 14 days '
                          'before the change takes effect. Continued use of our platforms after the effective '
                          'date constitutes your acceptance of the revised Terms.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.mail,
                    title: '17.  Contact Us',
                    body: 'For questions about these Terms or to exercise your rights:',
                    contacts: [
                      const _Contact(LucideIcons.mail,   'Email: support@jvalmacis.co.ke'),
                      const _Contact(LucideIcons.phone,  'Phone: +254 795 802 020'),
                      const _Contact(LucideIcons.mapPin, 'Address: Kin\'gara Heights PQ66+2FM Junction, James Gichuru Rd, P.O. Box 12345-00100, Nairobi, Kenya'),
                    ],
                  ),

                ],
              ),
            ),
          ),

          SizedBox(height: sh * 0.03),
          const Footer(),
        ]),
      ),
    );
  }
}