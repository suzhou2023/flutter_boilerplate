import '../http/server_error.dart';
import 'log.dart';
import 'toast.dart';

void catchError(e) {
  Log.e(e);
  if (e is ServerError && e.message != null) {
    toast(e.message!);
  }
}
