// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:diamond/features/card16/card16game/cardgamecubits/card16winner/card16winner_cubit.dart';
// import 'package:diamond/features/utils/cubit/authcubit/auth_cubit.dart';
// import 'package:diamond/features/utils/screens/game_selection.dart';
// import 'package:diamond/features/utils/screens/splash_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:process_run/stdio.dart';
// import 'package:sizer/sizer.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String systemUniqueId = '';

//   late FocusNode _usernameFocusNode = FocusNode();
//   late FocusNode _passwordFocusNode = FocusNode();
//   bool isChecked = false;

//   bool rememberme = false;

//   Future<void> getWindowsUniqueId() async {
//     final deviceInfo = DeviceInfoPlugin();
//     final windowsInfo = await deviceInfo.windowsInfo;
//     setState(() {
//       systemUniqueId = windowsInfo.deviceId;
//     });
//   }
// //  Future<void> initializeServices() async {
// //     await StorageService.initialize();
// //     await SoundManager.preloadSounds();
// //   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      final card16winnerCubit = context.read<Card16winnerCubit>();
//     getWindowsUniqueId();
//     _usernameFocusNode = FocusNode();
//     _passwordFocusNode = FocusNode();
//     //  initializeServices();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//   bool is1024768 =  size.width <= 1024 && size.height >= 768;
//     return Scaffold(
//       body: BlocConsumer<AuthCubit, AuthState>(
//         listener: (context, state) {
//           if (state is AuthLoginSuccess) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => GameSelection()),
//             );
//           }
//         },
//         builder: (context, state) {
//           final authCubit = context.read<AuthCubit>();
//           return Stack(
//             children: [
//               Container(
//                 width: width,
//                 height: height,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/login/bg.jpeg"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),

//               Positioned(
//                 top: height * 0.02,
//                 left: width * 0.01,
//                 child: Container(
//                   width: width * 0.18,
//                   height: height * 0.18,
//                   child: Image.asset(
//                     "assets/login/sai.png",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),

//               Positioned(
//                 top: height * 0.02,
//                 right: width * 0.02,
//                 child: GestureDetector(
//                   onTap: () {
//                     exit(0);
//                   },
//                   child: Container(
//                     width: width * 0.04,
//                     height: height * 0.04,
//                     child: Image.asset(
//                       "assets/login/close.png",
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),

