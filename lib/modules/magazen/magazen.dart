//import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sham/core/widgets/custom_ad_pop_up.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../Layout/cubit/home_cubit.dart';

class Magazen extends StatefulWidget {
  const Magazen({Key? key}) : super(key: key);

  @override
  State<Magazen> createState() => _MagazenState();
}

class _MagazenState extends State<Magazen> {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) => _showAdPopup());
    HomeCubit.get(context).fetchPdfLink(collectionPath: 'magazen');
  }







Future<void> _showAdPopup() async {
  final adData = await HomeCubit.get(context).featchMagazenAdPopUpData(); // Replace with your document ID
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
        // Show a loading indicator while fetching the PDF link
        if (state is loadPDFLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // If the PDF link is successfully fetched
        if (state is loadPDFSucces) {
          return SfPdfViewer.network(
            cubit.pdfLink,
            key: _pdfViewerKey,
          );

        }

        // Handle errors or loading state
        return Center(child: Text("Failed to load PDF."));
      },
    );
  }


}