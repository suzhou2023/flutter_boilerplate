import 'package:flutter/material.dart';

import 'base/base_page_state.dart';

class Home extends StatefulWidget {
  final ScrollController? scrollController;
  const Home({super.key, this.scrollController});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BasePageState<Home> {
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Home'),
      ],
    );
  }
}
