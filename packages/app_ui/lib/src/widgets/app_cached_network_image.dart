// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageLink,
    this.child,
    this.color,
    this.width,
    this.height,
  });

  final String imageLink;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink,
      color: color,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => SizedBox(child: child),
      errorWidget: (context, url, error) => Image.asset(
        'assets/placeholder.jpg',
        fit: BoxFit.cover,
      ),
      placeholder: (_, url) => CircularProgressIndicator.adaptive(),
      height: height,
      width: width,
      // child: DecoratedBox(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10.0),
      //     color: Colors.black,
      //     image: DecorationImage(
      //       opacity: 0.69,
      //       image: image,
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: child,
      // ),
    );
  }
}
