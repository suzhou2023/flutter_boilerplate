// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStore, Store {
  Computed<dynamic>? _$isLoginedComputed;

  @override
  dynamic get isLogined =>
      (_$isLoginedComputed ??= Computed<dynamic>(() => super.isLogined,
              name: '_AccountStore.isLogined'))
          .value;
  Computed<dynamic>? _$tokenComputed;

  @override
  dynamic get token => (_$tokenComputed ??=
          Computed<dynamic>(() => super.token, name: '_AccountStore.token'))
      .value;

  late final _$userInfoAtom =
      Atom(name: '_AccountStore.userInfo', context: context);

  @override
  UserInfo? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(UserInfo? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$loginTypeAtom =
      Atom(name: '_AccountStore.loginType', context: context);

  @override
  String? get loginType {
    _$loginTypeAtom.reportRead();
    return super.loginType;
  }

  @override
  set loginType(String? value) {
    _$loginTypeAtom.reportWrite(value, super.loginType, () {
      super.loginType = value;
    });
  }

  late final _$_AccountStoreActionController =
      ActionController(name: '_AccountStore', context: context);

  @override
  dynamic updateUserInfo(UserInfo? userInfo) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.updateUserInfo');
    try {
      return super.updateUserInfo(userInfo);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userInfo: ${userInfo},
loginType: ${loginType},
isLogined: ${isLogined},
token: ${token}
    ''';
  }
}
