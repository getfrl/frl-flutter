import 'package:flutter/material.dart';
import 'package:frl_flutter/resources/pages/onboarding/trend_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AllowNotificationsPage extends NyStatefulWidget {
  static const path = '/allow-notifications';

  AllowNotificationsPage() : super(path, child: _AllowNotificationsPageState());
}

class _AllowNotificationsPageState extends NyState<AllowNotificationsPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {}

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tailor your experience")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get better in-app suggestions and a customised experience based on your and your friends activities",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    routeTo(TrendPage.path,
                        navigationType: NavigationType.pushReplace);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 12), // Increased height
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
