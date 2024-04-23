import 'dart:convert';
import 'package:flutter/services.dart';

import '../auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart'; // Aggiunto import per GoogleNavBar

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();
  late Future<List<dynamic>> _usersFuture;
  int _selectedIndex = 0; // Aggiunto _selectedIndex per indicare la selezione nella nav bar

  @override
  void initState() {
    super.initState();
    _usersFuture = _fetchUsers();
  }

  Future<List<dynamic>> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step SRL'),
        centerTitle: true,
          automaticallyImplyLeading: false
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Lista Contatti',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _usersFuture,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Errore durante il caricamento degli utenti'),
                  );
                } else {
                  List<dynamic> users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> user = users[index];
                      return Card(
                        color: Colors.white30,
                        child: ListTile(
                          title: Text(user['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${user['email']}'),
                              Text('City: ${user['address']['city']}'),
                            ],
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Dettagli Utente'),
                                  content: Container(
                                    width: double.maxFinite,
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Nome: ${user['name']}'),
                                          Text('Email: ${user['email']}'),
                                          Text('Username: ${user['username']}'),
                                          SizedBox(height: 20),
                                          Center(
                                            child: QrImageView(
                                              data: json.encode(user),
                                              version: QrVersions.auto,
                                              size: 200.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Chiudi'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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
                    Navigator.popAndPushNamed(context, '/dashboard');
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
          ),
        ),
      ),
    );
  }
}
