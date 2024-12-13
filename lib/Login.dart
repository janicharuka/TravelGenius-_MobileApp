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
                  AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.4), // Semi-transparent background
    borderRadius: BorderRadius.circular(40), // Rounded corners
    border: Border.all(
      color: Colors.pinkAccent.withOpacity(0.8),
      width: 1.5,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(2, 4),
      ),
    ],
  ),
  child: TextFormField(
    obscureText: true,
    controller: passwordController,
    decoration: InputDecoration(
      labelText: 'Password',
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: Colors.white70,
      ),
      prefixIcon: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Color.fromARGB(255, 252, 10, 2),
              Color.fromARGB(255, 245, 115, 148),
              Color.fromARGB(255, 241, 197, 218),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: const Icon(
          Icons.lock,
          size: 24,
          color: Colors.white, // The color will be overridden by the ShaderMask
        ),
      ),
      filled: true,
      fillColor: Colors.transparent, // Keeps the container's transparency intact
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    ),
    cursorColor: Colors.pinkAccent,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
),

                    const SizedBox(height: 16),
                    // Password Field
                    AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: Colors.black.withOpacity(0.4), // Semi-transparent background
    borderRadius: BorderRadius.circular(40), // Rounded corners
    border: Border.all(
      color: Colors.pinkAccent.withOpacity(0.8),
      width: 1.5,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(2, 4),
      ),
    ],
  ),
  child: TextFormField(
    obscureText: true,
    controller: passwordController,
    decoration: InputDecoration(
      labelText: 'Password',
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: Colors.white70,
      ),
      prefixIcon: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
             Color.fromARGB(255, 252, 10, 2),
              Color.fromARGB(255, 245, 115, 148),
              Color.fromARGB(255, 241, 197, 218),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds);
        },
        child: const Icon(
          Icons.lock,
          size: 24,
          color: Colors.white, // The color will be overridden by the ShaderMask
        ),
      ),
      filled: true,
      fillColor: Colors.transparent, // Keeps the container's transparency intact
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    ),
    cursorColor: Colors.pinkAccent,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
  ),
),

                    const SizedBox(height: 20),
                    // Login Button
                   AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        const Color.fromARGB(255, 255, 49, 117).withOpacity(0.8),
        const Color.fromARGB(255, 215, 47, 245).withOpacity(0.8),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 10,
        offset: const Offset(4, 4),
      ),
    ],
  ),
  child: ElevatedButton(
    onPressed: () {
      final email = emailController.text;
      final password = passwordController.text;
      authenticate(email, password);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // Makes background transparent to use gradient
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: Colors.transparent, // Removes default shadow to make it clean
    ),
    child: const Text(
      'JOIN',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto', // Advanced font style
        color: Color.fromARGB(169, 255, 255, 255), // Text color
      ),
    ),
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
