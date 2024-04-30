import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BuyPage extends NyStatefulWidget {
  static const path = '/buy';
  
  BuyPage() : super(path, child: _BuyPageState());
}

class _BuyPageState extends NyState<BuyPage> {

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
        title: Text("Buy")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
