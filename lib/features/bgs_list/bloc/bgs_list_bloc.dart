
import 'package:bgs_tester/repositories/bgs_devices/abstract_bgs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/bgs_devices/models/bgs_info.dart';

part 'bgs_list_event.dart';
part 'bgs_list_state.dart';

class BgsListBloc extends Bloc<BgsListEvent, BgsListState> {
  BgsListBloc(this.bgsRepository) : super(BgsListInitial()) {
    on<LoadBgsList>((event, emit) async {
      try {
        final bgsList = await bgsRepository.getBgsList();
        emit(BgsListLoaded(bgsList: bgsList));
      } catch (e) {
        emit(BgsListLoadingFailure(exception: e));
      }
    });
  }

  final AbstractBgsRepository bgsRepository;
}