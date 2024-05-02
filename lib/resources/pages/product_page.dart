import 'package:flutter/material.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProductPage extends NyStatefulWidget {
  static const path = '/product';

  ProductPage() : super(path, child: _ProductPageState());
}

class _ProductPageState extends NyState<ProductPage> {
  int voteCount = 4;

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
                            // Brand
                            Text(
                              "Nike",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(height: 2),
                            // Product Title
                            Text(
                              "2 Pcs Ultrasonic Dog Whistle",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 2),
                            // Price
                            Text(
                              "From \€120",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.normal),
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
                            // Product Description
                            Text(
                              "The 30-foot Free Range is a long dog leash that is commonly used for recall training, hiking, and outdoor play. This length is great for the beach or playing with your dog in the park for close play.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 24),
                            TextButton(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Vote now  •",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    voteCount.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  voteCount++;
                                });
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 12),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    ThemeColor.get(context).primaryAccent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                        color: ThemeColor.get(context)
                                            .primaryAccent),
                                  ),
                                ),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return const Color.fromARGB(255, 184, 176,
                                          153)!; // Overlay color when pressed
                                    }
                                    return Colors
                                        .transparent; // No overlay color
                                  },
                                ),
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity,
                                      48), // full width and 48 height
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                            Divider(
                              color: Colors.grey[300],
                              thickness: 1,
                              height: 20,
                            ),
                            SizedBox(height: 24),
                            Text(
                              "All the linked stores in FRL have been given the official stamp of approval by our team. No shady business here, so go ahead and shop with peace of mind!",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Product added by:",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
