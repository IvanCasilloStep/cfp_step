// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

 Future initialize() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print ( 'Ho ricevuto un messaggio mentre ero in primo piano!' ); 
    print ( 'Dati del messaggio: ${message.data} ' ); 

    if (message.notification != null) {
      print ('Il messaggio conteneva anche una notifica: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  // Get the token
  await getToken();
}

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    print('Token: $token');
    return token;
  }

  Future< void > backgroundHandler(RemoteMessage message) async { 
  print ( 'Gestione di un messaggio in background ${message.messageId} ' ); 
}
}