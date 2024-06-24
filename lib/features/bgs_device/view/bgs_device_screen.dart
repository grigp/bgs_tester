//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:bgs_tester/repositories/bgs_devices/bgs_devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BgsDeviceScreen extends StatefulWidget {
  const BgsDeviceScreen({super.key});

  @override
  State<BgsDeviceScreen> createState() => _BgsDeviceScreenState();
}

class _BgsDeviceScreenState extends State<BgsDeviceScreen> {
  BgsInfo? bgs;
  late TextEditingController _textCtrlName;
  late TextEditingController _textCtrlDecription;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is BgsInfo, 'Needed BgsInfo args');
    bgs = args as BgsInfo;
    _textCtrlName = TextEditingController(text: (bgs as BgsInfo).name ?? '');
    _textCtrlDecription = TextEditingController(text: (bgs as BgsInfo).description ?? '');

    super.didChangeDependencies();
  }


  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    print('name = ${(bgs as BgsInfo).name ?? ''}');
    print('description = ${(bgs as BgsInfo).description ?? ''}');
    print('start power = ${((bgs as BgsInfo).startPower ?? 1)}');
    print('power = ${((bgs as BgsInfo).power ?? 10)}');
    print('am = ${(bgs as BgsInfo).am ?? false}');
    print('fm = ${(bgs as BgsInfo).fm ?? false}');
    _textCtrlName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text((bgs as BgsInfo).name ?? '...'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const Text('О программе'),
                const SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('about');
                    showAboutDialog(
                      context: context,
                      applicationName: 'bgs tester',
                      applicationVersion: '1.0'
                    );
                    // const AboutDialog(
                    //   key: Key('about'),
                    //   applicationName: 'bgs tester',
                    //   applicationVersion: '1.0',
                    // );
                  },
                  child: const Text('press me'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Название'),
                const SizedBox(
                  width: 40,
                ),
                Expanded(child:
                  CupertinoTextField(
                    controller: _textCtrlName,
                    onChanged: (String value) {
                      bgs?.name = value;
                    }
                  )
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Описание'),
                const SizedBox(
                  width: 40,
                ),
                Expanded(child:
                  CupertinoTextField(
                    controller: _textCtrlDecription,
                    onChanged: (String value) {
                      bgs?.description = value;
                    },
                  )
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Начальная мощность : '),
                Text('${((bgs as BgsInfo).startPower ?? 1)}'),
                Expanded(
                  child: CupertinoSlider(
                    key: const Key('startPower'),
                    value: ((bgs as BgsInfo).startPower ?? 1).toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    onChanged: (double value) {
                      setState(() {
                        bgs?.startPower = (value ?? 1.0).toInt();
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('Мощность : '),
                Text('${((bgs as BgsInfo).power ?? 10)}'),
                Expanded(
                  child: CupertinoSlider(
                    key: const Key('power'),
                    value: ((bgs as BgsInfo).power ?? 10).toDouble(),
                    min: 1,
                    max: 100,
                    divisions: 99,
                    onChanged: (double value) {
                      setState(() {
                        bgs?.power = (value ?? 10).toInt();
                      });
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('AM'),
                CupertinoSwitch(
                  value: (bgs as BgsInfo).am ?? false,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (bool? value) {
                    setState(() {
                      bgs?.am = value ?? false;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text('FM'),
                CupertinoSwitch(
                  value: (bgs as BgsInfo).fm ?? false,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (bool? value) {
                    setState(() {
                      bgs?.fm = value ?? false;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
