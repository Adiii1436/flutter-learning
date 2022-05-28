// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/item_widget.dart';
import 'package:myapp/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //*implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogjson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(8, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator())
          ]),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalog App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          "Trending Products",
          style: TextStyle(fontSize: 15.5),
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Buy".text.white.make())
                  ],
                )
              ]),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}

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
        .w40(context);
  }
}
