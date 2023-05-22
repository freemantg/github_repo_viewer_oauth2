import 'package:injectable/injectable.dart';

import 'sembast_data.dart';

@module
abstract class RegisterSembastDatabase {
  @LazySingleton()
  SembastDatabase get sembastDatabase => SembastDatabase()..init();
}
