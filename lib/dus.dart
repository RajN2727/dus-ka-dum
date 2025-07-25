// import 'package:dus_ka_dum/cancel.dart';
import 'dart:io';

import 'package:dus_ka_dum/account.dart';
import 'package:dus_ka_dum/cancel.dart';
import 'package:dus_ka_dum/reprint.dart';
import 'package:dus_ka_dum/result.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';



class DusKaDumApp extends StatelessWidget {
  const DusKaDumApp({super.key});
  @override
  Widget build(BuildContext context) {
      
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
   HomePage({super.key});
  

  @override 
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery .of(context).size.width;
    final screenheight = MediaQuery .of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/01.png', fit: BoxFit.cover)),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          
                          
                            children: const [
                             
                                const Text("Balance: 2727", style: TextStyle(fontWeight: FontWeight.bold)),
                            
                            ], 
                          ),  
                        ),
                         SizedBox(width: screenwidth*0.02,height:screenheight*0.12,),
                          const Text("Draw", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        const SizedBox(width: 16),
                        const Text("07:35 PM", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        const SizedBox(width: 20),
                        const Text("02:28", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow,fontSize: 15)),
                        const SizedBox(width: 16),
                        

                          const SizedBox(width: 8),
                        const Image(image: AssetImage("assets/images/question.png"), width: 32, height: 32),
                     GestureDetector(
                      
                  onTap: () {
                   Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) => const Account()),
                );
                  },
              child: const Image(
               image: AssetImage("assets/images/page.png"),
                   width: 32,   
    
                 height: 32,
    ),
),  
 GestureDetector(
                        onTap: () => exit(0),
                        child: const Image(
                          image: AssetImage("assets/images/cross.png"),
                          width: 32,
                          height: 32,
                        ),
 ),
                        // const SizedBox(width: 3),
                        // const Image(image: AssetImage("assets/images/cross.png"), width: 32, height: 32),
                        
                     
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 90),
                
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                        [
                     

                        GestureDetector(   
                          onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(builder:(_)=> const Cancel()));
                          },
                          child: const Image(image: AssetImage("assets/images/print.png"), width: 32, height: 32)),
                          SizedBox(width: 16,height: 20,),
                           GestureDetector(   
                          onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(builder:(_)=> const Reprint()));
                          },
                          child: const Image(image: AssetImage("assets/images/cancel.png"), width: 32, height: 32)),
                           GestureDetector(   
                          onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(builder:(_)=> const Result()));
                          },
                          child: const Image(image: AssetImage("assets/images/pati.png"), width: 32, height: 32)),
                          
                        SizedBox(width: 16,height: 20,),
                        // Image(image: AssetImage("assets/images/cancel.png"), width: 32, height: 32),
                        SizedBox(width: 12,height: 12,),
                        // Image(image: AssetImage("assets/images/pati.png"), width: 32, height: 32),
                        SizedBox(width: 12,height: 12,),
                        Image(image: AssetImage("assets/images/advance.png"), width: 32, height: 32),
                        SizedBox(width: 16,height: 16,),
                        Image(image: AssetImage("assets/images/lock.png"), width: 32, height: 32),
                        
                       
                      ],
                    ),
                  ),
                ),
                  ],
                
                ),
            
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 20),
                                _logoGrid(),     
                                 SizedBox(
                                    width: 160,
                                   ),
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  
                                     Image(image: AssetImage("assets/images/colorprint.png"), width: 65, height: 65),

                                      SizedBox(
                                    height: 20,
                                   ),
                                       Image(image: AssetImage("assets/images/redpage.png"), width: 65, height: 65),
                                   
                                  ],
                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:110 ,),
                                   Image(image: AssetImage("assets/images/br1.png"), width: 70, height: 70),
                                  //  SizedBox(
                                  //   width:40 ,),
                                  //   Image(image: AssetImage("assets/images/br2.png"), width: 50, height: 50),

                                ],
                              
                              ),
                            ),
                           
                        _bottomImageLine()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                  
                      ),
                  
                      _buildTimeResultTable()
                  
                    ],
                  ),
                )


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoGrid() {
    final rows = [
      ['24.png', '25.png', '26.png', '27.png'],
      ['28.png', '29.png', '30.png', '31.png'],
      ['32.png', '33.png', '34.png', '35.png'],
      
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows.map((row) {
        return Padding(
         padding: const EdgeInsets.only(left: 10, bottom: 30,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: row.map((img) => _logoImage('assets/images/$img')).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _logoImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 55,
        height: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(path, ),
        ),
      ),
    );
  }

 
  final List<TimeResult> _timeResults = [
    TimeResult('07:30', 8),
    TimeResult('07:25', 12),
    TimeResult('07:20', 7),
    TimeResult('07:15', 2),
    TimeResult('07:10', 2),
    TimeResult('07:05', 9),
    TimeResult('07:00', 1),
     TimeResult('06:55', 4),
    TimeResult('06:50', 1),
    TimeResult('06:45', 10),
    TimeResult('06:40', 7),
     TimeResult('06:35', 2),
    TimeResult('06:30', 8),
     TimeResult('06:25', 1),
    TimeResult('06:20', 2),
    TimeResult('06:15', 8),
    TimeResult('06:10', 7),
    
  ];

 Widget _buildTimeResultTable() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(
            headingRowHeight: 31.0,
      // dataRowMinHeight: 10.0,
      // dataRowMaxHeight: 20,
      dataRowHeight: 18.3,

      border: const TableBorder(horizontalInside: BorderSide(color: Color.fromARGB(255, 248, 244, 244)),
      verticalInside: BorderSide(color: Color.fromARGB(255, 248, 244, 244)
       ) ),
      headingRowColor: MaterialStateProperty.all(const Color.fromARGB(255, 196, 24, 47)),
      headingTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      columns: const [
        DataColumn(label: Text('TIME',style: TextStyle(color: Colors.white,fontSize: 20),)),
        DataColumn(label: Text('RESULT',style: TextStyle(color: Colors.white,fontSize: 20),)),
      ],
      rows: List.generate(_timeResults.length, (index) {
        final tr = _timeResults[index];

        // 🎨 Custom row color logic:
        Color? bg;
        if ( tr.result == 8|| tr.result == 12|| tr.result == 4) {
          bg = Colors.deepPurpleAccent[200];
        } 
        else if (  tr.result == 7||tr.result == 3||tr.result == 11) {
          bg = Colors.orange[200];
        } else if (tr.result  ==2||tr.result == 6||tr.result == 10) {
          bg = const Color.fromARGB(255, 224, 110, 163);
        } 
        else if (tr.result ==1||tr.result == 5||tr.result == 9) {
          bg = const Color.fromARGB(255, 155, 226, 133);
        }else {
          bg = index.isEven ? Colors.grey.shade100 : Colors.white;    
        }

        return DataRow.byIndex(
          index: index,
          color: MaterialStateProperty.all(bg),
          cells: [
            DataCell(Text(tr.time)),
            DataCell(Text(tr.result.toString())),
          ],
        );
      }),
    ),
  );
}



  Widget _bottomImageLine() {
    final bottomImages = [
      'coin10.png', 'coin20.png', 'coin50.png',
      'coin100.png', 'coin500.png', 'coin1000.png',
      'total.png', 'lottery.png', 
      
    ];

    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 0,),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: bottomImages.map((img) {
            final bool isSpecial = img == 'total.png' || img == 'lottery.png';
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                width: isSpecial ? 100 : 50,
                height: isSpecial ? 80 : 50,
                child: Image.asset(
                  'assets/images/$img',
                  fit: BoxFit.contain,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


class TimeResult {
  final String time;
  final int result;
  TimeResult(this.time, this.result);
}



