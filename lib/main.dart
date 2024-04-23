// ignore_for_file: avoid_print

import 'package:cfp_step/qrgen/QRGeneratorFromJsonPlaceholderState.dart';
import 'package:cfp_step/registration/registration.dart';
import 'package:cfp_step/service/push_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cfp_step/auth/login_screen.dart';
import 'package:cfp_step/dashboard/dashboard.dart';

import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PushNotificationService _notificationService = PushNotificationService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _notificationService.initialize();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      onGenerateInitialRoutes: (String initialRoute) {
        return [
          MaterialPageRoute(
            settings: RouteSettings(name: initialRoute),
            builder: (context) => LoginScreen(),
          ),
        ];
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/registration':
            return MaterialPageRoute(builder: (context) => RegistrationScreen());
          case '/dashboard':
            return MaterialPageRoute(builder: (context) => const DashboardScreen());
          case '/qrcode':
            return MaterialPageRoute(builder: (context) => const QRGeneratorFromJsonPlaceholder());
          default:
            return null;
        }
      },
    );
  }
}

