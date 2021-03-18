// import 'dart:io';
//
// import 'package:avatar_glow/avatar_glow.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:freedo/SecondPage.dart';
// import 'package:freedo/delayed_animation.dart';
// import 'package:freedo/services12/signin.dart';
// import 'package:freedo/services12/shared_preferences.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'home.dart';
// String useremail;
//
//
// class FirstPage extends StatefulWidget {
//   static const String id = 'FirstPage';
//   @override
//   _Page1 createState() => _Page1();
// }
//
// class _Page1 extends State<FirstPage> with SingleTickerProviderStateMixin {
//
//   bool isUserSignedIn = false;
//   final int delayedAmount = 500;
//   double _scale;
//   AnimationController _controller;
//   String uid;
//
//   getUid() async {
//     uid = await SharedPreferencesUtil.getUserUid();
//   }
//
//   @override
//   void initState()  {
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(
//         milliseconds: 200,
//       ),
//       lowerBound: 0.0,
//       upperBound: 0.1,
//     )..addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//
//   // AuthService _auth = AuthService();
//   @override
//   Widget build(BuildContext context) {
//
//
//     final color = Colors.white;
//     _scale = 1 - _controller.value;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           backgroundColor:Colors.deepPurple,
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(height: 30.0,),
//                 AvatarGlow(
//                   endRadius: 90,
//                   duration: Duration(seconds: 2),
//                   glowColor: Colors.white,
//                   repeat: true,
//                   repeatPauseDuration: Duration(seconds: 2),
//                   startDelay: Duration(seconds: 1),
//                   child: Material(
//                       elevation: 2.0,
//                       shape: CircleBorder(),
//                       child: CircleAvatar(
//                         backgroundColor: Colors.deepPurple,
//                         child: Image(
//                           image:AssetImage('images/freedo.png'),
//                         ),
//                         radius: 30.0,
//                       )),
//                 ),
//                 DelayedAnimation(
//                   child: Text(
//                     "Freedo",
//                     style: TextStyle(
//                         fontFamily: 'Amatic SC' ,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 55.0,
//                         color: color),
//                   ),
//                   delay: delayedAmount + 2000,
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 DelayedAnimation(
//                   child: Text(
//                     "Empowerment",
//                     style: TextStyle(fontSize: 35.0,
//                         fontFamily: 'Amatic SC',
//                         fontWeight: FontWeight.bold,
//                         color: color),
//                   ),
//                   delay: delayedAmount + 3000,
//                 ),
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 DelayedAnimation(
//                   child: GestureDetector(
//                     onTapDown: _onTapDown,
//                     onTapUp: _onTapUp,
//                     child: Transform.scale(
//                       scale: _scale,
//                       child: _animatedButtonUI,
//                     ),
//                   ),
//                   delay: delayedAmount + 4000,
//                 ),
//                 SizedBox(height: 20.0,),
//                 DelayedAnimation(
//                   child: RaisedButton(
//                     onPressed: () async {
//                       signInWithGoogle().whenComplete(() => {
//                         getUid(),
//                       Navigator.pushNamed(
//                       context,Home.id)
//                       });
//                     },
//                    color: Colors.deepPurple,
//                     child: Text(
//                       "I Already have An Account".toUpperCase(),
//                       style: TextStyle(
//                           fontFamily: 'Amatic SC',
//                           fontSize: 25.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                   delay: delayedAmount + 5000,
//                 ),
//               ],
//             ),
//           )
//         //  Column(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: <Widget>[
//         //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
//         //     SizedBox(
//         //       height: 20.0,
//         //     ),
//         //      Center(
//
//         //   ),
//         //   ],
//
//         // ),
//       ),
//     );
//   }
//
//   Widget get _animatedButtonUI => Container(
//       height: 50,
//       width: 270,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100.0),
//         color: Colors.white,
//       ),
//       child:
//       Row(
//         children: [
//           SizedBox(width: 60.0,),
//           FlatButton(
//             // onPressed: () async {
//             //   bool result = await _auth.signInGoogle();
//             //   if (result != false) {
//             //     getUid();
//             //     Navigator.pushNamed(
//             //         context,Home.id);
//             //   } else {
//             //     print('error occured');
//             //   }
//             // },
//             onPressed: () async {
//               signInWithGoogle().whenComplete(() {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return Home();
//                     },
//                   ),
//                 );
//               });
//             },
//             child: Text(
//               'Sign In with ',
//               style: TextStyle(
//                 fontFamily: 'Amatic SC',
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.indigo,
//               ),
//             ),
//           ),
//           SizedBox(width: 30,),
//           Image(
//             image: AssetImage('images/google.png'),
//             alignment: Alignment.topLeft,
//           )
//         ],
//       )
//
//   );
//
//   void _onTapDown(TapDownDetails details) {
//     _controller.forward();
//   }
//
//   void _onTapUp(TapUpDetails details) {
//     _controller.reverse();
//   }
// }
//
// // Future<FirebaseUser> signInWithGoogle() async {
// //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
// //   final GoogleSignInAuthentication googleSignInAuthentication =
// //   await googleSignInAccount.authentication;
// //
// //   final AuthCredential credential = GoogleAuthProvider.getCredential(
// //     accessToken: googleSignInAuthentication.accessToken,
// //     idToken: googleSignInAuthentication.idToken,
// //   );
// //
// //   final AuthResult authResult =
// //   await _firebaseAuth.signInWithCredential(credential);
// //   final FirebaseUser user = authResult.user;
// //
// //   final FirebaseUser currentUser = await _firebaseAuth.currentUser();
// //   if (currentUser != null) {
// //     final QuerySnapshot result = await Firestore.instance
// //         .collection('users')
// //         .where("id", isEqualTo: currentUser.uid)
// //         .getDocuments();
// //     final List<DocumentSnapshot> document = result.documents;
// //     if (document.length == 0) {
// //       Firestore.instance
// //           .collection('users')
// //           .document(currentUser.uid)
// //           .setData({
// //         'id': currentUser.uid,
// //         'useremail': currentUser.email,
// //       });
// //     } else {}
// //   }
// //   return user;
// // }
//
