import 'package:flutter/material.dart';

void main() => runApp(const Cancel());

class Cancel extends StatelessWidget {
  const Cancel({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const TablePage(), debugShowCheckedModeBanner: false);
  }
}

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  final List<Map<String, dynamic>> rows = const [
    {
      'sr': 1,
      'ticketId': 'T123',
      'drawDate': '2025-06-25',
      'drawTime': '08:30',
      'points': 50,
    },
    // Add more row maps here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CANCEL'), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.green),
          headingTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          columns: const [
            DataColumn(label: Text('Sr.No')),
            DataColumn(label: Text('Ticket Id')),
            DataColumn(label: Text('Draw Date')),
            DataColumn(label: Text('Draw Time')),
            DataColumn(label: Text('Total Points')),
            DataColumn(label: Text('Action')),
           

          ],
          rows: rows.map((data) {
            return DataRow(cells: [
              DataCell(Text(data['sr'].toString())),
              DataCell(Text(data['ticketId'])),
              DataCell(Text(data['drawDate'])),
              DataCell(Text(data['drawTime'])),
              DataCell(Text(data['points'].toString())),
              DataCell(
                ElevatedButton(
                  onPressed: () {
                    // Action logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cancel ticket ${data['ticketId']}')),
                    );
                  },
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Button color
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ]);               
          }).toList(),
        ),
      ),
    );
  }
}
