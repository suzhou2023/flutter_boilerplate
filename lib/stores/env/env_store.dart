import 'package:mobx/mobx.dart';

import '../../models/env/env.dart';

part 'env_store.g.dart';

// ignore: library_private_types_in_public_api
class EnvStore = _EnvStore with _$EnvStore;

abstract class _EnvStore with Store {
  @observable
  Env? env;

  @action
  updateEnv(Env env) {
    this.env = env;
  }
}
