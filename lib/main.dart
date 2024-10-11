import 'package:appsettings_provider/home_screen.dart';
import 'package:appsettings_provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context)=>SettingsProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: settingsProvider.isDarkMode  ? ThemeData.dark(): ThemeData.light() ,
      home: HomeScreen(),
    );
  }
}
