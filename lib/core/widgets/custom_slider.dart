import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sham/core/models/ad_pop_up_model.dart';

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

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.imageUrls.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.imageUrls[_currentIndex].launchURL(context);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   // color: Colors.white,
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //     color: Colors.grey.withOpacity(0.5),
        //   //     spreadRadius: 5,
        //   //     blurRadius: 7,
        //   //     offset: const Offset(0, 3), // changes position of shadow
        //   //   ),
        //   // ],
        // ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imageUrls[_currentIndex].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}