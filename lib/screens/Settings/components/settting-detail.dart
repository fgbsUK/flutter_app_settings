import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/model/settting_model.dart';
import 'package:settings/screens/Settings/components/settings-item.dart';
import 'package:settings/utils/switch_appbar.dart';

import 'package:uuid/uuid.dart';

Setting fullname = Setting(
    id: Uuid().toString(),
    key: "Full Name",
    value: "Flutter Developer",
    icon: CupertinoIcons.person);
Setting email = Setting(
    id: Uuid().toString(),
    key: "Email",
    value: "aps@fgbs.uk",
    icon: CupertinoIcons.person);

GroupSettings sample = GroupSettings(
    title: "Personal Details",
    settings: [fullname, email],
    subtitle:
        "Your personal and profile information. Keeping it up to date helps you move forward!");

class SettingDetailArgs {
  final GroupSettings settings;
  final IconData icon;
  final String? title;

//const SettingDetailArgs({Key? key, required this.onPressed}) : super(key: key);

  SettingDetailArgs(
      {required this.settings, required this.icon, required this.title});
}

class SettingDetail extends StatefulWidget {
  //final Key? key;
  /*final*/ SettingDetailArgs args = SettingDetailArgs(
      settings: sample,
      icon: CupertinoIcons.pencil_outline,
      title: sample.title);

  SettingDetail({
    required GlobalKey<State<StatefulWidget>> key,
  }) : super(key: key);

  @override
  _SettingDetailState createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {
  /// Whether it's a group setting (more than 2 settings)
  //bool get _isGroupSetting => widget.args.setting.length > 2;
  final TextEditingController _textController = TextEditingController();
  int _selectedItemsCount = 0;

  /// Whether it's a group set (more than 2 users)
  bool get _isGroupSetting => widget.args.settings.isGroupSetting;

  //List<Setting> get settings => widget.args.settings;
  @override
  void initState() {
    /*
    _controller.addAll(_model.chatMessages[_chat.id] ?? []);
    _controller.selectionEventStream.listen((event) {
      setState(() {
        _selectedItemsCount = event.currentSelectionCount;
      });
    });
  */
    super.initState();
  }

  /// Called when the user pressed the top right corner icon
  void onOptionMenuPressed() {
    print("Option Menu Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SwitchAppBar(
        primaryAppBar: AppBar(
          title: _buildSettingDetailTitle(),
          actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: () {})],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text(widget.args.settings.subtitle.toString()),
      ),
    );
  }

  Widget _buildSettingDetailTitle() {
    if (_isGroupSetting) {
      return Text(widget.args.settings.title.toString());
    } else {
      final _key = ""; //_setting.key;
      return Row(
        children: [
          ClipOval(
              child: Image.asset(
                  widget.args.icon.toString() ??
                      'lib/assets/images/profile-1.jpg',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                      widget.args.settings.title.toString() ?? "No Title",
                      overflow: TextOverflow.ellipsis)))
        ],
      );
    }
  }
}
