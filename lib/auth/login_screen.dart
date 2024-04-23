import 'package:flutter/material.dart';
import 'auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 110),
          child: SizedBox(

            child: Column(
              children: [
                Image.asset(
                  'images/steplogo.png', // Percorso relativo dell'immagine
                  height: 150, // Altezza dell'immagine
                  width: 200, // Larghezza dell'immagine
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Accedi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Colore del bordo celeste
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Colore del bordo celeste
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              await _authService.signInWithEmailAndPassword(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                              Navigator.pushReplacementNamed(context, '/dashboard');
                            } catch (e) {
                              print('Errore durante l\'accesso: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Credenziali di accesso errate. Riprova.'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: const Text('Accedi'),
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/registration');
                          },
                          child: const Text('Non sei registrato? Registrati qui'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}