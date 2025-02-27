// main.dart
import 'package:flutter/material.dart';
import 'package:link_life/screens/auth/login_screen.dart';
import 'package:link_life/screens/auth/signup_screen.dart';
import 'package:link_life/screens/onboarding/intro_screen.dart';
import 'package:link_life/screens/onboarding/welcome_screen.dart';

void main() {
  runApp(const LinkLifeApp());
}

class LinkLifeApp extends StatelessWidget {
  const LinkLifeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkLife Rwanda',
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/intro': (context) => IntroScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/eventDiscovery': (context) => EventDiscoveryScreen(),
        '/hospitalDirectory': (context) => HospitalDirectoryScreen(),
        '/appointmentBooking': (context) => AppointmentBookingScreen(),
        '/qrDisplay': (context) => QRDisplayScreen(),
        '/qrScanner': (context) => QRScannerScreen(),
        '/attendanceTracking': (context) => AttendanceTrackingScreen(),
        '/recoveryTips': (context) => RecoveryTipsScreen(),
        '/eligibilityReminder': (context) => EligibilityReminderScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/notificationSettings': (context) => NotificationSettingsScreen(),
        '/privacySettings': (context) => PrivacySettingsScreen(),
        '/eventManagement': (context) => EventManagementScreen(),
        '/volunteerTracking': (context) => VolunteerTrackingScreen(),
      },
    );
  }
}
