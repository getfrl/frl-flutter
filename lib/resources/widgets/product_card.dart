import 'package:flutter/material.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';
import 'package:frl_flutter/resources/pages/product_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String brand;
  final String title;
  final String price;
  final String oldPrice;
  final String votes;
  final String uploadCount;

  ProductCard({
    required this.imageUrl,
    required this.brand,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.votes,
    required this.uploadCount,
  });

  static String state = "product_card";

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends NyState<ProductCard> {
  _ProductCardState() {
    stateName = ProductCard.state;
  }

  @override
  init() async {
    super.init();
  }

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(ProductCard.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeTo(
          ProductPage.path,
          navigationType: NavigationType.push,
          pageTransition: PageTransitionType.fade,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.imageUrl,
                width: 76,
                height: 76,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      height: 1.15,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 1.15,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.15,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.oldPrice,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color(0xFFF2A793),
                          decorationThickness: 1.25,
                          color: Color(0xFFF2A793),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.votes,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xFF7596E4),
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                      height: 1.15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeColor.get(context).primaryAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.upload,
                    color: Colors.black,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.uploadCount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
