import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<String> bannerUrls = [];
  final String apiKey = '206c2602f5254a596f8060e767cd97dc'; // ← Thay bằng API key của bạn

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  Future<void> fetchBanners() async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=vi';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;

        setState(() {
          bannerUrls = results
              .map((movie) => movie['backdrop_path'])
              .where((path) => path != null)
              .map<String>((path) => 'https://image.tmdb.org/t/p/w780$path')
              .toList();
        });
      } else {
        debugPrint('Failed to load banners: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching banners: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return bannerUrls.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : CarouselSlider.builder(
            itemCount: bannerUrls.length,
            itemBuilder: (context, index, realIdx) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  bannerUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
            ),
          );
  }
}
