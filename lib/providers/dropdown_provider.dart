// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GenderDropDownProvider with ChangeNotifier {
  List<String> _genderList = ['Male', 'Female', 'Other'];
  String? _selectedGender;

  List<String> get genderList => _genderList;
  String? get selectedGender => _selectedGender;

  void selectGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }
}

class CityCountryDropDownProvider with ChangeNotifier {
  List<String> _countryList = [
    'Pakistan',
    'India',
    'Bangladesh',
    'SriLanka',
  ];
  List<List<String>> _cityList = [
    ['Islamabad', 'Lahore', 'Karachi', 'Balochistan', 'Peshawar'],
    ['Dehli', 'Chenni', 'Dalarkot', 'Kolkata', 'PhatanKot'],
    ['Dhaka', 'Chittagong', 'Khulna', 'Rajshahi', 'Sylhet'],
    ['Colombo', 'Kandy', 'Galle', 'Jaffna', 'Anuradhapura'],
  ];
  String? _selectedCountry;
  String? _selectedCity;
  late Map<String, List<String>> _selectedDesireCities = {
    'Pakistan': _cityList[0],
    'India': _cityList[1],
    'Bangladesh': _cityList[2],
    'SriLanka': _cityList[3],
  };

  List<String> get countryList => _countryList;
  String? get selectedCountry => _selectedCountry;
  List<List<String>>? get cityList => _cityList;
  String? get selectedCity => _selectedCity;
  Map<String, List<String>> get selectedDesireCities => _selectedDesireCities;

  void selectCountry(String value) {
    if (value != _selectedCountry) _selectedCity = null;
    _selectedCountry = value;

    notifyListeners();
  }

  void selectCity(String value) {
    _selectedCity = value;
    notifyListeners();
  }
}
