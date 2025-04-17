import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sham/core/consttant/const.dart';
import 'package:sham/core/models/post_model.dart';
import 'package:sham/core/utils/app_colors.dart';
import 'package:sham/core/utils/app_images.dart';
import 'package:sham/modules/image_preview_screen/image_preview_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class PostViewDetailsWidget extends StatelessWidget {
  const PostViewDetailsWidget({super.key, required this.postModel});
  final PostModel postModel;
///take the model from here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreviewScreen(imagePath: testIMageUrl)));
            //   },
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(20),
            //       bottomRight: Radius.circular(20),
            //     ),
            //     child: Image.asset(Assets.imagesAppIcon,
            //
            //       height: 220,
            //       width: double.infinity,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                ///path the image link
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ImagePreviewScreen(imagePath: postModel.image)));
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.indigoAccent,
                      width: 2,
                    ),
                  ),
                ),
                child: Image.network(
                  postModel.image,
                  height: 220,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '. ${postModel.title}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider( color: AppColors.primaryColor,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text(
                        'محمد بنسالم البوشي  شبكة صحم',
                        style: TextStyle(
                          fontSize: 12,

                        ),
                      ),  Text(
                        ' : ناشر المحتوى', style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                    ],
                  ),
                  Divider(
                    color:AppColors.primaryColor,

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    ' . ${postModel.discription}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:postModel.url !=null ||postModel.url!.isNotEmpty? BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async{
              print('url: ${postModel.url}');
                  if(postModel.url != null) {
                    print('url not: ${postModel.url}');
                try {
                  await launchUrl(
                    Uri.parse(postModel.url??''),
                    mode: LaunchMode.externalApplication,
                  );
                } on Exception catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('لا يمكن فتح الرابط',textAlign: TextAlign.center,),
                    ),
                  );
                }
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('لا يوجد رابط للتصفح',textAlign: TextAlign.center,),
                  ),
                );}

            },
            child: const Text(
              'تصفح',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigoAccent,
            ),
          ),
        ),
      ):Container(),
    );
  }
}
