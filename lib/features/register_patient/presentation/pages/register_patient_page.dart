import 'package:flutter/material.dart';

class RegisterPatientPage extends StatelessWidget {
  const RegisterPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blueGrey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Welcome StarOrganisation!'),
                Icon(Icons.notifications_none),
              ],
            ),
          ),

          // Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Register Patient',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildTextField('First Name', 'Soni'),
                        _buildTextField('Last Name', 'Bind'),
                        _buildDateField('Date of Birth', ''),
                        _buildTextField('Age', ''),
                        _buildDropdown('Gender', ['Male', 'Female', 'Other']),
                        _buildTextField('Mobile', ''),
                        _buildTextField('Email', ''),
                        _buildDropdown('Referred by Doctor', [
                          'Doctor A',
                          'Doctor B'
                        ]),
                        _buildDropdown('Consultant', [
                          'Consultant X',
                          'Consultant Y'
                        ]),
                        _buildDropdown('Test List', [
                          'Test 1',
                          'Test 2',
                          'Test 3'
                        ]),

                        _buildTextField('Total Amount', ''),
                        _buildTextField('Paid Amount', ''),
                        _buildTextField('Balance Amount (Auto)', ''),
                        _buildTextField('Discount (INR or %)', ''),
                        _buildTextField('Other Amount', ''),
                        _buildTextField('Remark', ''),
                      ],
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('CANCEL'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('SAVE & CONFIRM'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('SAVE & ADD ANOTHER'),
                        ),
                      ],
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

  Widget _buildTextField(String label, String initialValue) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items) {
    return SizedBox(
      width: 250,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildDateField(String label, String initialValue) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
