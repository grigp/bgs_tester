part of 'bgs_list_bloc.dart';

class BgsListState{}

class BgsListInitial extends BgsListState{}

class BgsListLoaded extends BgsListState {
  BgsListLoaded({
    required this.bgsList,
  });

  final List<BgsInfo> bgsList;
}

class BgsListLoadingFailure extends BgsListState {
  BgsListLoadingFailure({
    this.exception,
  });

  final Object? exception;
}