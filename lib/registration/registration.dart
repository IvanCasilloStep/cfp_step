import 'package:flutter/material.dart';
import '../auth/auth.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 130),
          child: SizedBox(
            height: 400,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        'Registrati',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          await _authService.createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        } catch (e) {
                          // ignore: avoid_print
                          print('Errore durante la registrazione: $e');
                          // Puoi gestire l'errore mostrando un messaggio all'utente o effettuando altre azioni necessarie
                        }
                      },
                      child: const Text('Registrati'),
                    ),
                    const SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/login');
                      },
                      child: const Text('Sei già registrato? Accedi'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
