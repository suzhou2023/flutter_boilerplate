// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnvStore on _EnvStore, Store {
  late final _$envAtom = Atom(name: '_EnvStore.env', context: context);

  @override
  Env? get env {
    _$envAtom.reportRead();
    return super.env;
  }

  @override
  set env(Env? value) {
    _$envAtom.reportWrite(value, super.env, () {
      super.env = value;
    });
  }

  late final _$_EnvStoreActionController =
      ActionController(name: '_EnvStore', context: context);

  @override
  dynamic updateEnv(Env env) {
    final _$actionInfo =
        _$_EnvStoreActionController.startAction(name: '_EnvStore.updateEnv');
    try {
      return super.updateEnv(env);
    } finally {
      _$_EnvStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
env: ${env}
    ''';
  }
}
