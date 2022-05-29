import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myapp/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalog App',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: context.accentColor),
        ),
        Text(
          "Trending Products",
          style: TextStyle(fontSize: 15.5, color: context.accentColor),
        )
      ],
    );
  }
}
