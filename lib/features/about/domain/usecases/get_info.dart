import 'package:injectable/injectable.dart';

import '../entities/about.dart';
import '../repositories/about_repository.dart';

abstract class GetInfo {
  About call();
}

@Injectable(as: GetInfo)
class GetInfoImpl implements GetInfo {
  final AboutRepository repository;

  GetInfoImpl(this.repository);

  @override
  About call() {
    return repository.getInfo();
  }
}
