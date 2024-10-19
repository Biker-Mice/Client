import 'package:flutter/material.dart';

class NewService extends StatefulWidget {
  const NewService({super.key});

  @override
  State<NewService> createState() => _NewServiceState();
}

class _NewServiceState extends State<NewService> {
  // Controllers for form fields
  final _serviceNameController = TextEditingController();
  final _serviceChargeController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _serviceNameController.dispose();
    _serviceChargeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Service'),
        backgroundColor: const Color(0xFF8FE1D7),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Form key for validation
          child: Column(
            children: [
              // Service Name input
              TextFormField(
                controller: _serviceNameController,
                decoration: const InputDecoration(
                  labelText: 'Service Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Service Charge input
              TextFormField(
                controller: _serviceChargeController,
                decoration: const InputDecoration(
                  labelText: 'Service Charge',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Numeric input for price
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service charge';
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
                    String serviceName = _serviceNameController.text;
                    double serviceCharge = double.parse(_serviceChargeController.text);

                    print('Service Name: $serviceName');
                    print('Service Charge: $serviceCharge');

                    // Clear the fields after submission
                    _serviceNameController.clear();
                    _serviceChargeController.clear();

                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Service added successfully!')),
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
                  'Add Service',
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
