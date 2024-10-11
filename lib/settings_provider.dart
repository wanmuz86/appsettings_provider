import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// THis is my Provider / I will extend ChangeNotifier
// I will notifyListener for every change in the state
class SettingsProvider extends ChangeNotifier {

  // the two states managed by the Provider
  bool _isDarkMode = false;
  double _fontSize = 16.0;

  // Getter for isDarkMode and fontSize
  // The views/screens will have access to this
 git

  Future<void> _loadPreferences() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // There are three ways to work with Nullable value / Optional  "?'
    // if else (The value might be null or not)
    // ! (You are sure the value will not be null.. ) / Force unwrap
    // ?? // If / otherwise // <condition and true value> ?? <null value>
    // null aware operation
    // <condition>? <if true> : <else>
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _fontSize = prefs.getDouble('fontSize') ?? 16.0;
    notifyListeners();
  }


  // ToggleDarkMode
// Change the state from _isDarkMode to !isDarkMode
// Save the selection in SharedPreference
// notifyListener
// When you create a function that will call an asyncrronous process
// You need to indicate that the function is Asynchronous Future
  // <void> refer to returned Data Type
Future<void> toggleDarkMode()  async {
  // If there is await within the function
  // You need to add async at the nearest function {}
  _isDarkMode =  !isDarkMode;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDarkMode', _isDarkMode);
  notifyListeners();
}


  // setFontSize
 // set the State _fontSize to user's selected Font Size
// Save the selection in SharedPref
//notifyListener
Future<void> setFontSize(double size) async {
  _fontSize = size;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('fontSize', size);
  notifyListeners();
}

}