//               Positioned(
//                 top: height * 0.14,
//                 right: width * 0.01,
//                 child: Form(
//                   key: _formKey,
//                   child: Container(
//                     width: width * 0.4,
//                     height: height * 0.7,
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/login/blackbg.png"),
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Container(
//                         //   width: double.maxFinite,
//                         //   child: Row(
//                         //     children: [
//                         //       SizedBox(width: width * 0.18),
//                         //       const Text(
//                         //         "For Amusement Only",
//                         //         style: TextStyle(
//                         //           color: Colors.white54,
//                         //           fontSize: 14,
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         // const SizedBox(height: 10),
//                         // const Text(
//                         //   "Member Login",
//                         //   style: TextStyle(
//                         //     color: Colors.white,
//                         //     fontSize: 20,
//                         //     fontWeight: FontWeight.bold,
//                         //   ),
//                         // ),
//                         // Container(
//                         //   width: width * 0.1,
//                         //   child: const Divider(
//                         //     color: Colors.white54,
//                         //     thickness: 0.2,
//                         //   ),
//                         // ),
//                         // const SizedBox(height: 18),

//                         SizedBox(
//                           width: width * 0.16,
//                           // height: 40,
//                          height:height * 0.30,
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Text(
//                                   "User Name",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15.sp,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               TextField(
//                                 focusNode: _usernameFocusNode,
//                                 controller: _usernameController,
//                                 style: const TextStyle(color: Colors.white),
//                                 decoration: InputDecoration(
//                                   hintText: "Enter name...",
//                                   hintStyle: const TextStyle(
//                                     color: Colors.white54,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.black,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.grey),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(5),
//                                     borderSide: const BorderSide(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 2),

//                         // Password Field
//                         SizedBox(
//                           width: width * 0.20,
//                             // height:height * 0.5,
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Text(
//                                   "Password",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15.sp,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               RawKeyboardListener(
//                                 focusNode: FocusNode(),
//                                 onKey: (event) {
//                                   if (event.logicalKey ==
//                                           LogicalKeyboardKey.tab ||
//                                       event.logicalKey ==
//                                           LogicalKeyboardKey.enter) {
//                                     _passwordFocusNode.requestFocus();
//                                     if (_formKey.currentState!.validate()) {
//                                       // authCubit.login("retailer", "1234", systemUniqueId);

//                                       if (_usernameController.text.isNotEmpty &&
//                                           _passwordController.text.isNotEmpty) {
//                                         try {
//                                           authCubit.login(
//                                             _usernameController.text,
//                                             _passwordController.text,
//                                             systemUniqueId,
//                                           );
//                                         } catch (e) {
//                                           print(e);
//                                         }
//                                       }
//                                     }
//                                   }
//                                 },
//                                 child: TextField(
//                                   controller: _passwordController,
//                                   style: const TextStyle(color: Colors.white),
//                                   obscureText: true,

//                                   decoration: InputDecoration(
//                                     hintText: "Enter password...",
//                                     hintStyle: const TextStyle(
//                                       color: Colors.white54,
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                     filled: true,
//                                     fillColor: Colors.black,
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(5),
//                                       borderSide: const BorderSide(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 2),

//                         // Remember Password Checkbox
//                         SizedBox(
//                           width: width * 0.06,
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Checkbox(
//                                     value: rememberme,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         rememberme = value!;
//                                       });
//                                     },
//                                     activeColor: Colors.blue,
//                                   ),
//                                   const Text(
//                                     "Remember password",
//                                     style: TextStyle(
//                                       color: Colors.green,
//                                       fontSize: 5,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               if (state is AuthSocketError)
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     state.errorMessage,
//                                     style: const TextStyle(color: Colors.red),
//                                   ),
//                                 ),
//                               if (state is AuthLoginFailure)
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     state.errorMessage,
//                                     style: const TextStyle(
//                                       color: Colors.red,
//                                       fontSize: 10,
//                                     ),
//                                   ),
//                                 ),

//                               const SizedBox(height: 15),

//                               // Login Button
//                               SizedBox(
//                                 width: double.infinity,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.red,
//                                     padding: const EdgeInsets.symmetric(
//                                       vertical: 12,
//                                     ),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(5),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     // print("@@@@@@###################3");
//                                     if (_formKey.currentState!.validate()) {
//                                       // authCubit.login("retailer", "1234", systemUniqueId);
//                                       if (_usernameController.text.isNotEmpty &&
//                                           _passwordController.text.isNotEmpty) {
//                                         try {
//                                           authCubit.login(
//                                             _usernameController.text,
//                                             _passwordController.text,
//                                             systemUniqueId,
//                                           );
//                                         } catch (e) {
//                                           print(e);
//                                         }
//                                       }
//                                     }
//                                   },
//                                   child:
//                                       state is AuthLoading
//                                           ? CupertinoActivityIndicator(
//                                             radius: 10,
//                                             color: Colors.white,
//                                           )
//                                           : const Text(
//                                             "Login",
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 5,
//                                             ),
//                                           ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(height: 10),

//                         // Sign Up Link
//                         // RichText(
//                         //   text: const TextSpan(
//                         //     text: "New User? ",
//                         //     style: TextStyle(color: Colors.white),
//                         //     children: [
//                         //       TextSpan(
//                         //         text: "Sign up Here",
//                         //         style: TextStyle(
//                         //           color: Colors.red,
//                         //           fontWeight: FontWeight.bold,
//                         //         ),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//         is1024768?   Positioned(
//                 top: height * 0.19,
//                 left: width * 0.02,
//                 child: Container(
//                   width: width * 0.53,
//                   height: height * 0.66,

//                   // padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/login/2.png"),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               )    : Positioned(
//                 top: height * 0.19,
//                 left: width * 0.08,
//                 child: Container(
//                   width: width * 0.53,
//                   height: height * 0.66,

//                   // padding: EdgeInsets.all(20),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/login/2.png"),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: height * 0.02,
//                 left: width * 0.01,
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         "assets/login/18plus.png",
//                         fit: BoxFit.cover,
//                         width: 80,
//                       ),
//                       Container(
//                         width: 150,
//                         decoration: BoxDecoration(
//                           color: Colors.black87.withOpacity(0.5),
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: Text(
//                           textAlign: TextAlign.center,
//                           "For Amusement Only",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
