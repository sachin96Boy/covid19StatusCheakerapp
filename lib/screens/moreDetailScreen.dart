import '../../data/covidData.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';

class MoreDetailScreen extends StatelessWidget {
  static const routeName = '/moreDetailsScreen';

  // const MoreDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final covidData = Provider.of<CovidData>(context);
    final dataInstance = covidData.data;

    var dateInstance;

    dataInstance.forEach((element) {
      dateInstance = element.updateDate;
    });

    print(dateInstance);

    const url =
        "https://www.epid.gov.lk/web/images/pdf/corona_virus_report/sitrep-sl-en-17-09_10_21.pdf";
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
          child: const PDF(swipeHorizontal: true).cachedFromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      )),
    );
  }
}