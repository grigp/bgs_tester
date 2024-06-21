import 'models/bgs_info.dart';

abstract class AbstractBgsRepository {
  Future<List<BgsInfo>> getBgsList();
}