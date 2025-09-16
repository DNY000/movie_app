import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListView<T> extends StatelessWidget {
  final List<T> data;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final bool isVertical;
  final double? itemHeight;
  final double? itemWidth;

  const CustomListView({
    super.key,
    required this.data,
    required this.itemBuilder,
    this.isVertical = true,
    this.itemHeight,
    this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical ? null : (itemHeight ?? 250.h),
      width: isVertical ? (itemWidth ?? double.infinity) : null,
      child: ListView.separated(
        shrinkWrap: isVertical,
        scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = data[index];
          return itemBuilder(context, item);
        },
        separatorBuilder: (context, index) =>
            isVertical ? SizedBox(height: 12.h) : SizedBox(width: 16.w),
        itemCount: data.length,
      ),
    );
  }
}
