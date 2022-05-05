import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';
import '../utility/style.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String image;
  CustomCachedNetworkImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: clipRectBorderRadiusImage,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(
          color: progressIndicatorColorIamgeCached,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
