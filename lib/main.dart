import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:daily_coffee/Wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'Services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: GlobalLoaderOverlay(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xffc97846),
            textTheme: TextTheme(
              bodyText2: TextStyle(
                color: const Color(0xccffffff),
              ),
            ),
            scaffoldBackgroundColor: const Color(0xff0c1015),
          ),
          home: LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: Container(
                width: 900,
                height: 900,
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x990c1015),
                      ),
                      child: Center(
                        child: Image(
                          image: AssetImage(
                              'assets/Cade-loading-outlined-400.gif'),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            overlayOpacity: 0.0,
            // overlayColor: Color(0xff0c1015),
            child: Wrapper(),
          ),
        ),
      ),
    );
  }
}
