import 'package:bgs_tester/features/bgs_list/bloc/bgs_list_bloc.dart';
import 'package:bgs_tester/features/bgs_list/widgets/bgs_tail.dart';
import 'package:bgs_tester/repositories/bgs_devices/abstract_bgs_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class BgsListScreen extends StatefulWidget {
  const BgsListScreen({super.key, required this.title});
  
  final String title;

  @override
  State<BgsListScreen> createState() => _BgsListScreenState(); 
}

class _BgsListScreenState extends State<BgsListScreen> {
  final _bgsListBloc = BgsListBloc(GetIt.I<AbstractBgsRepository>());

  @override
  void initState() {
    _bgsListBloc.add(LoadBgsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.arrow_back),
      ),
      body: BlocBuilder<BgsListBloc, BgsListState>(
        bloc: _bgsListBloc,
        builder: (context, state) {
           if (state is BgsListLoaded) {
             return ListView.separated(
               padding: const EdgeInsets.only(top: 16),
               itemCount: state.bgsList.length,
               separatorBuilder: (context, i) => const Divider(),
               itemBuilder: (context, i) {
                 final bgs = state.bgsList[i];
                 return BgsTail(bgs: bgs);
               },
             );
           }
           if (state is BgsListLoadingFailure) {
             print(state.exception);
             return const Center(
               child: Text('Не удалось получить список устройств'),
             );
           }
           return const Center(child: CircularProgressIndicator(),);
        },
      ),
      // body: ListView.separated(
      //     itemBuilder: itemBuilder,
      //     separatorBuilder: separatorBuilder,
      //     itemCount: itemCount
      // ),
    );
    
  }


}