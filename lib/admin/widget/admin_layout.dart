import 'package:flutter/material.dart';
import 'package:sham/admin/widget/admin_add_pop_up.dart';
import 'package:sham/admin/widget/admin_magazin.dart';
import 'package:sham/admin/widget/admin_post_list_widget.dart';
import 'package:sham/core/widgets/ronded_app_bar.dart';

class AdminLayout extends StatelessWidget {
  AdminLayout({super.key});
  List<Map<String, String>> data = [
    {'name': 'السبلة', 'collection': 'sabla'},
    {'name': 'الملعب', 'collection': 'malab'},
    {'name': 'السوق', 'collection': 'souq'},
    {'name': 'المجلة', 'collection': 'magazen'},
    {'name': 'اعلان الصفحة الرئيسية', 'collection': 'adPopUp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'صفحه التحكم', showBackButton: false, IFcreate: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${data[index]['name']}'),
                onTap: () {
                  if(data[index]['collection'] == 'sabla' || data[index]['collection'] == 'malab' || data[index]['collection'] == 'souq') {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            AdminPostListWidget(
                                collectionName: data[index]['collection'] ??
                                    '', title:
                            data[index]['collection'] == 'sabla' ? 'السبلة' : data[index]['collection'] == 'malab' ? 'الملعب' : 'السوق'



                              ,)));
                  }
                  if(data[index]['collection'] == 'magazen') {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminMagazin()));}
                  if(data[index]['collection'] == 'adPopUp') {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminAddPopUp()));

                  }

                  },
                //add divider
                trailing: Icon(Icons.arrow_forward_ios),
              );
            },
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
