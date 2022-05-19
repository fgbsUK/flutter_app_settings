import 'package:flutter/material.dart';
import 'package:settings/screens/Settings/components/body.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({required Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      //appBar: AppBar(),
      /*Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: theme.Mandelbrot.homePageBackground,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: theme.Mandelbrot.black)),
              actions: [
                //AppBarActionWidget(key: GlobalKey()),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),*/

      body: Body(
        key: GlobalKey(),
      ),
    );
  }
}
