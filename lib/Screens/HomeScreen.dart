import 'package:client/Screens/AppointmentScreen.dart';
import 'package:client/Screens/NotificationScreen.dart';
import 'package:client/Screens/ProfileScreen.dart';
import 'package:client/Screens/SerachScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Screen')), // Home
    SearchScreen(), // Search
    AppointmentScreen(), // Appointment
    NotificationScreen(), // Notification
    ProfileScreen(), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
         children: [
           if (selectedIndex == 0) 
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text('Home Screen'),
              ),
            )
          else 
            Expanded(
              child: _pages[selectedIndex], 
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
          child: Icon(
            Icons.add,
            size: 30,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
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
