import 'package:agile_access/screen_last_visited.dart';
import 'package:agile_access/screen_user_profile.dart';
import 'package:flutter/material.dart';

import 'package:agile_access/data/user_data.dart';
import 'package:agile_access/screen_home_partition.dart';

void ItemNavSelected(
    BuildContext context, int idx, UserGroup userGroup, User userData) {
  if (idx == 0) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => ScreenHomePartition(
          userGroup: userGroup,
          userData: userData,
          areaName: userGroup.areas.first),
    ));
  } else if (idx == 1) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => ScreenLastVisited(
          userGroup: userGroup,
          userData: userData,
          areaName: userGroup.areas.first),
    ));
  } else if (idx == 2) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => ScreenUserProfile(
        userGroup: userGroup,
        userData: userData,
      ),
    ));
  }
}
