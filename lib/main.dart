// main.dart
import 'package:flutter/material.dart';
import 'package:link_life/admin/event_management_screen.dart';
import 'package:link_life/admin/volunteer_tracking_screen.dart';
import 'package:link_life/appointments/appointment_booking_screen.dart';
import 'package:link_life/attendance/attendance_tracking_screen.dart';
import 'package:link_life/events/event_discovery_screen.dart';
import 'package:link_life/followup/eligibility_reminder_screen.dart';
import 'package:link_life/followup/recovery_tips_screen.dart';
import 'package:link_life/hospitals/hospital_directory_screen.dart';
import 'package:link_life/map/google_map.dart';
import 'package:link_life/notifications/notifications_screen.dart';
import 'package:link_life/qr/qr_display_screen.dart';
import 'package:link_life/qr/qr_scanner_screen.dart';
import 'package:link_life/screens/auth/login_screen.dart';
import 'package:link_life/screens/auth/signup_screen.dart';
import 'package:link_life/screens/home/dashboard_screen.dart';
import 'package:link_life/screens/onboarding/intro_screen.dart';
import 'package:link_life/screens/onboarding/welcome_screen.dart';
import 'package:link_life/settings/edit_profile_screen.dart';
import 'package:link_life/settings/notification_settings_screen.dart';
import 'package:link_life/settings/privacy_settings_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // import dotenv

void main() async {
  // Make sure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  await dotenv.load();

  runApp(const LinkLifeApp());
}

class LinkLifeApp extends StatelessWidget {
  const LinkLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkLife Rwanda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/intro': (context) => IntroScreen(),
        '/signup': (context) => SignUpScreen(),
        '/events': (context) => EventDiscoveryScreen(),
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
        '/map': (context) => MapPage(),
      },
    );
  }
}
