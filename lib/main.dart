import 'package:flutter/material.dart';

import 'app.dart';
import 'common/env_configs.dart';
import 'models/env/env.dart';
import 'stores/account/account_store.dart';
import 'stores/env/env_store.dart';

final envStore = EnvStore();
final accountStore = AccountStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  envStore.updateEnv(Env.fromJson(EnvConfigs.dev));
  await accountStore.loadSession();
  runApp(const App());
}
