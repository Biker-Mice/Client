import 'package:client/Screens/AppointmentScreen.dart';
import 'package:client/Screens/NotificationScreen.dart';
import 'package:client/Screens/ProfileScreen.dart';
import 'package:client/Screens/SerachScreen.dart';
import 'package:flutter/material.dart';

import '../Screens/suraj/addParts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Screen')), // Home
    const SearchScreen(), // Search
    const AppointmentScreen(), // Appointment
    const NotificationScreen(), // Notification
    const ProfileScreen(), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (selectedIndex == 0)
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text('Home Screen'),
              ),
            )
          else
            Expanded(
              child: _pages[selectedIndex],
            ),

          // Add Spareparts Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Action for Add Spareparts button
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddParts()));
                print('Add Spareparts Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Add Spare Parts',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ), // Directly display the selected page

      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF8FE1D7),
          onPressed: () {
            _onItemTapped(2); // Navigate to Appointment Screen
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            const SizedBox(width: 60),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                _onItemTapped(3); // Change to Notification on button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                _onItemTapped(4); // Change to Profile on button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
