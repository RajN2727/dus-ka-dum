import 'package:dus_ka_dum/dus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const DusKaDumApp());
}

// class DusKaDumApp extends StatelessWidget {
//   const DusKaDumApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(child: Image.asset('assets/images/01.png', fit: BoxFit.cover)),
//           SafeArea(
//             child: Stack(
//               children: [
//                 // Left toolbar
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text("Balance: 2727"),
//                             Text("Game Id: ABDUF667S"),
//                           ],
//                         ),
//                         const SizedBox(width: 16),
//                         const Text("Draw"),
//                         const SizedBox(width: 16),
//                         const Text("07:35 PM", style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(width: 16),
//                         const Text("02:28", style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(width: 16),
//                         const Image(image: AssetImage("assets/images/question.png"), width: 32, height: 32),
//                         const SizedBox(width: 12),
//                         const Image(image: AssetImage("assets/images/page.png"), width: 32, height: 32),
//                         const SizedBox(width: 12),
//                         const Image(image: AssetImage("assets/images/cross.png"), width: 32, height: 32),
                     
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Right toolbar
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Image(image: AssetImage("assets/images/print.png"), width: 32, height: 32),
//                         SizedBox(width: 12),
//                         Image(image: AssetImage("assets/images/cancel.png"), width: 32, height: 32),
//                         SizedBox(width: 12),
//                         Image(image: AssetImage("assets/images/pati.png"), width: 32, height: 32),
//                         SizedBox(width: 12),
//                         Image(image: AssetImage("assets/images/advance.png"), width: 32, height: 32),
//                         SizedBox(width: 12),
//                         Image(image: AssetImage("assets/images/lock.png"), width: 32, height: 32),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Main content
//                 Positioned.fill(
//                   top: 64,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: isPortrait
//                           ? SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   _logoGrid(),
//                                   const SizedBox(height: 20),
//                                   _chartImage(context),
//                                 ],
//                               ),
//                             )
//                           : Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(flex: 4, child: _logoGrid()),
//                                 const SizedBox(width: 40),
//                                 _chartImage(context),
//                               ],
//                             ),
//                       ),
//                       _bottomImageLine(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _logoGrid() {
//     final rows = [
//       ['24.png', '25.png', '26.png', '27.png'],
//       ['28.png', '29.png', '30.png', '31.png'],
//       ['32.png', '33.png', '34.png', '35.png'],
      
//     ];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: rows.map((row) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 25),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: row.map((img) => _logoImage('assets/images/$img')).toList(),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _logoImage(String path) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8),
//       child: SizedBox(
//         width: 50,
//         height: 50,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(6),
//           child: Image.asset(path, fit: BoxFit.fill),
//         ),
//       ),
//     );
//   }

//   Widget _chartImage(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(12),
//       child: SizedBox(
//         width: size.width * 0.28,
//         height: size.height * 0.9,
//         child: Image.asset(
//           'assets/images/20.png',
//           fit: BoxFit.fitWidth,
//           alignment: Alignment.bottomCenter,
//         ),
//       ),
//     );
//   }

//   Widget _bottomImageLine() {
//     final bottomImages = [
//       'coin10.png', 'coin20.png', 'coin50.png',
//       'coin100.png', 'coin500.png', 'coin1000.png',
//       'total.png', 'lottery.png',
//     ];

//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 12, bottom: 8),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: bottomImages.map((img) {
//             final bool isSpecial = img == 'total.png' || img == 'lottery.png';
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 3),
//               child: SizedBox(
//                 width: isSpecial ? 80 : 50,
//                 height: isSpecial ? 80 : 50,
//                 child: Image.asset(
//                   'assets/images/$img',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
