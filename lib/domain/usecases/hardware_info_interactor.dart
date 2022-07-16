import 'package:get_it/get_it.dart';
import 'package:greenscreen/domain/entities/cpu_info.dart';
import 'package:greenscreen/domain/repositories/cpu_repository.dart';
import 'package:greenscreen/domain/usecases/hardware_info_usecase.dart';

class HardwareInfoInteractor implements HardwareInfoUsecase {
  final GetIt _getIt = GetIt.instance;
  late CpuRepository _cpuRepository;

  HardwareInfoInteractor() {
    _cpuRepository = _getIt<CpuRepository>();
  }

  @override
  Future<CpuInfo> getCpuInfo() async => _cpuRepository.getCpuInfo();
}
