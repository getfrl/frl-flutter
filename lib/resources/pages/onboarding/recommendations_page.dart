import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class RecommendationsPage extends NyStatefulWidget {
  static const path = '/recommendations';
  
  RecommendationsPage() : super(path, child: _RecommendationsPageState());
}

class _RecommendationsPageState extends NyState<RecommendationsPage> {

  @override
  init() async {

  }
  
  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommendations")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
