// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:housing_society/models/radio_model.dart';

class ServiceProAvailProvider with ChangeNotifier {
  ServiceProAvail? _selectedValue;

  ServiceProAvail? get selectedValue => _selectedValue;

  setSelectedRadioTile(value) {
    _selectedValue = value;
    notifyListeners();
  }
}
