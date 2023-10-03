import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/widgets/logo_widget.dart';
import '../../app/controllers/trending_controller.dart';
import '/bootstrap/helpers.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

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
      length: 3, // The number of tabs
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
        body: Column(
          children: [
            Container(
              color: ThemeColor.get(context).background,
              child: TabBar(
                // This is where you add your tab bar
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                // This is where you add your tab bar view
                children: [
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 72),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            decoration: BoxDecoration(
              color: ThemeColor.get(context).background,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeColor.get(context).primaryAccent,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_fire_department,
                        size: 30.0,
                        color: Colors
                            .black), // Increased icon size and changed color to black
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search, size: 28.0),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications_active_outlined, size: 28.0),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person_outline_rounded, size: 28.0),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get isThemeDark =>
      ThemeProvider.controllerOf(context).currentThemeId ==
      getEnv('DARK_THEME_ID');
}
