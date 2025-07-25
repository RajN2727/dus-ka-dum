import 'package:flutter/material.dart';

void main() {
  runApp(const Result());
}

class Result extends StatelessWidget {
  const Result({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class TimeRowData {
  final String date;
  final int play;
  final int win;
  final int point;
  TimeRowData(this.date, this.play, this.win, this.point);
}

class HomePage extends StatelessWidget {
  static final List<TimeRowData> _rows = [
    TimeRowData('2025-06-24', 80, 0, 80),
    // add more rows...
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A0E4F), Color(0xFF781847)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Controls
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Counter Sale')),
                    const SizedBox(width: 8),
                    ElevatedButton(onPressed: () {}, child: const Text('Net Tot Pay')),
                    const Spacer(),
                    ElevatedButton(onPressed: () {}, child: const Text('Submit')),
                    const SizedBox(width: 8),
                    ElevatedButton(onPressed: () {}, child: const Text('Cancel')),
                    const SizedBox(width: 8),
                    ElevatedButton(onPressed: () {}, child: const Text('Print')),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Table + Details Panel
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      // 📊 DataTable Panel
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              headingRowColor: MaterialStateProperty.all(const Color(0xFF620E6A)),
                              headingTextStyle:
                                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              dataRowColor:
                                  MaterialStateProperty.all(Colors.white12),
                              border: TableBorder.all(color: Colors.white24),
                              columns: const [
                                DataColumn(label: Text('Sr.No')),
                                DataColumn(label: Text('Date')),
                                DataColumn(label: Text('Play')),
                                DataColumn(label: Text('Win')),
                                DataColumn(label: Text('Point')),
                              ],
                              rows: List.generate(_rows.length, (i) {
                                final r = _rows[i];
                                return DataRow(cells: [
                                  DataCell(Text('${i + 1}')),
                                  DataCell(Text(r.date, style: const TextStyle(color: Colors.lightBlue))),
                                  DataCell(Text('${r.play}')),
                                  DataCell(Text('${r.win}')),
                                  DataCell(Text('${r.point}')),
                                ]);
                              }),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // ℹ️ Detail Panel
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Game Id: 10kaDum', style: TextStyle(color: Colors.white)),
                              const SizedBox(height: 8),
                              const Text('Counter Sale', style: TextStyle(color: Colors.white)),
                              const SizedBox(height: 8),
                              const Text('Retailer Code: retailer', style: TextStyle(color: Colors.white)),
                              const SizedBox(height: 8),
                              const Text('2025‑06‑24 To 2025‑06‑24', style: TextStyle(color: Colors.white)),
                              const Divider(color: Colors.white54),
                              const SizedBox(height: 8),
                              _detailRow('Play', '80'),
                              const Divider(color: Colors.white54),
                              _detailRow('Win', '0'),
                              const Divider(color: Colors.white54),
                              _detailRow('Outstanding', '80.0'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
