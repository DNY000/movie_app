import 'package:flutter/material.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/card/movie_card_horizontal_widget.dart';
import 'package:loadmore/core/common/listview/listview_vertical_widget.dart';
import 'package:loadmore/core/config/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {}); // để cập nhật UI khi có text (ẩn/hiện nút clear)
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 24, top: 56, right: 24),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: 'Search'),
              const SizedBox(height: 24),

              SearchTextField(
                controller: _searchController,
                hintText: "Search movie...",
                onClear: () => _searchController.clear(),
                onSearch: () {
                  debugPrint("Search: ${_searchController.text}");
                },
              ),

              const SizedBox(height: 24),
              ListviewVerticalWidget(
                itemCount: 20,
                separatorBuilder: const SizedBox(height: 8),
                child: MovieCardHorizontal(
                  onTap: () {},
                  onPress: () {},
                  actions: const ['Adventure', 'Fantasy', 'Anime'],
                  boderRadius: 8,
                  icon: 'assets/icons/heart.svg',
                  image: 'assets/images/Welcome.png',
                  isFavorite: true,
                  name: 'The Mandalorian',
                  rating: 9.5,
                  time: '1hr 30m',
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Custom search box widget
class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onClear;
  final VoidCallback? onSearch;

  const SearchTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onClear,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: kYellowColor, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, color: Colors.black54, size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              cursorColor: kDarkTextColor,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black45),
                border: InputBorder.none,
              ),
            ),
          ),
          Row(
            children: [
              if (controller.text.isNotEmpty)
                _buildCircleButton(icon: Icons.close, onTap: onClear),
              const SizedBox(width: 6),
              _buildCircleButton(icon: Icons.arrow_forward, onTap: onSearch),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: kDarkTextColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
