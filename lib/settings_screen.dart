import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_provider.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page"),),
      body: Column(
        children: [
          SwitchListTile(
              title: Text('Dark Mode', style: TextStyle(fontSize: settingsProvider.fontSize),),
              value: settingsProvider.isDarkMode, onChanged: (bool value){
                settingsProvider.toggleDarkMode();
          }),
          Text("Font Size is: ${settingsProvider.fontSize}", style: TextStyle(fontSize:
          settingsProvider.fontSize),),
          Slider(
            min: 12.0,
            max:24.0,
            divisions: 12,
            onChanged: (double value){
              // value here refers to the surrent selected value on slider
              settingsProvider.setFontSize(value);
            },
            value:settingsProvider.fontSize,
          ),
        ],
      ),
    );
  }
}
