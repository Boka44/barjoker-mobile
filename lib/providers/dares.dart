import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

import '../services/database.dart';
import './dare.dart';

class Dares with ChangeNotifier {
  final String userId = '1';
  Api _api = Api('dares');

  // Dares(this.userId);

  List<Dare> _dares = [
    Dare(
      id: '1',
      message: 'Do the thing',
      userId: '1',
      isDefault: true,
      type: 'dare'
    ),
    Dare(
      id: '2',
      message: 'Do the thing twice',
      userId: '1',
      isDefault: true,
      type: 'dare'
    ),
    Dare(
      id: '3',
      message: 'Eat the thing',
      userId: '1',
      isDefault: true,
      type: 'dare'
    ),
    Dare(
      id: '4',
      message: 'Success dance!',
      userId: '1',
      isDefault: true,
      type: 'success'
    ),
    Dare(
      id: '5',
      message: 'Do the success thing!',
      userId: '1',
      isDefault: true,
      type: 'success'
    ),
    Dare(
      id: '6',
      message: 'Do the success thing 27 times!',
      userId: '1',
      isDefault: true,
      type: 'success'
    ),
    Dare(
      id: '7',
      message: 'Shame! Shame! Shame!',
      userId: '1',
      isDefault: true,
      type: 'punishment'
    ),
    Dare(
      id: '8',
      message: 'Dishonor upon your family! Commit Seppuku.',
      userId: '1',
      isDefault: true,
      type: 'punishment'
    ),
    Dare(
      id: '9',
      message: 'Picard is shaking his head.',
      userId: '1',
      isDefault: true,
      type: 'punishment'
    ),
    Dare(
      id: '10',
      message: 'THIS IS NOT DEFAULT BUT CUSTOM.',
      userId: '1',
      isDefault: false,
      type: 'dare'
    ),
    Dare(
      id: '11',
      message: 'Insert custom dare here.',
      userId: '1',
      isDefault: false,
      type: 'dare'
    ),
    Dare(
      id: '12',
      message: 'Insert custom success here.',
      userId: '1',
      isDefault: false,
      type: 'success'
    ),
    Dare(
      id: '13',
      message: 'Insert custom punishment here.',
      userId: '1',
      isDefault: false,
      type: 'punishment'
    )
  ];

    
  Future<List<Dare>> fetchDares(String userId, String type) async {
    var result = await _api.getDataCollectionDaresByUserByType(userId, type);
    _dares = result.documents
        .map((doc) => Dare.fromMap(doc.data, doc.documentID))
        .toList();
    return _dares;
  }

  Future<List<Dare>> fetchDaresForGame(String userId, bool isDefaultGame) async {
    if(isDefaultGame) {
      var result = await _api.getDataCollectionDaresByDefault(true);
      _dares = result.documents
        .map((doc) => Dare.fromMap(doc.data, doc.documentID))
        .toList();
    return _dares;  
    } else {
      var result1 = await _api.getDataCollectionDaresByDefault(true);
      var result2 = await _api.getDataCollectionDaresByUser(userId);
      var merged = [...result1.documents, ...result2.documents];
      _dares = merged
        .map((doc) => Dare.fromMap(doc.data, doc.documentID))
        .toList();
        return _dares;
    }
  }

  // List<Dare> get dares {
  //   //  return _dares.where((dare) => dare.type == 'dare' && userId == dare.userId).toList();
  // }

  // List<Dare> get successes {
    
  //   return _dares.where((dare) => dare.type == 'success' && userId == dare.userId).toList();
  // }

  // List<Dare> get punishments {
  //   return _dares.where((dare) => dare.type == 'punishment' && userId == dare.userId).toList();
  // }

  // String randomDare(String type, bool isDefault, bool getDefault) {
  //   print(type + ' ' + getDefault.toString());
  //   List<Dare> _parsedList;
  //   if(isDefault) {
  //     _parsedList = _dares.where((dare) => dare.type == type && dare.isDefault).toList();
  //     print(_parsedList.length);
  //   } else if (getDefault) {
  //     _parsedList = _dares.where((dare) => (dare.type == type && userId == dare.userId) || (dare.type == type && dare.isDefault)).toList();
  //     print(_parsedList.length);
  //   } else {
  //     _parsedList = _dares.where((dare) => dare.type == type && userId == dare.userId && !dare.isDefault).toList();
  //     print(_parsedList.length);
  //   }
    
  //   // print(_parsedList);
  //   final _random = new Random();
  //   var element = _parsedList[_random.nextInt(_parsedList.length)];
  //   // print(element);
  //   return element.message;
  // }

  String randomDare(String type, bool isDefault, bool getDefault) {
    print(type + ' ' + getDefault.toString());
    List<Dare> _parsedList;
    if(isDefault) {
      _parsedList = _dares.where((dare) => dare.type == type && dare.isDefault).toList();
      print(_parsedList.length);
    } else if (getDefault) {
      _parsedList = _dares.where((dare) => (dare.type == type && userId == dare.userId) || (dare.type == type && dare.isDefault)).toList();
      print(_parsedList.length);
    } else {
      _parsedList = _dares.where((dare) => dare.type == type && userId == dare.userId && !dare.isDefault).toList();
      print(_parsedList.length);
    }
    
    // print(_parsedList);
    final _random = new Random();
    var element = _parsedList[_random.nextInt(_parsedList.length)];
    // print(element);
    return element.message;
  }

  void saveDare(String message, String type, String userId) {
    
    final Map<String, dynamic> doc = { 
        'message': message,
        'userId': userId,
        'isDefault': false,
        'type': type
    };
    _api.addDocument(doc);
    notifyListeners();
  }

  void removeDare(String id) {
    _dares.removeWhere((dare) => dare.id == id);
    notifyListeners();
  }

  void editDare(String id, String message) {
    int ind = _dares.lastIndexWhere((dare) => id == dare.id);
    _dares[ind].message = message;
    notifyListeners();
  }
}