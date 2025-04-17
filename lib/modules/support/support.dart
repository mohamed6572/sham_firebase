import 'package:flutter/material.dart';
import 'package:sham/core/utils/app_images.dart';
import 'package:sham/core/widgets/ronded_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';



class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الدعم',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'للتواصل معنا:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesWhatsapIcon, width: 24, height: 24
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '95516675 (واتساب فقط)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ), const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email_outlined),
                      const SizedBox(width: 8.0),
                      Text(
                        '(البريد الإلكتروني)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'albalushi.mohammed1981@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  // Helper method to build a section with a title and list
  Widget buildSection({required String title, required List<String> content}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,textDirection: TextDirection.rtl,

            ),
            const SizedBox(height: 12.0),
            // Content List
            ...content.map(
                  (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),  Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}