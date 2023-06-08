import 'package:assessment2023/UI/components/Images/dispaly_Image_widget.dart';
import 'package:assessment2023/UI/components/Text/Text_label_widget.dart';
import 'package:assessment2023/UI/components/tagsWidget/FactsWidget.dart';
import 'package:assessment2023/data/models/news.dart';
import 'package:assessment2023/utils/Method/OpenBrowser.dart';
import 'package:assessment2023/utils/constants/public_variables.dart';
import 'package:assessment2023/utils/extensions/SizeScreen.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as News;
    String? urlImage;
    argument.media.map((e) {
      urlImage = e.mediametadata.last.url.trim();
    }).toList();

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextLabelWidget(
                text: argument.title,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DispalyImageWidget(
            urlImage: urlImage ?? PublicVariables.imagePlaceholder,
            size: context.screenWith(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextLabelWidget(
              text: argument.abstract,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextLabelWidget(
                    text: argument.byline,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextLabelWidget(
                    text: argument.publishedDate,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          if (argument.desFacet.isNotEmpty)
            FactsWidget(
              title: "categories",
              facet: argument.desFacet,
            ),
          if (argument.geoFacet.isNotEmpty)
            FactsWidget(
              title: "Geographic locations",
              facet: argument.geoFacet,
            ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  backgroundColor: Colors.blue[900],
                ),
                // ignore: void_checks
                onPressed: () => openBrowser(urlArt: argument.url),
                child: const Text("Read Article")),
          ),
        ],
      ),
    );
  }
}
