import 'package:flutter/material.dart';
import 'package:loadmore/core/common/appbar/custom_appbar.dart';
import 'package:loadmore/core/common/card/movie_card_horizontal_widget.dart';
import 'package:loadmore/core/common/listview/listview_vertical_widget.dart';
import 'package:loadmore/core/config/colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 56),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: 'My Favorite'),
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
