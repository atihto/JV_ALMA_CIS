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

class CookiesPage extends StatelessWidget {
  const CookiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final mob = sw < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          _hero(context, sw, sh, mob,
              icon: LucideIcons.cookie,
              title: 'Cookies Policy',
              subtitle: 'Last updated: July 10, 2025'),

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
                    title: 'About This Cookies Policy',
                    body: 'This Cookies Policy explains how JV ALMA C.I.S ("JV", "we", "us", "our"), '
                          'established in 2017, uses cookies and similar technologies on our website '
                          '(jvalmacis.com) and mobile applications (KilimoMkononi, CoffeeCore, NyumbaSmart) '
                          'to enhance your experience across our Construction, Oil and Gas Services, '
                          'Agribusiness, and IT Division services.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.cookie,
                    title: 'What Are Cookies?',
                    body: 'Cookies are small files of letters and numbers placed on your device with your '
                          'consent. They help us distinguish you from other users, improving your experience '
                          'on our website and apps. We may also use similar technologies, such as web beacons '
                          'or pixel tags, to track user interactions.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.list,
                    title: 'Types of Cookies We Use',
                    body: 'We use the following categories of cookies:',
                    bullets: [
                      'Strictly Necessary Cookies: Required for basic site and app functionality, including session management, user authentication for KilimoMkononi, CoffeeCore, and NyumbaSmart, and maintaining website navigation. These cannot be disabled.',
                      'Analytics Cookies: Help us understand how visitors interact with our website and apps — tracking visitor numbers, navigation patterns, and app usage to improve performance. All data is anonymised.',
                      'Preference Cookies: Save your settings such as language preferences, project types, or app configurations to provide a tailored experience.',
                      'Marketing Cookies (website only): Used to deliver relevant updates such as newsletters, project alerts, or software notifications based on your interests. You can opt out at any time.',
                    ],
                  ),

                  // Cookie table
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Icon(LucideIcons.table2, size: 20),
                          const SizedBox(width: 8),
                          Text('Cookie Summary',
                              style: TextStyle(
                                  fontSize: mob ? 16 : 18,
                                  fontWeight: FontWeight.bold)),
                        ]),
                        const SizedBox(height: 16),
                        _cookieTable(mob),
                      ],
                    ),
                  ),

                  _callout(mob,
                    'JV ALMA CIS does NOT use advertising tracking pixels, social media trackers, '
                    'or any cookie that shares your personal data with a third party for commercial purposes.'),

                  _sec(context, mob,
                    icon: LucideIcons.users,
                    title: 'Third-Party Cookies',
                    body: 'Our approved third parties (e.g. analytics providers, search engines, or project '
                          'management platforms) may set cookies when you use our services to support analytics, '
                          'functionality, or communications. These third parties are required to use cookies in '
                          'accordance with this Cookies Policy and applicable laws.\n\n'
                          'The App uses Google Firebase for authentication and database services. Firebase may '
                          'use its own technical identifiers (not marketing cookies) to maintain your authenticated '
                          'session, operating under Google\'s Privacy Policy.\n\n'
                          'Weather data within KilimoMkononi is provided via the OpenWeather API. Only your '
                          'approximate county-level location is used — no personally identifiable data is '
                          'transmitted to the weather provider.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.settings,
                    title: 'Managing Your Cookie Preferences',
                    body: 'You can manage your cookie preferences through your browser or device settings. '
                          'Disabling strictly necessary cookies may prevent login or navigation on our platforms.',
                    subs: [
                      const _Sub('To manage cookies in your browser:', [
                        'Chrome: Settings → Privacy and security → Cookies and other site data',
                        'Firefox: Preferences → Privacy & Security → Cookies and Site Data',
                        'Safari: Preferences → Privacy → Manage Website Data',
                        'Edge: Settings → Cookies and site permissions',
                      ]),
                      const _Sub('For mobile apps:', [
                        'Adjust location and tracking permissions in your device Settings → Privacy.',
                        'For KilimoMkononi specifically, analytics and performance cookies can be toggled in Settings → Cookie Preferences within the app.',
                      ]),
                    ],
                    footer: 'For general guidance on managing cookies, visit: www.aboutcookies.org',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.refreshCw,
                    title: 'Changes to This Policy',
                    body: 'We may update this Cookies Policy from time to time. We will notify you of any '
                          'changes by posting the updated policy on this page and updating the "Last updated" date. '
                          'Material changes will also be notified via in-app notification on our mobile applications.',
                  ),

                  _sec(context, mob,
                    icon: LucideIcons.mail,
                    title: 'Contact Us',
                    body: 'If you have questions about this Cookies Policy or our use of cookies, please contact us:',
                    contacts: [
                      const _Contact(LucideIcons.mail,   'Email: infojvalmacis@gmail.com'),
                      const _Contact(LucideIcons.phone,  'Phone: +254 712 174 516'),
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

  Widget _cookieTable(bool mob) {
    final headers = ['Type', 'Purpose', 'Duration', 'Control'];
    final rows = [
      ['Strictly Necessary', 'Session management, authentication, security (CSRF), consent record', 'Session / up to 1 year', 'Cannot be disabled'],
      ['Analytics', 'Anonymised usage stats — pages visited, session duration, app feature usage', 'Up to 12 months', 'Toggle off in app or browser settings'],
      ['Preference', 'Saves display preferences and cookie consent choice', 'Up to 1 year', 'Can be disabled (may affect experience)'],
      ['Marketing', 'Newsletter and product update delivery (website only)', 'Up to 12 months', 'Opt out via unsubscribe link'],
    ];

    if (mob) {
      return Column(
        children: rows.map((row) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE5E7EB)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(headers.length, (i) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 12, color: Color(0xFF4B5563), height: 1.5),
                  children: [
                    TextSpan(text: '${headers[i]}: ', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                    TextSpan(text: row[i]),
                  ],
                ),
              ),
            )),
          ),
        )).toList(),
      );
    }

    return Table(
      border: TableBorder.all(color: const Color(0xFFE5E7EB), width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1.4),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(1.4),
        3: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFF1E293B)),
          children: headers.map((h) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(h, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          )).toList(),
        ),
        ...rows.asMap().entries.map((e) => TableRow(
          decoration: BoxDecoration(color: e.key.isOdd ? const Color(0xFFF8FAFC) : Colors.white),
          children: e.value.map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell, style: const TextStyle(fontSize: 13, color: Color(0xFF4B5563), height: 1.5)),
          )).toList(),
        )),
      ],
    );
  }
}