import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 20),

            // Sign up title
            const Center(
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            // First Name
            const Text("First Name"),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Last Name
            const Text("Last Name"),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Email / Phone
            const Text("Email / Phone number"),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            const Text("Password"),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Confirm Password
            const Text("Confirm Password"),
            const SizedBox(height: 5),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 40),

            // Sign Up Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // handle signup
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107), // yellow
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
