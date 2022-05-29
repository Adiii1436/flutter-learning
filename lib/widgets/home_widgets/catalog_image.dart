import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myapp/widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .rounded
        .p12
        .color(MyTheme.creamColor)
        .make()
        .p12()
        .w40(context)
        .h20(context);
  }
}
