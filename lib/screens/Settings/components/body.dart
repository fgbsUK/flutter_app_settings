import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/model/icon-style.dart';
import 'package:settings/screens/Settings/components/background.dart';
import 'package:settings/screens/Settings/components/settings-group.dart';
import 'package:settings/screens/Settings/components/settings-item.dart';
import 'package:settings/screens/Settings/components/settting-detail.dart';
import 'package:settings/screens/Settings/components/simple-user-card.dart';
import 'package:settings/screens/Settings/components/small-user-card.dart';
import 'package:http/http.dart' as http;
import 'package:settings/theme/mandelbrot.dart' as theme;

class Body extends StatefulWidget {
  const Body({
    required Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  bool _isLoading = false;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  AnimationController? animationController;
  Animation<double>? _animation;
  final int count = 9;

  var email;
  var password;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    /*  _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = new Tween<double>(
      begin: _animation.value,
      end: balance,
    ) as Animation<double>;//_controller; */
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));
    animationController!.forward();

    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      key: GlobalKey(),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleUserCard(
                  userProfilePic: AssetImage("lib/assets/images/profile-1.jpg"),
                  userName: "Flutter User",
                  onTap: () {
                    print('nav to user details page');
                  },
                ),
                SizedBox(
                  height: 6,
                ),
                SmallUserCard(
                    cardColor: theme.Mandelbrot.gradientSecond,
                    userName: "Flutter User",
                    userProfilePic:
                        AssetImage("lib/assets/images/profile-1.jpg"),
                    onTap: () {}),
                SettingsGroup(
                  settingsGroupTitle: "Profile",
                  items: [
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingDetail(
                              key: GlobalKey(),
                            ),
                          ),
                        );
                      },
                      icons: CupertinoIcons.pencil_outline,
                      iconStyle: IconStyle(),
                      title: 'Personal Details',
                      subtitle: "Your personal profile information.",
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingDetail(
                              key: GlobalKey(),
                            ),
                          ),
                        );
                      },
                      icons: CupertinoIcons.map_fill,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.green,
                      ),
                      title: 'Verification Status',
                      subtitle: "Approved",
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingDetail(
                              key: GlobalKey(),
                            ),
                          ),
                        );
                      },
                      icons: CupertinoIcons.map_fill,
                      iconStyle: IconStyle(),
                      title: 'Driving License',
                      subtitle: "Your valid driving license information.",
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingDetail(
                              key: GlobalKey(),
                            ),
                          ),
                        );
                      },
                      icons: CupertinoIcons.bolt,
                      iconStyle: IconStyle(),
                      title: 'Performance',
                      subtitle:
                          "Your rating and reviews along with perforamnce metrics",
                    ),
                    SettingsItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingDetail(
                              key: GlobalKey(),
                            ),
                          ),
                        );
                      },
                      icons: Icons.shield_moon_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: theme.Mandelbrot.homePageDetail,
                      ),
                      title: 'Payment Settings',
                      subtitle:
                          "Customise your payment settings, add/remove payment methods",
                      trailing: Switch.adaptive(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  settingsGroupTitle: "General",
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.hand_draw,
                      iconStyle: IconStyle(),
                      title: 'Appearance',
                      subtitle: "Theme and Appearance settings.",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.gift_alt_fill,
                      iconStyle: IconStyle(),
                      title: 'Referrals',
                      subtitle: "Theme and Appearance settings.",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.dark_mode_rounded,
                      iconStyle: IconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'Dark mode',
                      subtitle: "Automatic",
                      trailing: Switch.adaptive(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                SettingsGroup(
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.info_rounded,
                      iconStyle: IconStyle(
                        backgroundColor: Colors.purple,
                      ),
                      title: 'About',
                      subtitle: "Your road to JustDrive users.",
                    ),
                  ],
                ),
                // You can add a settings title
                SettingsGroup(
                  settingsGroupTitle: "Account",
                  items: [
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.hand_raised_fill,
                      iconStyle: IconStyle(),
                      title: 'Help & Support',
                      subtitle: "24x7 help and support ",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.question_circle_fill,
                      iconStyle: IconStyle(),
                      title: 'Performance',
                      subtitle:
                          "Your rating and reviews along with perforamnce metrics",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.exit_to_app_rounded,
                      title: "Sign Out",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: CupertinoIcons.delete_solid,
                      title: "Delete account",
                      titleStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            )

            /*child: ListView(
            children: [
              // User card
              BigUserCard(
                cardColor: Colors.red,
                userName: "Babacar Ndong",
                userProfilePic: AssetImage("assets/logo.png"),
                cardActionWidget: SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    withBackground: true,
                    borderRadius: 50,
                    backgroundColor: Colors.yellow[600],
                  ),
                  title: "Modify",
                  subtitle: "Tap to change your data",
                  onTap: () {
                    print("OK");
                  },
                ),
              ),
               */
            ),
      ),
    );
  }

  void _initData() {}
}
