import '../router/router.dart';
import 'catch_error.dart';

clearStores() {
  try {
    final context = goRouter.routerDelegate.navigatorKey.currentContext;
    if (context != null) {
      //
    }
  } catch (e) {
    catchError(e);
  }
}
