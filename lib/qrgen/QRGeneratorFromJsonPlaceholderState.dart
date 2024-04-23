// ignore_for_file: file_names

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import '../auth/auth.dart';

class QRGeneratorFromJsonPlaceholder extends StatefulWidget {
  const QRGeneratorFromJsonPlaceholder({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QRGeneratorFromJsonPlaceholderState createState() =>
      _QRGeneratorFromJsonPlaceholderState();
}

class _QRGeneratorFromJsonPlaceholderState
    extends State<QRGeneratorFromJsonPlaceholder> {
  final AuthService _authService = AuthService();
  late Map<String, dynamic> jsonData = {}; // Inizializza con una mappa vuota
  late String qrData = '';

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  Future<void> fetchJsonData() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/2'));
      if (response.statusCode == 200) {
        setState(() {
          jsonData = json.decode(response.body);
          qrData = generateVCard(
              jsonData); // Utilizza il contenuto JSON come dati per il codice QR
        });
      } else {
        // ignore: avoid_print
        print('Failed to load JSON data: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching JSON data: $e');
    }
  }

  String generateVCard(Map<String, dynamic> contactInfo) {
    final vCardData = '''
BEGIN:VCARD
VERSION:3.0
N:${contactInfo['name']}
TEL:${contactInfo['phone']}
EMAIL:${contactInfo['email']}
CITY:${contactInfo['address']['city']}
END:VCARD
''';
    // ignore: avoid_print
    print('stampo: $vCardData');
    return vCardData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generatore QR'),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: _authService.getUserEmail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              String? userEmail = snapshot.data;
              String userInitial = userEmail != null && userEmail.isNotEmpty
                  ? userEmail[0].toUpperCase()
                  : 'U';
              return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: const Text('Benvenuto'),
                    accountEmail: Text(userEmail ?? 'Email non disponibile'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(userInitial),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: const Text('QR Code'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/qrcode');
                      // Aggiungi qui la logica per gestire il tap sull'opzione 1
                    },
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                      // Aggiungi qui la logica per gestire il tap sull'opzione 1
                    },
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () async {
                      try {
                        // Effettua il logout
                        await _authService.signOut();

                        // Naviga alla schermata di accesso
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, '/login');
                      } catch (e) {
                        // ignore: avoid_print
                        print('Errore durante il logout: $e');
                        // Puoi gestire l'errore mostrando un messaggio all'utente o effettuando altre azioni necessarie
                      }
                    },
                  ),
                ],
              );
            } else {
              return const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Caricamento...'),
              );
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (qrData.isNotEmpty) // Aggiungi la verifica qui
              QrImageView(
                data: qrData, // Dati per generare il codice QR
                version: QrVersions.auto,
                size: 200.0,
              ),
            const SizedBox(height: 20),
            Text(
              'Contenuto JSON:\n$jsonData',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
