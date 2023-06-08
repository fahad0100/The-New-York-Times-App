import 'package:assessment2023/UI/components/Text/Text_label_widget.dart';
import 'package:assessment2023/UI/components/Images/dispaly_Image_widget.dart';
import 'package:assessment2023/utils/constants/padding_constants.dart';
import 'package:assessment2023/utils/constants/spacing_constants.dart';
import 'package:assessment2023/utils/extensions/SizeScreen.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.title,
    required this.description,
    required this.byline,
    required this.section,
    required this.publishedDate,
    required this.imageURL,
  });
  final String imageURL;
  final String title;
  final String description;
  final String byline;
  final String section;
  final String publishedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextLabelWidget(
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    spaceH16,
                    Padding(
                      padding: const EdgeInsets.only(
                        left: padding8,
                        right: padding8,
                      ),
                      child: TextLabelWidget(
                        text: description,
                        fontSize: 12,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: padding16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextLabelWidget(
                              text: byline,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey,
                              fontSize: 10,
                              maxLine: 1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextLabelWidget(
                              text: publishedDate,
                              fontWeight: FontWeight.w200,
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: DispalyImageWidget(
                        urlImage: imageURL,
                        size: context.screenWith() / 3,
                      ),
                    ),
                    spaceH16,
                    TextLabelWidget(
                      text: section,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
