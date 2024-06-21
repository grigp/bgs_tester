import 'package:bgs_tester/repositories/bgs_devices/bgs_devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BgsDeviceScreen extends StatefulWidget {
  const BgsDeviceScreen({super.key});

  @override
  State<BgsDeviceScreen> createState() => _BgsDeviceScreenState();
}

class _BgsDeviceScreenState extends State<BgsDeviceScreen> {
  //String? bgsName;
  BgsInfo? bgs;
  int _startPower = 0;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is BgsInfo, 'Needed BgsInfo args');
//    assert(args != null && args is String, 'Needed string args');
    // bgsName = args as String;
    bgs = args as BgsInfo;
    _startPower = (bgs as BgsInfo).startPower!;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(title: Text((bgs as BgsInfo).name ?? '...')),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text('Первый параметр'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('press me')
                )
              ],
            ),
            Row(
              children: [
                const Text('Начальная мощность : '),
                Text('$_startPower'),
                CupertinoSlider(
                  key: const Key('slider'),
                  value: _startPower as double,//(bgs as BgsInfo).startPower! as double,
                  min: 1,
                  max: 5,
//                  divisions: 1,
                  onChanged: (double value) {
                    setState(() {
                      print(value as int);
                      _startPower = value as int;
                      //(bgs as BgsInfo).startPower = value as int?;

                    });
                  }
                )
              ],
            ),
            Row(
              children: [
                const Text('Третий параметр'),
                CupertinoSwitch(
                    value: true,
                    activeColor: CupertinoColors.activeBlue,
                    onChanged: (bool? value) {
                      setState(() {

                      });
                    }
                )
              ],
            ),
            // Row(
            //   children: [
            //     const Text('Четвертый параметр'),
            //     CupertinoTextField(
            //
            //     )
            //   ],
            // )
          ],
        )
      ),
    );
  }
}