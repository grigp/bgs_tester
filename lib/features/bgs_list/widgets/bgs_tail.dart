import 'package:flutter/material.dart';
import 'package:bgs_tester/repositories/bgs_devices/models/bgs_info.dart';

class BgsTail extends StatelessWidget {
  const BgsTail({
    super.key,
    required this.bgs,
  });

  final BgsInfo bgs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  ListTile(
      leading: const Icon(Icons.device_hub),
      title: Text(
        bgs.name.toString(),
        style: theme.textTheme.bodyMedium,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
//        Navigator.of(context).pushNamed('/device', arguments: bgs.name);
        Navigator.of(context).pushNamed('/device', arguments: bgs);
      },
    );
  }
}