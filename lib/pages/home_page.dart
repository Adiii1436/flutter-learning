// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/utlx/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myapp/models/catalog.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

// import 'package:http/http.dart' as http;

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
    await Future.delayed(const Duration(seconds: 1));
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
    final cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(8, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          onPressed: () {
            context.vxNav.push(Uri.parse(MyRoute.cartRoute));
          },
          backgroundColor: Colors.lightBlue,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.pink500,
            size: 20,
            count: cart.items.length,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CatalogHeader(),
            if (CatalogModel.items.isNotEmpty)
              const CatalogList().py16().expand()
            else
              const CircularProgressIndicator().centered().py16().expand()
          ]),
        ),
      ),
    );
  }
}
