import 'package:flutter/material.dart';
import 'package:frl_flutter/app/controllers/me_controller.dart';
import 'package:frl_flutter/app/models/user.dart';
import 'package:frl_flutter/bootstrap/helpers.dart';
import 'package:frl_flutter/resources/widgets/custom_bottom_nav_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MePage extends NyStatefulWidget {
  static const path = '/me';

  MePage({Key? key}) : super(path, child: _MePageState());

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends NyState<MePage> {
  MeController? meController;
  User? me;

  @override
  init() async {
    super.init();
    meController = MeController(context);
    me = await meController?.fetchMe();
    setState(() {});
  }

  // @override
  // initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(76),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(76),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage('public/assets/images/erin.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 76,
                      height: 76,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@" + (me?.username ?? "No name found"),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.get(context).primaryContent,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2E2F21),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'public/assets/images/frl-small-icon.png',
                                    height: 18,
                                    width: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "#" + (me?.frlId ?? "No id found"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          ThemeColor.get(context).primaryAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 18),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size.fromHeight(20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 16),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF242424),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color(0xFF5B5B5B),
                    width: 1,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "3241",
                            style: TextStyle(
                              fontSize: 16,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.9),
                            ),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 10,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Color(0xFF5B5B5B),
                        thickness: 1,
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "75",
                            style: TextStyle(
                              fontSize: 16,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.9),
                            ),
                          ),
                          Text(
                            "List Saves Received",
                            style: TextStyle(
                              fontSize: 10,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        color: Color(0xFF5B5B5B),
                        thickness: 1,
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "50",
                            style: TextStyle(
                              fontSize: 16,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.9),
                            ),
                          ),
                          Text(
                            "Vote Streak",
                            style: TextStyle(
                              fontSize: 10,
                              color: ThemeColor.get(context)
                                  .primaryContent
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(currentIndex: 4),
    );
  }
}
