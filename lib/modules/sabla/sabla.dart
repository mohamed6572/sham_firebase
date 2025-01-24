import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sham/Layout/cubit/home_cubit.dart';
import 'package:sham/core/widgets/post_view_widget.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/consttant/const.dart';
import '../../core/widgets/custom_ad_pop_up.dart';


class Sabla extends StatefulWidget {
  const Sabla({Key? key}) : super(key: key);

  @override
  State<Sabla> createState() => _SablaState();
}

class _SablaState extends State<Sabla> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showAdPopup());
    HomeCubit.get(context).fetchPosts(collectionName: 'sabla');
  }





Future<void> _showAdPopup() async {
  final adData = await HomeCubit.get(context).featchSablaAdPopUpData(); // Replace with your document ID
  if (adData != null) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing without interaction
      builder: (_) => CustomAdPopup(adPopUpModel: adData,

      ),
    );
  }
}
  @override
  Widget build(BuildContext context) {
  var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is loadPostLoading ? Center(child: CircularProgressIndicator(),):
        RefreshIndicator(child:
        AnimationLimiter(
          child: ListView.builder(
            itemCount: cubit.sablaPosts.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: PostViewWidget(
                      postModel: cubit.sablaPosts[index],
                    ),
                  ),
                ), //
              );
            },
          ),
        ),

            onRefresh: () async {

              HomeCubit.get(context).fetchPosts(collectionName: 'sabla');
            });
      },
    );
  }
}





