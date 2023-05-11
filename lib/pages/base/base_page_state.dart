import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../theme/theme.dart';
import '../../utils/catch_error.dart';
import '../../utils/loading.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  final Map<String, dynamic>? params;
  const BaseStatefulPage({Key? key, this.params}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BasePageState();
}

class BasePageState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin {
  bool hideAppbar = false;
  String title = '';
  Color titleColor = Colors.black;
  Color appBarBackgroundColor = Colors.white;
  Color backgroundColor = Colors.white;
  Color loadingBgColor = AppColor.grayBackground;
  List<Widget> actions = [];
  bool needScroll = true;
  ScrollController? scrollController;
  bool loading = true;
  bool loadingError = false;
  Future Function()? loadingFunc;
  List<CancelToken> cancelTokens = [];
  bool needRefresh = false;
  RefreshController? refreshController;
  Widget? refreshHeader = const ClassicHeader();

  CancelToken genCancelToken() {
    final cancelToken = CancelToken();
    cancelTokens.add(cancelToken);
    return cancelToken;
  }

  @override
  void dispose() {
    super.dispose();
    while (cancelTokens.isNotEmpty) {
      cancelTokens.removeAt(0).cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _handleLoading();
    });
  }

  _handleLoading() async {
    try {
      await loadingFunc?.call();
      if (!mounted) return;
      setState(() {
        loading = false;
        loadingError = false;
      });
    } catch (e) {
      catchError(e);
      hideLoading();
      if (!mounted) return;
      setState(() {
        loading = false;
        loadingError = true;
      });
    }
  }

  @protected
  onBackPress() {
    while (cancelTokens.isNotEmpty) {
      cancelTokens.removeAt(0).cancel();
    }
    hideLoading();
    final router = GoRouter.of(context);
    if (router.canPop()) {
      GoRouter.of(context).pop();
    }
  }

  @protected
  Future<bool> onWillPop() {
    onBackPress();
    return Future.value(false);
  }

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: (loadingError || loading) ? loadingBgColor : backgroundColor,
        appBar: buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    if (!hideAppbar) {
      return PreferredSize(
        preferredSize: Size.fromHeight(56.w),
        child: AppBar(
          leading: CupertinoButton(
            // color: Colors.white,
            padding: const EdgeInsets.all(0),
            onPressed: onBackPress,
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text(title, style: TextStyle(color: titleColor)),
          backgroundColor: appBarBackgroundColor,
          actions: actions,
          elevation: 0,
        ),
      );
    } else {
      return null;
    }
  }

  Widget _buildBody(BuildContext context) {
    if (loadingError) return buildLoadingError(context);
    if (loading) return buildLoading(context);
    var child = buildContent(context);
    if (needScroll) {
      child = SingleChildScrollView(controller: scrollController, child: child);
    }
    if (needRefresh && refreshController != null) {
      child = SmartRefresher(
        controller: refreshController!,
        enablePullDown: true,
        header: refreshHeader,
        onRefresh: onRefresh,
        child: child,
      );
    }
    child = SafeArea(top: false, child: child);
    return child;
  }

  @protected
  void onRefresh() async {
    refreshController?.refreshCompleted();
  }

  @protected
  Widget buildContent(BuildContext context) {
    return Container();
  }

  @protected
  Widget buildLoading(BuildContext context) {
    return Container();
  }

  @protected
  Widget buildLoadingError(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          loadingError = false;
          loading = true;
        });
        _handleLoading();
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(
            'Kesalahan memuat',
            style: TextStyle(color: AppColor.secondaryText, fontSize: FontSize.fontSize),
          ),
        ),
      ),
    );
  }
}
