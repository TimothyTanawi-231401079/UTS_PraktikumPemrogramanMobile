import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/dummy_data.dart';

class AppStateProvider extends ChangeNotifier {
  String? _nama;
  List<String> _pilihan = [];

  List<String> get pilihan => _pilihan;
  String? get nama => _nama;
  int index = 0;

  Future<void> setNama(String input) async {
    _nama = input;
    await _load();
    notifyListeners();
  }

  void setIndex(String id) {
    index = int.parse(id);
  }

  Future<void> _load() async {
    if (_nama == null) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      _pilihan = prefs.getStringList(_nama!) ?? List.filled(6, '');
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading data for $_nama: $e');
      _pilihan = List.filled(6, '');
    }
  }

  Future<void> _save() async {
    if (_nama == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_nama!, _pilihan);
    } catch (e) {
      debugPrint('Error saving data for $_nama: $e');
    }
  }

  bool isSelected() {
    return _pilihan[index] != '';
  }


  void toggleJawaban(String jawaban) {
    if (_pilihan[index] == '') {
      add(jawaban);
    } else if (_pilihan[index] != jawaban){
      remove();
      add(jawaban);
    }
  }

  void add(String jawaban) {
    _pilihan[index] = jawaban;
    _save();
    notifyListeners();
  }

  void remove() {
    _pilihan[index] = '';
    _save();
    notifyListeners();
  }

  int nilai(){
    int i = 0;
    int count = 0;
    while(i < 5){
      if (_pilihan[i + 1] == DummyData.daftar[i].jawaban){
        count++;
      }
      i++;
    }
    return count * 20;
  }
}
