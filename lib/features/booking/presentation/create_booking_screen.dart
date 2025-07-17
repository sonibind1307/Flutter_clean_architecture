import 'package:flutter/material.dart';

class CreateBookingPage extends StatelessWidget {
  const CreateBookingPage({super.key});

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
                      'Create',
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
                        _buildTextField('Reference Id', '221122060123'),
                        _buildDropdown('Booking Reference', ['Test']),
                        _buildDropdown('Customer Name', ['Customer1']),
                        _buildDropdown('Consultant Name', ['John Butler']),
                        _buildDropdown('Hospital Name', ['Hospital']),
                        _buildDropdown('Ward Name', ['Ward']),
                        _buildDropdown('Speciality', ['ICU']),
                        _buildDropdown('Grade Required', ['Band 3']),
                        _buildTimeField('Start Time', '11:30'),
                        _buildTimeField('End Time', '--:--'),
                        _buildDateField('Date', '22/11/2022'),
                        _buildDropdown('Break', ['Without Break']),
                        _buildTextField('Total Hours', ''),
                        _buildTextField('Purchase Order', ''),
                      ],
                    ),
                    const SizedBox(height: 30),

                    const Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _buildAmountField('AWR PAYE')),
                        const SizedBox(width: 10),
                        Expanded(child: _buildAmountField('AWR - UMBRELLA')),
                        const SizedBox(width: 10),
                        Expanded(child: _buildAmountField('NON-AWR - PAYE')),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildAmountField('NON-AWR - UMBRELLA'),
                        ),
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
        items:
            items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildTimeField(String label, String initialValue) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: TextEditingController(text: initialValue),
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.access_time),
          border: const OutlineInputBorder(),
        ),
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

  Widget _buildAmountField(String label) {
    return TextField(
      decoration: InputDecoration(
        prefixText: '£ ',
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
