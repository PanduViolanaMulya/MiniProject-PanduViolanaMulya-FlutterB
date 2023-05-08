import 'package:flutter/material.dart';
import 'package:mini_project/helper/result_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'result_model.dart';

class ResultDb extends ChangeNotifier {
  List<ResultModel> _resultModel = [];
  late ResultHelper _resultHelper;

  List<ResultModel> get resultModel => _resultModel;

  ResultDb() {
    _resultHelper = ResultHelper();
    _getAllResult();
  }

  void _getAllResult() async {
    _resultModel = await _resultHelper.getContact();
    notifyListeners();
    _getAllResult();
  }

  Future<void> addResult(ResultModel resultModel) async {
    await _resultHelper.insertResult(resultModel);
    _getAllResult();
  }

  Future<ResultModel> getResultByNumber(int number) async {
    return await _resultHelper.getResultByNumber(number);
  }
}
