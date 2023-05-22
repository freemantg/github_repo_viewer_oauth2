import 'package:flutter/material.dart';
import 'package:github_repo_viewer_oauth2/injection.dart';

import 'core/presentation/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Env.prod);
  runApp(AppWidget());
}
