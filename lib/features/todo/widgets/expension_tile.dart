import 'package:flutter/material.dart';
import 'package:task_management/common/utils/app_cons.dart';
import 'package:task_management/features/todo/widgets/bottom_tiles.dart';

class XpensionTile extends StatelessWidget {
  const XpensionTile(
      {super.key,
      required this.text1,
      required this.text2,
      this.trailing,
      this.onExpansionChange,
      required this.children});
  final String text1;
  final String text2;
  final Widget? trailing;
  final List<Widget> children;
  final void Function(bool)? onExpansionChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.kBkLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.kRadius),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: BottomTiles(
            color: AppConstants.kLight,
            text1: text1,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChange,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
