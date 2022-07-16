import 'package:greenscreen/domain/entities/cpu_info.dart';

abstract class CpuRepository {
  Future<CpuInfo> getCpuInfo();
}
