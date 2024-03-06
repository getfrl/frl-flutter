import 'package:flutter/material.dart';
import 'package:frl_flutter/resources/widgets/custom_bottom_nav_widget.dart';
import 'package:frl_flutter/resources/widgets/list_card.dart';
import 'package:frl_flutter/resources/widgets/product_card.dart';
import '../../app/controllers/trending_controller.dart';
import '/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';

class TrendingPage extends NyStatefulWidget {
  @override
  final TrendingController controller = TrendingController();

  static const path = '/home-page';

  TrendingPage({Key? key}) : super(key: key);

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends NyState<TrendingPage> {
  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // The number of tabs
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text("trending.title".tr()),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ThemeColor.get(context).background,
        ),
        backgroundColor: Color(0xFFF2F2F2),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  color: ThemeColor.get(context).background,
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    tabs: [Tab(text: "Products"), Tab(text: "Lists")],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    // This is where you add your tab bar view
                    children: [
                      SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(Icons.tune, color: Colors.black)
                              ],
                            ),
                            SizedBox(height: 20),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 12,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  imageUrl:
                                      'public/assets/images/product-photo.png',
                                  title:
                                      "Nivea Sun Carotene Bronze Sunscreen Lotion SPF 6",
                                  price: "€12.99",
                                  oldPrice: "€16.99",
                                  votes: "1,429 Votes in the last 2 hour",
                                  uploadCount: "18.7k",
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Today",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(Icons.tune, color: Colors.black)
                              ],
                            ),
                            SizedBox(height: 20),
                            GridView.count(
                              childAspectRatio: 0.90,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              // childAspectRatio: (itemWidth / itemHeight),
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: List.generate(8, (index) {
                                return ListCard(
                                  imageUrl:
                                      'public/assets/images/product-photo.png',
                                  title:
                                      "Nivea Sun Carotene Bronze Sunscreen Lotion SPF 6",
                                  saves: "12.7k",
                                  noOfProducts: 50,
                                  owner: "@fabian",
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 120, // Adjust this value as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ThemeColor.get(context)
                          .secondaryBackground
                          .withOpacity(0.0),
                      ThemeColor.get(context).secondaryBackground,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNav(currentIndex: 0),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
