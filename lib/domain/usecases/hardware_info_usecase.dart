import 'package:greenscreen/domain/entities/cpu_info.dart';

abstract class HardwareInfoUsecase {
  Future<CpuInfo> getCpuInfo();
}
