import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'router/router.dart';
import 'stores/account/account_store.dart';
import 'stores/env/env_store.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Log.d('AppComponent build ${DateTime.now().millisecondsSinceEpoch}');
    return ScreenUtilInit(
      designSize: const Size(375, 720),
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            Provider<EnvStore>(create: (_) => envStore),
            Provider<AccountStore>(create: (_) => accountStore),
          ],
          child: MaterialApp.router(
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}
