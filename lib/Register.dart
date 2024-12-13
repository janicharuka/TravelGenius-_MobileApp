import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String? name, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {

    final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Overlay
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero.jpg'), // Replace with your image path
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
                      child: Image.asset('assets/images/logo.jpg'), // Replace with your logo path
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
    'R e g i s t e r',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white, // This color is overridden by ShaderMask
      shadows: [
        Shadow(
          offset: Offset(2, 2),
          blurRadius: 6,
          color: Colors.black38,
        ),
      ],
    ),
  ),
),

                    const SizedBox(height: 20),
                    // Registration Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Name Field
         AnimatedContainer(
  duration: const Duration(milliseconds: 300), // Duration for the animation
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.3), // Semi-transparent background
    borderRadius: BorderRadius.circular(40), // Rounded corners
  ),
  child: TextFormField(
    decoration: InputDecoration(
      labelText: 'Name',
      prefixIcon: const Icon(Icons.person, color:  Color.fromARGB(255, 236, 81, 9)),
      filled: true,
      fillColor: Colors.transparent, // Transparent background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40), // Rounded corners
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    onSaved: (value) => name = value,
  ),
),

const SizedBox(height: 16),

// Email Field
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(40),
  ),
  child: TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Email',
      prefixIcon: const Icon(Icons.email, color:  Color.fromARGB(255, 236, 81, 9)),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    onSaved: (value) => email = value,
  ),
),

const SizedBox(height: 16),

// Password Field
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(40),
  ),
  child: TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Password',
      prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 236, 81, 9)),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    onSaved: (value) => password = value,
  ),
),

const SizedBox(height: 16),

// Confirm Password Field
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(40),
  ),
  child: TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      labelText: 'Confirm Password',
      prefixIcon: const Icon(Icons.lock, color:  Color.fromARGB(255, 236, 81, 9)),
      filled: true,
      fillColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
    style: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    onSaved: (value) => confirmPassword = value,
  ),
),


                          const SizedBox(height: 20),
                          // Register Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final name = nameController.text;
                                final email = emailController.text;
                                final password = passwordController.text;
                                final confirmPassword = confirmPasswordController.text;
                                
                                saveUserData(name, email, password,);

                                Navigator.of(context).pushNamed('/login');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Login Link
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.white70),
                              ),
                              TextButton(
                                onPressed: () {
                                   Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text(
                                  'Login here',
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                
                              ),
                            ],
                          ),
                        ],
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




  Future<void> saveUserData(String name, String email, String password) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

    // Register user with Firebase Authentication
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Use push() to generate a unique key for each user
    await _dbRef.child('users').push().set({
      'name': name,
      'email': email,
      'password': password, // Avoid storing passwords in plaintext for security reasons
    });

    print('User data saved successfully!');
  } catch (e) {
    print('Failed to save user data: $e');
    throw Exception('Error saving user data: $e');
  }
}
}
