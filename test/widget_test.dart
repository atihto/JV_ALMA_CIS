// This is a basic Flutter widget test for the JV ALMA CIS website.
//
// Uses WidgetTester to verify key widgets in the HomePage, such as the app bar,
// division section titles, and button interactions.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jv_alma_cis/main.dart';
import 'package:jv_alma_cis/pages/home_page.dart';

void main() {
  testWidgets('HomePage renders correctly and displays key widgets', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the app bar title.
    expect(find.text('JV ALMA CIS'), findsOneWidget);

    // Verify division section titles.
    expect(find.text('Construction'), findsOneWidget);
    expect(find.text('Technology & Innovation (ALMA Tech)'), findsOneWidget);
    expect(find.text('Oil & Gas'), findsOneWidget);

    // Verify the presence of the "Learn More" button in the header.
    expect(find.widgetWithText(ElevatedButton, 'Learn More'), findsOneWidget);

    // Verify the hamburger menu icon on mobile layout (simulate small screen).
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Tap the "Learn More" button and check for navigation (mock navigation observer).
    final navigatorObserver = MockNavigatorObserver();
    await tester.pumpWidget(
      MaterialApp(
        home: const HomePage(),
        navigatorObservers: [navigatorObserver],
      ),
    );
    await tester.tap(find.widgetWithText(ElevatedButton, 'Learn More'));
    await tester.pumpAndSettle();
    expect(navigatorObserver.pushedRoutes.contains('/about'), isTrue);
  });
}

// Mock NavigatorObserver to track navigation events.
class MockNavigatorObserver extends NavigatorObserver {
  List<String> pushedRoutes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route.settings.name != null) {
      pushedRoutes.add(route.settings.name!);
    }
  }
}