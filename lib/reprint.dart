import 'package:flutter/material.dart';

// void main() => runApp(const ReprintTableScreen());

class Reprint extends StatelessWidget {
  const Reprint({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReprintTableScreen(),
    );
  }
}

class ReprintTableScreen extends StatelessWidget {
  const ReprintTableScreen({super.key});

  final List<Map<String, dynamic>> ticketData = const [
    {'sr': 1, 'ticketId': '39823435', 'date': '24-06-2025', 'time': '04:45 PM', 'points': 10},
    {'sr': 2, 'ticketId': '24418042', 'date': '24-06-2025', 'time': '03:15 PM', 'points': 500},
    {'sr': 3, 'ticketId': '68994805', 'date': '24-06-2025', 'time': '03:15 PM', 'points': 500},
    {'sr': 4, 'ticketId': '71715236', 'date': '24-06-2025', 'time': '10:55 AM', 'points': 80},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C154B),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text("REPRINT", style: TextStyle(color: Colors.black))),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed:() => Navigator.of(context).maybePop(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.green),
              headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              dataRowColor: MaterialStateProperty.all(Colors.white),
              border: TableBorder.all(color: Colors.white),
              columns: const [
                DataColumn(label: Text('Sr.No')),
                DataColumn(label: Text('Ticket Id')),
                DataColumn(label: Text('Draw Date')),
                DataColumn(label: Text('Draw Time')),
                DataColumn(label: Text('Total Points')),
                DataColumn(label: Text('Action')),
              ],
              rows: ticketData.map((row) {
                return DataRow(
                  cells: [
                    DataCell(Text(row['sr'].toString())),
                    DataCell(Text(row['ticketId'])),
                    DataCell(Text(row['date'])),
                    DataCell(Text(row['time'])),
                    DataCell(Text(row['points'].toString())),
                    DataCell(Container(
                      color: const Color(0xFFB59C00),
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Reprint ticket ${row['ticketId']}')),
                          );
                        },
                        child: const Text("REPRINT", style: TextStyle(color: Colors.white)),
                      ),
                    )),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
