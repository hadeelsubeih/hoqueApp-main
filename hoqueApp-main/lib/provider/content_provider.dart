import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/form_data.dart';
import '../models/home.dart';

class ContentProvider with ChangeNotifier {
  // List<Task> _task = [];
  String formType = 'Form for Events';

  setFormType(String type) {
    formType = type;
    notifyListeners();
  }

  getFormType() {
    return formType;
  }

  List<FormDate> loadedFormDate = [];

  Future<void> addForm({
    String? state,
    City,
    rooms,
    dropDwon4,
    Duration,
    paymentMethod,
    country,
    note1,
    note2,
    phoneNumber,
  }) async {
    print('formType$formType');

    final url = Uri.parse(
        'https://projectlab2-a5e52.firebaseio.com/form/$clickedContent/$formType.json');
    try {
      final value = await http.post(
        url,
        body: json.encode({
          "state": state,
          "City": City,
          "rooms": rooms,
          "dropDwon4": dropDwon4,
          "Duration": Duration,
          "paymentMethod": paymentMethod,
          "country": clickedContent,
          "note1": note1,
          "phoneNumber": phoneNumber,
          "note2": note2,
          "formType": formType,
        }),
      );

      notifyListeners();
    } catch (onError) {
      print(onError);
      throw onError;
    }
  }

  Future<List<FormDate>> getContent() async {
    print('formType$formType');
    final url = Uri.parse(
        'https://projectlab2-a5e52.firebaseio.com/form/$clickedContent/$formType.json');
    try {
      final value = await http.get(url);
      final extractedData = json.decode(value.body) as Map<String, dynamic>;
      print("extractedData$extractedData");
      loadedFormDate.clear();

      extractedData.forEach((taskId, taskData) {
        loadedFormDate.add(FormDate(
          id: taskId,
          state: taskData['state'],
          City: taskData['City'],
          rooms: taskData['rooms'],
          dropDwon4: taskData['dropDwon4'],
          Duration: taskData['Duration'],
          paymentMethod: taskData['paymentMethod'],
          country: taskData['country'],
          note1: taskData['note1'],
          note2: taskData['note2'],
          phoneNumber: taskData['phoneNumber'],
          formType: taskData['formType'],
        ));
      });
      print("loadedFormDate ${loadedFormDate.length}");
      notifyListeners();

      return loadedFormDate;
    } catch (onError) {
      print(onError);
      throw onError;
    }
  }

  Future<void> addFormAds(
      {String? state,
      City,
      rooms,
      dropDwon4,
      Duration,
      paymentMethod,
      country,
      note1,
      note2,
      phoneNumber,
      imageUrl}) async {
    print('formType$formType');

    final url = Uri.parse(
        'https://projectlab2-a5e52.firebaseio.com/form/$clickedContent/$formType.json');
    try {
      final value = await http.post(
        url,
        body: json.encode({
          "state": state,
          "City": City,
          "rooms": rooms,
          "dropDwon4": dropDwon4,
          "Duration": Duration,
          "paymentMethod": paymentMethod,
          "country": clickedContent,
          "note1": note1,
          "phoneNumber": phoneNumber,
          "note2": note2,
          "imageUrl": imageUrl,
          "formType": formType,
        }),
      );

      notifyListeners();
    } catch (onError) {
      print(onError);
      throw onError;
    }
  }
}
