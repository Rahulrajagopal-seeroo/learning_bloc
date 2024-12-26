import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rahul_bloc_login/features/auth/bloc/auth_bloc.dart';
import 'package:rahul_bloc_login/pages/screens/home_screen.dart';
// import 'package:rahul_bloc_login/features/auth/screen/login_page.dart';

import 'controller/chart_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ChartController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'BLoC Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        // home: const LoginPage(),
        home: const HomeScreen(),
      ),
    );
  }
}
