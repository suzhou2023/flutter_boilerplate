import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/api.dart';
import '../../http/http_manager.dart';
import '../../models/userinfo/user_info.dart';
import '../../utils/catch_error.dart';
import '../../utils/store_clear.dart';

part 'account_store.g.dart';

// ignore: library_private_types_in_public_api
class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  @observable
  UserInfo? userInfo;
  @observable
  String? loginType;

  @action
  updateUserInfo(UserInfo? userInfo) {
    this.userInfo = userInfo;
  }

  @computed
  get isLogined {
    if (null != userInfo) {
      return true;
    }
    return false;
  }

  @computed
  get token {
    return userInfo?.token;
  }

  onLoginSuccess(UserInfo userInfo) {
    //
  }

  storeSession(UserInfo userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(userInfo.toJson());
    prefs.setString('userInfo', encoded);
  }

  loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString('userInfo');
    if (encoded != null) {
      final json = jsonDecode(encoded);
      final userInfo = UserInfo.fromJson(json);
      updateUserInfo(userInfo);
    }
  }

  Future<bool> removeSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userInfo');
    updateUserInfo(null);
    return true;
  }

  login(Map params) async {
    final res = await HttpManager.instance.request<UserInfo>(request: API.login(params: params));
    if (res?.code == 0) {
      final userInfo = await res?.responseData();
      if (userInfo != null) {
        await storeSession(userInfo);
        updateUserInfo(userInfo);
        // onLoginSuccess(userInfo);
      }
    }
  }

  logout() async {
    try {
      final res = await HttpManager.instance.request(request: API.logout());
      if (res?.code == 0) {
        await removeSession();
        clearStores();
      }
    } catch (e) {
      catchError(e);
    }
  }
}
