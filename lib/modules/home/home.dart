import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sham/Layout/cubit/home_cubit.dart';
import 'package:sham/core/utils/app_images.dart';
import 'package:sham/core/widgets/custom_slider.dart';
import 'package:sham/core/widgets/post_view_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/consttant/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).featchHomeSliderData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesAppIcon, width: 300, height: 300),
                const SizedBox(height: 20),
                // Slider
                HomeCubit.get(context).homeAds.isNotEmpty
                    ? SimpleImageSlider(
                  imageUrls: HomeCubit.get(context).homeAds,
                )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}