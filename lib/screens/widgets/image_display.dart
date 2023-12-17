import 'package:assessment2023/utils/extensions/screen_size.dart';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay({super.key, required this.urlImage});
  final String? urlImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: context.getWidth(divide: 2),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: kElevationToShadow[1],
          borderRadius: BorderRadius.circular(context.getWidth(divide: 2) / 8)),
      child: Image.network(
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Center(
              child: const Icon(
            Icons.error,
            size: 150,
          ));
        },
        urlImage ?? "",
        fit: BoxFit.cover,
      ),
    );
  }
}
