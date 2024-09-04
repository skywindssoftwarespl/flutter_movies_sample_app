

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const NetworkImageWidget({
    super.key,
    required this.url,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      filterQuality: FilterQuality.high,
      fit: fit,
      placeholder: (context, url) {
        return Center(
          child: Image.asset(
            "//Images.placeHolder",
            fit: BoxFit.fill,
            height: 100,
            width: 100,
          ),
        );
      },
      errorWidget: (context, url, dynamic) => Center(
        child: Image.asset(
          "//Images.placeHolder",
          fit: BoxFit.fill,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
