import '../main.dart';
import '../models/userinfo/user_info.dart';
import 'server_request.dart';

class API {
  static ServerRequest<UserInfo> login({Map? params, bool? showLoading}) {
    params = {
      ...params ?? {},
    };
    return ServerRequest<UserInfo>(
      url: '${envStore.env?.apiHost}/xxx/login',
      method: RequestMethod.post,
      data: <String, dynamic>{...params},
      showLoading: showLoading ?? true,
      headers: null,
      resultParser: (dynamic value) async {
        return UserInfo.fromJson(value);
      },
    );
  }

  static ServerRequest<dynamic> logout({bool? showLoading}) {
    return ServerRequest<dynamic>(
      url: '${envStore.env?.apiHost}/xxx/logout',
      method: RequestMethod.delete,
      data: null,
      showLoading: showLoading ?? true,
      headers: {'X-User-Token': accountStore.token},
      resultParser: (dynamic value) async {
        return value;
      },
    );
  }
}
