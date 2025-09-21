import 'package:flutter/material.dart';

class ListviewVerticalWidget extends StatelessWidget {
  const ListviewVerticalWidget({
    super.key,
    required this.child,
    required this.itemCount,
    required this.separatorBuilder,
  });
  final Widget child;
  final int itemCount;
  final Widget separatorBuilder;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return child;
      },
      separatorBuilder: (context, index) => separatorBuilder,
      itemCount: itemCount,
    );
  }
}
