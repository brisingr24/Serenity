import 'package:envision/screens/splash.dart';
import 'package:envision/screens/verifyscreen.dart';
import 'package:envision/sevices/auth.dart';
import 'package:envision/sevices/pageHost.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'models/userModel.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: UserModel(),
      child: MaterialApp(
        home: Splash(),
        routes: {
          '/pagehost': (context) => PageHost(),
        },
        localizationsDelegates: [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en', 'IN')],
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }
}
