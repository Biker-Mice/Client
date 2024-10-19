import 'package:flutter/material.dart';

class Newpart extends StatefulWidget {
  const Newpart({super.key});

  @override
  State<Newpart> createState() => _NewpartState();
}

class _NewpartState extends State<Newpart> {
  // Controllers for form fields
  final _partNameController = TextEditingController();
  final _unitPriceController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _partNameController.dispose();
    _unitPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Part'),
        backgroundColor: const Color(0xFF8FE1D7),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form key for validation
          child: Column(
            children: [
              // Part Name input
              TextFormField(
                controller: _partNameController,
                decoration: const InputDecoration(
                  labelText: 'Part Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the part name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Unit Price input
              TextFormField(
                controller: _unitPriceController,
                decoration: const InputDecoration(
                  labelText: 'Unit Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Numeric input for price
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the unit price';
                  }
                  // Check if the value is a valid number
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, do something like submitting the data
                    String partName = _partNameController.text;
                    double unitPrice = double.parse(_unitPriceController.text);

                    print('Part Name: $partName');
                    print('Unit Price: $unitPrice');

                    // Clear the fields after submission
                    _partNameController.clear();
                    _unitPriceController.clear();

                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Part added successfully!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40, 
                    vertical: 15
                  ),
                ),
                child: const Text(
                  'Add Part',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
