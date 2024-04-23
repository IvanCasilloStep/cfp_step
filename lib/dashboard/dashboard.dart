import 'dart:convert';
import '../auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();
  late Future<List<dynamic>> _usersFuture;

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
        title: const Text('Dashboard'),
      ),
      drawer: Drawer(
        child: FutureBuilder(
          future: _authService.getUserEmail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              String? userEmail = snapshot.data;
              String userInitial = userEmail != null && userEmail.isNotEmpty ? userEmail[0].toUpperCase() : 'U';
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
                    },
                  ),
                  ListTile(
                    title: const Text('Inserisci utente'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/user');
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
      body: FutureBuilder(
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
                            title: const Text('User Details'),
                            content: SizedBox(
                              width: double.maxFinite, // Imposta la larghezza al massimo disponibile
                              height: MediaQuery.of(context).size.height * 0.5, // Imposta l'altezza desiderata
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Name: ${user['name']}'),
                                    Text('Email: ${user['email']}'),
                                    Text('Username: ${user['username']}'),
                                    const SizedBox(height: 20),
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
                                child: const Text('Close'),
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
    );
  }
}
