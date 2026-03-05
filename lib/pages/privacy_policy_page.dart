import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final isMobile = sw < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Hero ──────────────────────────────────────────────
            _hero(context, sw, sh, isMobile,
              icon: LucideIcons.shield,
              title: 'Privacy Policy',
              subtitle: 'Last updated: July 10, 2025',
            ),

            // ── Body ──────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: sh * 0.06, horizontal: sw * 0.04),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 896),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _section(context, isMobile,
                      icon: LucideIcons.info,
                      title: 'About This Notice',
                      body: 'This Privacy Policy explains how JV ALMA C.I.S ("JV", "we", "us", "our"), '
                            'established in 2017 and registered in Kenya, collects and processes your '
                            'personal data when you interact with our website (jvalmacis.com), mobile '
                            'applications (KilimoMkononi, CoffeeCore, NyumbaSmart), or engage with our '
                            'services across our Construction, Oil and Gas Services, Agribusiness, and '
                            'IT Division business units.\n\n'
                            'JV is the Data Controller for all personal data collected through these '
                            'platforms, in accordance with the Kenya Data Protection Act, 2019 (DPA).\n\n'
                            'Data Controller Contact: infojvalmacis@gmail.com',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.database,
                      title: 'The Data We Collect About You',
                      body: 'We collect personal data to deliver and improve our services. The types of data we collect include:',
                      subsections: [
                        const _Subsection('Information you provide to us:', [
                          'KilimoMkononi (Enterprise & Education): Full name, email, county, constituency, ward, phone number, farming type, primary crops, and password for registration and login. Education users additionally provide school name, class/grade, and role (student, teacher, head teacher).',
                          'CoffeeCore: Full name, email, county, constituency, ward, phone number, password, and cooperative information.',
                          'NyumbaSmart: Username, email, password, and facility information (e.g. facility name and location).',
                          'Website: Email for newsletter sign-ups; full name, email, phone number, and relevant details for careers applications and contact form submissions.',
                          'Additional data such as identity data, contact data, billing information, or project-specific details provided during service requests.',
                        ]),
                        const _Subsection('Information on your use of our platforms:', [
                          'We automatically collect data about your interactions, including searches, views, downloads, project submissions, and app usage across KilimoMkononi, CoffeeCore, and NyumbaSmart.',
                          'Mobile apps: We may collect approximate location data and device information (e.g. unique device identifiers) to provide location-based services such as agricultural insights, facility management updates, or weather forecasts. You can disable location services in your device settings at any time.',
                        ]),
                        const _Subsection('Information from third parties and public sources:', [
                          'We may receive data from partners (e.g. KALRO, MOI University), service providers, or public sources related to our construction, agribusiness, or oil and gas services.',
                        ]),
                      ],
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.cookie,
                      title: 'What About Cookies?',
                      body: 'Cookies are small files of letters and numbers placed on your device with your consent. '
                            'They help us distinguish you from other users, improving your experience on our website '
                            'and apps.',
                      linkText: 'Cookies Policy',
                      linkRoute: '/cookies',
                      linkPrefix: 'For more information, see our ',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.lock,
                      title: 'How We Use Your Personal Data',
                      body: 'We use your personal data to operate, provide, develop, and improve our offerings, including:',
                      bullets: [
                        'Registering and managing user accounts for KilimoMkononi, CoffeeCore, and NyumbaSmart.',
                        'Processing and fulfilling project requests, service orders, or software subscriptions.',
                        'Managing client and partner relationships, including customer support, project updates, and career application processing.',
                        'Enabling participation in agribusiness training, community infrastructure projects, or software trials.',
                        'Managing newsletter subscriptions and delivering tailored communications.',
                        'Improving our website, apps, and services across all business units.',
                        'Recommending relevant services or products, such as facility management tools or agricultural solutions.',
                        'Complying with legal obligations, including identity verification for contracts or partnerships.',
                        'Detecting fraud or misuse of our services.',
                      ],
                    ),

                    _callout(context, isMobile,
                      'We do NOT use your data for third-party advertising or profiling unrelated to JV ALMA CIS services. '
                      'We do NOT sell or rent your personal data to any third party.'),

                    _section(context, isMobile,
                      icon: LucideIcons.users,
                      title: 'How We Share Your Personal Data',
                      body: 'We may share your personal data with third parties for the following purposes:',
                      bullets: [
                        'Service delivery: To provide services in Construction, Oil and Gas, Agribusiness (e.g. training with KALRO or MOI University), or IT Division, we may share data with partners or subcontractors.',
                        'Third-party service providers: We engage third parties for functions like project logistics, data analysis, marketing, or customer support.',
                        'Fraud prevention and legal compliance: We may share data with organisations to prevent fraud, manage risks, or comply with Kenyan law or court orders.',
                        'Kenyan authorities: Including the Office of the Data Protection Commissioner (ODPC) where required by law.',
                      ],
                      footer: 'When sharing data, we require third parties to use your data only for specified purposes, '
                              'per our instructions, and in accordance with this Privacy Policy and applicable law.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.globe,
                      title: 'International Transfers',
                      body: 'We may transfer your personal data to locations in another country where permissible under '
                            'applicable laws. We implement appropriate safeguards to protect your data and respect your '
                            'legal rights in accordance with this notice and local regulations.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.shieldCheck,
                      title: 'Data Security',
                      body: 'We maintain appropriate technical and organisational security measures to prevent your '
                            'personal data from being accidentally lost, used, accessed, altered, or disclosed without '
                            'authorisation. Measures include:',
                      bullets: [
                        'AES-256 encryption at rest and TLS 1.2+ encryption in transit for all stored and transmitted data.',
                        'Role-based access controls restricting data access to authorised personnel only.',
                        'Multi-factor authentication (MFA) for administrator accounts.',
                        'Automated alerts for anomalous activity or repeated authentication failures.',
                        'Regular security reviews of our platforms and third-party integrations.',
                      ],
                      footer: 'We have procedures to address suspected data breaches and will notify you and any '
                              'applicable regulator as required by law. If you believe your account has been '
                              'compromised, contact us immediately at info@jvalmacis.com.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.baby,
                      title: 'Children\'s Privacy',
                      body: 'The KilimoMkononi Education Module is accessible to students who may be under 18. '
                            'For minor users we apply the highest level of data protection:',
                      bullets: [
                        'We collect minimum data only — name, school-assigned email, school name, and role.',
                        'Minor accounts are only created under institutional supervision (Head Teacher → Teacher → Student). No minor may self-register.',
                        'No minor\'s personal phone number, home address, or photograph is collected.',
                        'Minor user data is never shared with third parties for marketing or profiling.',
                        'A parent or legal guardian may request access to, correction of, or deletion of their child\'s data at any time: infojvalmacis@gmail.com',
                      ],
                      footer: 'Our general website and other apps (CoffeeCore, NyumbaSmart) are not directed at children under 18.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.userCheck,
                      title: 'Your Legal Rights',
                      body: 'Under the Kenya Data Protection Act, 2019 and other applicable laws, you may have rights to:',
                      bullets: [
                        'Access a copy of the personal data we hold about you.',
                        'Request correction of inaccurate or incomplete data.',
                        'Request deletion of your personal data, subject to legal retention obligations.',
                        'Object to certain processing, including direct marketing.',
                        'Withdraw consent at any time (e.g. unsubscribe from newsletters).',
                        'Lodge a complaint with the ODPC: info@odpc.go.ke  |  www.odpc.go.ke',
                      ],
                      footer: 'To exercise any right, contact us at infojvalmacis@gmail.com. We will respond within 21 days.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.refreshCw,
                      title: 'Changes to This Policy',
                      body: 'We may update this Privacy Policy from time to time to reflect changes in our practices, '
                            'technology, or legal requirements. We will notify you of material changes by posting the '
                            'updated policy on this page and updating the "Last updated" date.',
                    ),

                    _section(context, isMobile,
                      icon: LucideIcons.mail,
                      title: 'Contact Us',
                      body: 'For questions, data requests, or to exercise your rights:',
                      contacts: [
                        const _ContactData(LucideIcons.mail,   'Email: infojvalmacis@gmail.com'),
                        const _ContactData(LucideIcons.phone,  'Phone: +254 712 174 516'),
                        const _ContactData(LucideIcons.mapPin,
                            'Address: Kin\'gara Heights PQ66+2FM Junction, James Gichuru Rd, P.O. Box 12345-00100, Nairobi, Kenya'),
                      ],
                      footer: 'Office of the Data Protection Commissioner (ODPC):\ninfo@odpc.go.ke  |  www.odpc.go.ke',
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height: sh * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
// SHARED BUILDER HELPERS
// ═════════════════════════════════════════════════════════════════════════════

class _Subsection {
  final String heading;
  final List<String> bullets;
  const _Subsection(this.heading, this.bullets);
}

class _ContactData {
  final IconData icon;
  final String text;
  const _ContactData(this.icon, this.text);
}

Widget _hero(BuildContext ctx, double sw, double sh, bool isMobile, {
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
      ),
    ),
    padding: EdgeInsets.symmetric(
        vertical: sh * 0.08, horizontal: sw * 0.04),
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
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center),
          SizedBox(height: sh * 0.01),
          Text(subtitle,
              style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFFBFDBFE)),
              textAlign: TextAlign.center),
        ]),
      ),
    ),
  );
}

