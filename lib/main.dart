import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maplogix/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //to ensure native code is readdy
  await Firebase.initializeApp();

  runApp(
    MyApp(appRouter: AppRouter()),
  ); //Anoynimos Object  -> AppRouter x=new AppRouter()
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
