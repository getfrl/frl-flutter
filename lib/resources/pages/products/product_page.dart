import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/app/controllers/controller.dart';

class ProductPage extends NyStatefulWidget {
  final Controller controller = Controller();
  
  static const path = '/product';
  
  ProductPage({Key? key}) : super(key: key);
  
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends NyState<ProductPage> {

  @override
  init() async {
    super.init();
    
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
