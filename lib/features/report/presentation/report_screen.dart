import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top bar
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blueGrey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Welcome Test8719!'),
                Icon(Icons.notifications_none),
              ],
            ),
          ),

          // Main
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reports',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Welcome to your Pluto Software admin dashboard. Here you can get an overview of your account activity...',
                  ),
                  const SizedBox(height: 20),

                  // Filters
                  Row(
                    children: [
                      _buildDateField('Start Date'),
                      const SizedBox(width: 10),
                      _buildDateField('End Date'),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(child: Text('Alpha'), value: 'Alpha'),
                            DropdownMenuItem(child: Text('Xavier'), value: 'Xavier'),
                          ],
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            labelText: 'Customer Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        onPressed: () {},
                        child: const Text('SEARCH'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        onPressed: () {},
                        child: const Text('RESET'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                        onPressed: () {},
                        child: const Text('DOWNLOAD'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Table
                  Expanded(
                    child: SingleChildScrollView(
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Id')),
                          DataColumn(label: Text('Customer Name')),
                          DataColumn(label: Text('Hospital Name')),
                          DataColumn(label: Text('Ward Name')),
                          DataColumn(label: Text('Grade')),
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Shift Time')),
                          DataColumn(label: Text('')),
                        ],
                        rows: List.generate(
                          10,
                              (index) => DataRow(
                            cells: [
                              DataCell(Text('${index + 1}')),
                              const DataCell(Text('Xavier')),
                              const DataCell(Text('Xavier\'s')),
                              const DataCell(Text('001')),
                              const DataCell(Text('Band 3')),
                              const DataCell(Text('07-01-2022')),
                              const DataCell(Text('07:30 - 20:30')),
                              DataCell(
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                                  onPressed: () {},
                                  child: const Text('View'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(String label) {
    return SizedBox(
      width: 150,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
