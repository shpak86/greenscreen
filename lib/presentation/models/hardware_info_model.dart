import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:greenscreen/domain/entities/cpu_info.dart';
import 'package:greenscreen/domain/usecases/hardware_info_usecase.dart';

class HardwareInfoModel with ChangeNotifier {
  GetIt _getIt = GetIt.I;

  CpuInfo? _cpuInfo;

  CpuInfo? get cpuInfo => _cpuInfo;

  void updateCpuInfo() {
    _getIt<HardwareInfoUsecase>().getCpuInfo().then((it) {
      _cpuInfo = it;
      notifyListeners();
    });
  }
}
