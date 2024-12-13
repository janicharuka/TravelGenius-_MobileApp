import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

  final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero.jpg'), // Add your image path here
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/logo.jpg'), // Add your logo path here
                    ),
                    const SizedBox(height: 20),
                    // Title
                    ShaderMask(
  shaderCallback: (Rect bounds) {
    return LinearGradient(
      colors: [
        Color.fromARGB(255, 230, 19, 12),
        Color.fromARGB(255, 167, 24, 59),
        Color.fromARGB(255, 155, 103, 127),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(bounds);
  },
  child: const Text(
    'L o g i n',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto', // You can use a custom font by adding it to pubspec.yaml
      shadows: [
        Shadow(
          offset: Offset(2, 2),
          blurRadius: 4,
          color: Colors.black26,
        ),
        Shadow(
          offset: Offset(-2, -2),
          blurRadius: 4,
          color: Colors.white24,
        ),
      ],
      color: Colors.white, // Required but overridden by ShaderMask
    ),
  ),
),

                    const SizedBox(height: 20),
                    // Email Field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email, color: Colors.pinkAccent),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: const TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    // Password Field
                    TextFormField(
                      obscureText: true,
                       controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock, color: Colors.pinkAccent),
                        filled: true,
                        fillColor: Colors.grey[850],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: const TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        final email = emailController.text;
        final password = passwordController.text;


                        authenticate(email, password);



                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/Reg');
                          },
                          child: const Text(
                            'Register here',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Go Back to Home Page Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/Home'); // Navigate to Home Page
                      },
                      child: const Text(
                        'Go to Home Page',
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  @override
  Future<void> authenticate(String email, String password) async {
    try {
      final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Authentication failed: ${e.toString()}');
      throw Exception('Authentication failed: $e');
    }
  }
}
