import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/callFunctions.dart';
import '../provider/loginprovider.dart';
import '../provider/provider.dart';
import 'login_screen.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);
    MainProvider mainProvider =
    Provider.of<MainProvider>(context, listen: false);
      mainProvider.getMakeupList();

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;



    Timer( Duration(seconds: 5), () {
      if(loginUser==null){

        callNextReplacement(context, LoginScreen());
      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/splash screen (2).png"),
                      fit: BoxFit.fill)),
            child: Center(child: Text("Belleza",style: TextStyle(fontFamily: 'Comforter',fontSize: 48,color: Colors.white),)),
          ),

        ],
      ),
    );
  }
}



