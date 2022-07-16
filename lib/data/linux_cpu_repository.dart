import 'package:greenscreen/domain/entities/cpu_info.dart';
import 'package:greenscreen/domain/repositories/cpu_repository.dart';
import 'package:greenscreen/data/parser_extensions.dart';
import 'dart:io';

class LinuxCpuRepository implements CpuRepository {
  static const String _key_architecture = 'Architecture';
  static const String _key_opmodes = 'CPU op-mode(s)';
  static const String _key_byteOrder = 'Byte Order';
  static const String _key_addressSizes = 'Address sizes';
  static const String _key_cpus = 'CPU(s)';
  static const String _key_onlineCpus = 'On-line CPU(s) list';
  static const String _key_threadsPerCore = 'Thread(s) per core';
  static const String _key_coresPerSocket = 'Core(s) per socket';
  static const String _key_sockets = 'Socket(s)';
  static const String _key_numaNodes = 'NUMA node(s)';
  static const String _key_vendor = 'Vendor ID';
  static const String _key_family = 'CPU family';
  static const String _key_model = 'Model';
  static const String _key_modelName = 'Model name';
  static const String _key_stepping = 'Stepping';
  static const String _key_frequency = 'CPU MHz';
  static const String _key_frequencyMax = 'CPU max MHz';
  static const String _key_frequencyMin = 'CPU min MHz';
  static const String _key_mips = 'BogoMIPS';
  static const String _key_virtualization = 'Virtualization';
  static const String _key_cacheL1d = 'L1d cache';
  static const String _key_cacheL1i = 'L1i cache';
  static const String _key_cacheL2 = 'L2 cache';
  static const String _key_cacheL3 = 'L3 cache';
  static const String _key_numaCpus = 'NUMA node0 CPU(s)';
  static const String _key_flags = 'Flags';
  static const String _key_vulnerabilities = 'vulnerabilities';

  @override
  Future<CpuInfo> getCpuInfo() async {
    return await parseLsCpu();
  }

  Future<CpuInfo> parseLsCpu() async {
    String data = await Process.run("lscpu", []).then((value) => value.stdout);
    CpuInfo cpuInfo = CpuInfo();
    var dataMap = data.splitToMap();

    cpuInfo.architecture = dataMap[_key_architecture];
    cpuInfo.opmodes = dataMap[_key_opmodes]?.split(r',\s*');
    cpuInfo.byteOrder = dataMap[_key_byteOrder];
    cpuInfo.addressSizes = dataMap[_key_addressSizes]?.split(r',\s*');
    cpuInfo.cpus = int.tryParse(dataMap[_key_cpus].toString());
    cpuInfo.onlineCpus = dataMap[_key_onlineCpus];
    cpuInfo.threadsPerCore =
        int.tryParse(dataMap[_key_threadsPerCore].toString());
    cpuInfo.coresPerSocket =
        int.tryParse(dataMap[_key_coresPerSocket].toString());
    cpuInfo.sockets = int.tryParse(dataMap[_key_sockets].toString());
    cpuInfo.numaNodes = int.tryParse(dataMap[_key_numaNodes].toString());
    cpuInfo.vendor = dataMap[_key_vendor];
    cpuInfo.family = dataMap[_key_family];
    cpuInfo.model = dataMap[_key_model];
    cpuInfo.modelName = dataMap[_key_modelName];
    cpuInfo.stepping = int.tryParse(dataMap[_key_stepping].toString());
    cpuInfo.frequency = double.tryParse(dataMap[_key_frequency].toString());
    cpuInfo.frequencyMax =
        double.tryParse(dataMap[_key_frequencyMax].toString());
    cpuInfo.frequencyMin =
        double.tryParse(dataMap[_key_frequencyMin].toString());
    cpuInfo.mips = double.tryParse(dataMap[_key_mips].toString());
    cpuInfo.virtualization = dataMap[_key_virtualization];
    cpuInfo.cacheL1d = dataMap[_key_cacheL1d].toString();
    cpuInfo.cacheL1i = dataMap[_key_cacheL1i].toString();
    cpuInfo.cacheL2 = dataMap[_key_cacheL2];
    cpuInfo.cacheL3 = dataMap[_key_cacheL3];
    cpuInfo.numaCpus = dataMap[_key_numaCpus];
    cpuInfo.flags = dataMap[_key_flags]?.split(r'\s+');
    return cpuInfo;
  }
}
