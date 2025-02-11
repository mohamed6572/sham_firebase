import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sham/core/models/ad_pop_up_model.dart';
import 'package:sham/core/utils/app_colors.dart';

import '../consttant/const.dart';

class SimpleImageSlider extends StatefulWidget {
  final List<AdHomeSliderModel> imageUrls;
  final Duration duration;

  const SimpleImageSlider({
    Key? key,
    required this.imageUrls,
    this.duration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<SimpleImageSlider> createState() => _SimpleImageSliderState();
}

class _SimpleImageSliderState extends State<SimpleImageSlider> {
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (_) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.imageUrls[_currentIndex].launchURL(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrls[_currentIndex].imageUrl,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          const SizedBox(height: 12),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.imageUrls.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentIndex == index ? 10 : 6,
          height: _currentIndex == index ? 10 : 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? primaryColor : Colors.grey,
          ),
        );
      }),
    );
  }
}
