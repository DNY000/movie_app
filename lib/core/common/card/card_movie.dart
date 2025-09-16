import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/button/custom_button_app.dart';
import 'package:loadmore/core/config/colors.dart';

class CardMovieVertical extends StatelessWidget {
  const CardMovieVertical({
    super.key,
    required this.rating,
    required this.image,
    required this.nameMoive,
    required this.action,
    required this.onTap,
  });

  final double rating;
  final String image;
  final String nameMoive;
  final List<String> action;
  final VoidCallback onTap;

  bool _isNetworkImage(String path) {
    return Uri.tryParse(path)?.isAbsolute == true;
  }

  @override
  Widget build(BuildContext context) {
    return CustomButtonApp(
      height: 230.h,
      radius: 8,
      onPress: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _isNetworkImage(image)
                  ? Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.error, color: Colors.white),
                        );
                      },
                    )
                  : Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.error, color: Colors.white),
                        );
                      },
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameMoive,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  children: action
                      .map((e) => CustomChoiceChip(
                            name: e,
                            onSelected: (_) {},
                            selected: false,
                            selectedColor: kYellowColor,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CardMovieHorizontal extends StatelessWidget {
  const CardMovieHorizontal({
    super.key,
    required this.rating,
    required this.image,
    required this.nameMoive,
    required this.action,
    required this.timeMovie,
    this.favorite = false,
  });

  final double rating;
  final String image;
  final String nameMoive;
  final List<String> action;
  final bool favorite;
  final double timeMovie;

  @override
  Widget build(BuildContext context) {
    return CustomButtonApp(
      height: 120.h,
      radius: 12,
      onPress: () {},
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.error, color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameMoive,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children:
                            action
                                .map(
                                  (e) => CustomChoiceChip(
                                    name: e,
                                    onSelected: (p0) {},
                                    selected: false,
                                    selectedColor: kYellowColor,
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (favorite)
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                height: 28,
                width: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF29293A),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.favorite, color: kYellowColor, size: 18),
                ),
              ),
            ),
        ],
      ),
    );
  }
}




class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.name,
    required this.selected,
    required this.onSelected,
    this.textStyle,
    this.selectedColor,
    this.backgroundColor,
  });

  final String name;
  final bool selected;
  final void Function(bool) onSelected;
  final TextStyle? textStyle;
  final Color? selectedColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        name,
        style:
            textStyle ??
            TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
      selected: selected,
      onSelected: onSelected,
      selectedColor: selectedColor ?? Colors.yellow,
      backgroundColor: backgroundColor ?? const Color(0xFF2F2F3A),
      padding:EdgeInsets.zero,
      shape: const StadiumBorder(side: BorderSide.none),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    //  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
