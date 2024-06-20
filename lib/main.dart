import 'package:car_trainer_application/features/auth/bloc/menu_selection/menu_name_bloc.dart';
import 'package:car_trainer_application/features/auth/presentation/login_screen.dart';
import 'package:car_trainer_application/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return

        //  MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   title: 'Car - Trainer',
        //   theme: ThemeData(
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //     useMaterial3: true,
        //   ),
        //   home: const SplashScreen(),
        // );

        MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MenuNameBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car - Trainer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
