import 'package:flutter/material.dart';
import 'package:settings/model/icon-style.dart';

/**
 * 
 * 
 * 
 * 
 */

class Setting {
  String? id; //uuid mostly
  String? key;
  String? value;

  IconData? icon;
  IconStyle? iconStyle;

  Setting({this.id, this.key, this.value, this.icon, this.iconStyle});
}

class GroupSettings {
  String? title;
  String? subtitle;
  List<Setting> settings;

  GroupSettings({
    required this.title,
    required this.settings,
    required this.subtitle,
  });

  bool get isGroupSetting => settings.length > 1;
}
