import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:greenscreen/presentation/models/hardware_info_model.dart';
import 'package:greenscreen/presentation/widgets/cpu_info_container.dart';
import 'package:provider/provider.dart';

class HardwareInfoContainer extends StatelessWidget {
  const HardwareInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HardwareInfoModel>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(children: const [CpuInfoContainer()]),
      ),
    );
  }
}
