import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalPrize}".text.xl5.color(context.accentColor).make(),
        30.widthBox,
        ElevatedButton(
                onPressed: (() {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make()));
                }),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: "Buy".text.white.make())
            .w24(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () {
                        _cart.remove(_cart.items[index]);
                        // setState(() {});
                      },
                      icon: Icon(Icons.remove)),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
