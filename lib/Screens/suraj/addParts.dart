import 'package:flutter/material.dart';
import './newPart.dart';
import './newService.dart';

class AddParts extends StatefulWidget {
  const AddParts({super.key});

  @override
  State<AddParts> createState() => _AddPartsState();
}

class _AddPartsState extends State<AddParts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8FE1D7),
        title: const Text('Add Parts & Services'),
      ),
      body: Center(
        child: const Text(
          'Add parts or services here!',
          style: TextStyle(fontSize: 18),
        ),
      ),

      // Adding floating action buttons
      floatingActionButton: Stack(
        children: [
          // Floating Action Button for Appointments
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF8FE1D7),
              onPressed: () {
                // Action for navigating to the appointment screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewService()));
                print('Add service button pressed');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.calendar_today,
                size: 30,
              ),
            ),
          ),

          // Floating Action Button for "Add Spareparts"
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                // Action for adding spare parts
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Newpart()));
                print('Add Spareparts Button Pressed');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.build, // Icon representing spare parts or tools
                size: 30,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
