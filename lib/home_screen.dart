import 'package:appsettings_provider/settings_provider.dart';
import 'package:appsettings_provider/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // retrieve the settings provider
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Manage Preferences"), actions: [
        IconButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>SettingsScreen()));

        }, icon: Icon(Icons.settings))
      ],),
      body:Center(
        child: Text("Current font size: ${settingsProvider.fontSize}", style:
          TextStyle(fontSize: settingsProvider.fontSize),),
      )
    );
  }
}
