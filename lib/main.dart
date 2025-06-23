import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart'; // Import the LoginPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garage LK',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const LoginPage(), // Set LoginPage as the starting page
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Set home (middle) as default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo & Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/worker.png', // Replace with your mascot image
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Garage LK",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF847059),
                      ),
                    ),
                  ],
                ),
              ),

              // Main Menu - Bigger buttons
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFCC33), // Yellow box
                  borderRadius: BorderRadius.circular(25),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 0.85, // Make buttons taller
                  children: [
                    _buildMenuTile(Icons.engineering, "Garage"),
                    _buildMenuTile(Icons.local_shipping, "Recovery Service"),
                    _buildMenuTile(Icons.local_gas_station, "Filling Station"),
                    _buildMenuTile(Icons.directions_car, "Rent A Car"),
                  ],
                ),
              ),

              // Recent Picks Section
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Recent Picks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF847059),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Recent picks list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _recentPicks.length,
                itemBuilder: (context, index) {
                  final pick = _recentPicks[index];
                  return _buildRecentPickCard(pick);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTile(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE4F4FA),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(25), // Increased padding for bigger buttons
          child: Icon(
            icon,
            size: 50, // Increased icon size
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRecentPickCard(Map<String, String> pick) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pick['garageName']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF847059),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFCC33),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  pick['amount']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.directions_car, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                pick['vehicleName']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Text(
                pick['date']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  pick['location']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Sample data for recent picks
  final List<Map<String, String>> _recentPicks = [
    {
      'garageName': 'AutoCare Colombo',
      'vehicleName': 'Toyota Prius 2018',
      'date': 'June 20, 2025',
      'amount': 'Rs. 15,500',
      'location': 'Galle Road, Colombo 03',
    },
    {
      'garageName': 'Quick Fix Motors',
      'vehicleName': 'Honda Civic 2020',
      'date': 'June 18, 2025',
      'amount': 'Rs. 8,750',
      'location': 'Kandy Road, Kegalle',
    },
    {
      'garageName': 'Elite Auto Service',
      'vehicleName': 'Nissan Leaf 2019',
      'date': 'June 15, 2025',
      'amount': 'Rs. 22,300',
      'location': 'Main Street, Gampaha',
    },
    {
      'garageName': 'Speedy Repairs',
      'vehicleName': 'Suzuki Alto 2021',
      'date': 'June 12, 2025',
      'amount': 'Rs. 5,200',
      'location': 'Beach Road, Negombo',
    },
  ];
}