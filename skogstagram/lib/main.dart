import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monogramv2/responsive/mobile_screen_layout.dart';
import 'package:monogramv2/responsive/responsive_layout_screen.dart';
import 'package:monogramv2/responsive/web_screen_layout.dart';
import 'package:monogramv2/screens/login_screen.dart';
import 'package:monogramv2/screens/signup_screen.dart';
import 'package:monogramv2/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBdL14vvmtvNNfN3ABKI6sm4JH9ZUCOG-M',
          appId: '1:145966630283:web:4b4f63ed20875af8039b8e',
          messagingSenderId: '145966630283',
          projectId: 'monogram2',
      storageBucket: 'monogram2.appspot.com'),
    );
  }else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SignUpScreen(),
      //home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),),
    );
  }
}