Widget _section(BuildContext ctx, bool isMobile, {
  required IconData icon,
  required String title,
  String? body,
  List<String>? bullets,
  List<_Subsection>? subsections,
  List<_ContactData>? contacts,
  String? footer,
  String? linkText,
  String? linkRoute,
  String? linkPrefix,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 32),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Section header
      Row(children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title,
              style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  fontWeight: FontWeight.bold)),
        ),
      ]),
      const SizedBox(height: 16),

      // Body text (optionally with inline link)
      if (body != null) ...[
        if (linkText != null && linkRoute != null && linkPrefix != null)
          Builder(builder: (ctx2) => Wrap(children: [
            Text(linkPrefix,
                style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF4B5563))),
            GestureDetector(
              onTap: () => Navigator.pushNamed(ctx2, linkRoute),
              child: Text(linkText,
                  style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: const Color(0xFF2563EB),
                      decoration: TextDecoration.underline)),
            ),
            Text('.',
                style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: const Color(0xFF4B5563))),
          ]))
        else
          Text(body,
              style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF4B5563),
                  height: 1.6)),
        const SizedBox(height: 12),
      ],

      // Subsections (bold heading + bullets)
      if (subsections != null)
        ...subsections.map((s) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s.heading,
                style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4B5563))),
            const SizedBox(height: 6),
            ...s.bullets.map((b) => _bulletRow(b, isMobile)),
          ]),
        )),

      // Plain bullets
      if (bullets != null)
        ...bullets.map((b) => _bulletRow(b, isMobile)),

      // Contact rows
      if (contacts != null)
        ...contacts.map((c) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(c.icon, size: 16, color: const Color(0xFF6B7280)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(c.text,
                  style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: const Color(0xFF4B5563))),
            ),
          ]),
        )),

      // Footer note
      if (footer != null)
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(footer,
              style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF4B5563),
                  height: 1.6)),
        ),
    ]),
  );
}

Widget _bulletRow(String text, bool isMobile) => Padding(
  padding: const EdgeInsets.only(bottom: 8),
  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('• ',
        style: TextStyle(fontSize: 16, color: Color(0xFF4B5563))),
    Expanded(
      child: Text(text,
          style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: const Color(0xFF4B5563),
              height: 1.5)),
    ),
  ]),
);

Widget _callout(BuildContext ctx, bool isMobile, String text) => Container(
  margin: const EdgeInsets.only(bottom: 32),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: const Color(0xFFEFF6FF),
    borderRadius: BorderRadius.circular(8),
    border: const Border(left: BorderSide(color: Color(0xFF2563EB), width: 4)),
  ),
  child: Text(text,
      style: TextStyle(
          fontSize: isMobile ? 12 : 14,
          color: const Color(0xFF1E40AF),
          fontWeight: FontWeight.w500,
          height: 1.6)),
);