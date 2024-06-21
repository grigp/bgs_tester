import 'package:bgs_tester/repositories/bgs_devices/abstract_bgs_repository.dart';
import 'package:bgs_tester/repositories/bgs_devices/bgs_device_repository.dart';
import 'package:flutter/material.dart';
import 'bgs_tester_app.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractBgsRepository>(
      () => BgsDeviceRepository()
  );
  runApp(const BgsTesterApp());
}

