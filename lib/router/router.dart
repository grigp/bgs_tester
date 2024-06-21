import '../features/bgs_list/bgs_list.dart';
import '../features/bgs_device/bgs_device.dart';

final routes = {
  '/' : (context) => const BgsListScreen(title: 'Список подключенных БГС'),
  '/device' : (context) => const BgsDeviceScreen(),
};