// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:geeta_app/Controller/theme_provider.dart';
import 'package:provider/provider.dart';

import 'Controller/geeta_provider.dart';
import 'View/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeetaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bhagavad Geeta',
            themeMode: (value.isDark)
                ? ThemeMode.dark
                : ThemeMode.light,
            // themeMode: ThemeMode.dark,
            darkTheme: ThemeData.dark().copyWith(
              // Customize dark theme properties as needed
            ),
            // Light theme (you can customize this as well)
            theme: ThemeData.light().copyWith(
              // Customize light theme properties as needed
            ),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
