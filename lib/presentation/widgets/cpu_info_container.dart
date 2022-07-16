import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:greenscreen/presentation/models/hardware_info_model.dart';
import 'package:provider/provider.dart';

class CpuInfoContainer extends StatelessWidget {
  const CpuInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HardwareInfoModel>(
      builder: (context, value, child) => Container(
        color: Colors.red,
        child: Text(value.cpuInfo?.modelName ?? 'unknown'),
      ),
    );
  }
}
