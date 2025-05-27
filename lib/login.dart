import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with logo and title
          Container(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFFFC107), // Yellow background
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset(
                  'assets/worker.png', // replace with your asset
                  height: 200,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Garage ',
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'LK',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Text(
            "Login",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          // Email / Phone Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Email/ Phone Number"),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          // Password Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Password"),
                SizedBox(height: 5),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          // Links
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Reset Password ?"),
                Text("Create an account"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Sign In Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // handle login
            },
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
