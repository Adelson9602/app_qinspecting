import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

import 'package:app_qinspecting/providers/providers.dart';

import 'services/services.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => UiProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginService(),
      ),
      ChangeNotifierProvider(
        create: (_) => InspeccionProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => PerfilFormProvider(),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const LoadHomeScreen(),
        'profile': (_) => const ProfileScreen(),
        'inspeccion': (_) => const ScaffoldInspeccionScreen(),
        'signature': (_) => const SignatureScreen(),
      },
    );
  }
}
