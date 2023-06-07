import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DispalyImageWidget extends StatelessWidget {
  const DispalyImageWidget(
      {super.key, required this.urlImage, required this.size});
  final String urlImage;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: urlImage,
        width: size,
        height: size / 2,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
