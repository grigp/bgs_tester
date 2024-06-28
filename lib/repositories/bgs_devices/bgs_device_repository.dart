
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:bgs_tester/repositories/bgs_devices/bgs_devices.dart';

class BgsDeviceRepository implements AbstractBgsRepository {
  BgsDeviceRepository();

  @override
  Future<List<BgsInfo>> getBgsList() async {
    List<BgsInfo> bgsList = [];

    final data = await rootBundle.loadString("assets/bgs_default.json");

    // final all = await json.decode(data.toString()).toString();
    // const all = "Привет!";
    // File file = File("bgs_list.json");
    // await file.writeAsString(all);

    try {

      final arrBgs = await json.decode(data.toString())['bgs'];
      arrBgs.forEach((e) {
        bgsList.add(BgsInfo.fromJson(e));
      });

    } on Exception catch (error, stacktrace) {
      print("Exception: $error StackTrace: $stacktrace");
    }

    return bgsList;
  }
}