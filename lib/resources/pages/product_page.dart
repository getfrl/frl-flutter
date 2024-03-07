import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProductPage extends NyStatefulWidget {
  static const path = '/product';

  ProductPage() : super(path, child: _ProductPageState());
}

class _ProductPageState extends NyState<ProductPage> {
  @override
  init() async {}

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text("Nike V2K Run",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ios_share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                              'public/assets/images/product-photo.png'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text(
                              "Nike",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "TERREX AGRAVIC FLOW GORE-TEX TRAIL - Trail hardloopschoenen - semi flash aqua/wonder silver/lucid lemon",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "From \€120",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 24),
                            Text(
                              "Description:",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "A divine fragrance offering from Le Labo, Baie 19 Eau de Parfum is a sublimely sophisticated olfactory ode to heavy rain after a prolonged dry spell. United with juniper berry, patchouli and green leaves, this fresh and herbaceous scent is utterly spellbinding. Intriguing and addictive, the fragrance is perfect for both men and women and, if youre into layering your scents. Available in three sizes, you can ensure youre never without your signature scent keep one in your bag, one on your desk and one in pride of place on your dressing table.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 86),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 2,
            left: 16,
            right: 16,
            child: SafeArea(
              child: ElevatedButton(
                child: Text(
                  "Buy now",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
