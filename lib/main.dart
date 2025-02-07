import 'package:belleza_new/provider/loginprovider.dart';
import 'package:belleza_new/provider/provider.dart';
import 'package:belleza_new/user/splash%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'Admin/requests.dart';
import 'constants/mycolor.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
// print('Handling a background message ${message.messageId}');
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>MainProvider()),
      ChangeNotifierProvider(create: (context)=>LoginProvider()),

    ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'PoetsenOne',

          colorScheme: ColorScheme.fromSeed(seedColor:cl23557),
          useMaterial3: true,
        ),
        home:Splash() ,
      ),
    );
  }
}
