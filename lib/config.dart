import 'dart:developer' as developer;

class Config {
  static const String appName = 'JV Alma CIS Kenya';
  static const String companyEmail = 'infojvalmacis@gmail.com';
  static const String companyPhone = '+254 712174516';
  static const String companyAddress = 'Nairobi, Kenya';
  
  // API Endpoints (if needed in future)
  static const String baseUrl = 'https://api.jvalmacis.co.ke';
  static const String contactEndpoint = '/api/contact';
  static const String newsletterEndpoint = '/api/newsletter';
  
  // Social Media Links
  static const String twitterUrl = 'https://twitter.com/jvalmacis';
  static const String linkedinUrl = 'https://linkedin.com/company/jvalmacis';
  static const String instagramUrl = 'https://instagram.com/jvalmacis/jval';
  
  // Partner Links
  static const String kalroUrl = 'https://kalro.org';
  static const String ticUrl = 'https://tic-inspectiongroup.com/en/';
  static const String brismaUrl = 'https://brisma-africa.com';
  static const String almaCisUrl = 'https://almacis.it/';
  static const String kenaffUrl = 'https://www.kenaff.org';
  static const String moiUniversityUrl = 'https://mu.ac.ke';

  static void logConfigAccess(String key) {
    developer.log('Config accessed: $key', name: 'Config');
  }
}