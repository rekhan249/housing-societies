// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:housing_society/models/radio_model.dart';

class ServiceProAvailProvider with ChangeNotifier {
  ServiceProAvail? _selectedValue;

  ServiceProAvail? get selectedValue => _selectedValue;

  setSelectedRadioTile(value) {
    _selectedValue = value;
    notifyListeners();
    print(_selectedValue!.title);
  }
}
