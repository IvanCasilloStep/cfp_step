// ignore_for_file: file_names

import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import '../auth/auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Aggiunto import per GoogleNavBar

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
  int _selectedIndex = 1;

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
          centerTitle: true,
          automaticallyImplyLeading: false
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
      bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GNav(
        gap: 8,
        activeColor: Colors.blue,
        iconSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        duration: Duration(milliseconds: 600),
        tabBackgroundColor: Colors.black38,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),

          GButton(
            icon: Icons.qr_code,
            text: 'Qr Code',

          ),
          GButton(
            icon: Icons.person,
            text: 'Profilo',
          ),
        ],
        selectedIndex: _selectedIndex,

        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
              // Navigate to the Favorites page
              Navigator.pushNamed(context, '/dashboard');
            }
            if (index == 1) {
              // Navigate to the Favorites page
              Navigator.pushNamed(context, '/qrcode');
            }
            if (index == 2) {
              // Navigate to the Favorites page
              Navigator.pushNamed(context, '/profilo');
            }
          });
        },
      ),
    )
    )
      )
    );
  }
}
