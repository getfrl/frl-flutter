import 'package:flutter/material.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ListCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String saves;
  final int noOfProducts;
  final String owner;

  ListCard({
    required this.imageUrl,
    required this.title,
    required this.saves,
    required this.noOfProducts,
    required this.owner,
  });

  static String state = "list_card";

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends NyState<ListCard> {
  _ListCardState() {
    stateName = ListCard.state;
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
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ThemeColor.get(context).primaryAccent,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_outline,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.saves,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          height: 112,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My favourite cooking books",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.30),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                "50 Products in this list",
                style: TextStyle(
                  color: Color(0xFF6190E9),
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage('public/assets/images/erin.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "by @fabian",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
