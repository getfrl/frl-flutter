import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';
import 'package:frl_flutter/resources/pages/me_page.dart';
import 'package:frl_flutter/resources/pages/notifications_page.dart';
import 'package:frl_flutter/resources/pages/trending_page.dart';
import 'package:frl_flutter/resources/pages/explore_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;

  CustomBottomNav({Key? key, required this.currentIndex}) : super(key: key);

  static String state = "custom_bottom_nav";

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends NyState<CustomBottomNav> {
  int _selectedIndex = 0;

  _CustomBottomNavState() {
    stateName = CustomBottomNav.state;
  }

  @override
  init() async {
    super.init();
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(CustomBottomNav.state, data: "example payload");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        HapticFeedback.lightImpact();
        routeTo(
          TrendingPage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade,
        );
        break;
      case 1:
        HapticFeedback.lightImpact();
        routeTo(
          ExplorePage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade,
        );
        break;
      case 2:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdPage()));
        break;
      case 3:
        HapticFeedback.lightImpact();
        routeTo(
          NotificationsPage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade,
        );
        break;
      case 4:
        HapticFeedback.lightImpact();
        routeTo(
          MePage.path,
          navigationType: NavigationType.pushReplace,
          pageTransition: PageTransitionType.fade,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 52),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              selectedIndex: _selectedIndex,
              itemIndex: 0,
              icon: Icons.local_fire_department,
              onTap: () => _onItemTapped(0),
            ),
            CustomIconButton(
              selectedIndex: _selectedIndex,
              itemIndex: 1,
              icon: Icons.search,
              onTap: () => _onItemTapped(1),
            ),
            CustomIconButton(
              selectedIndex: _selectedIndex,
              itemIndex: 2,
              icon: Icons.add,
              onTap: () => _onItemTapped(2),
            ),
            CustomIconButton(
              selectedIndex: _selectedIndex,
              itemIndex: 3,
              icon: Icons.notifications_active_outlined,
              onTap: () => _onItemTapped(3),
            ),
            CustomIconButton(
              selectedIndex: _selectedIndex,
              itemIndex: 4,
              icon: Icons.person_outline_rounded,
              onTap: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final int selectedIndex;
  final int itemIndex;
  final IconData icon;
  final Function onTap;

  CustomIconButton({
    required this.selectedIndex,
    required this.itemIndex,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedIndex == itemIndex
            ? ThemeColor.get(context).primaryAccent
            : Colors.transparent,
      ),
      child: IconButton(
        icon: Icon(icon,
            size: 28.0,
            color: selectedIndex == itemIndex ? Colors.black : Colors.white),
        onPressed: () => onTap(),
      ),
    );
  }
}
