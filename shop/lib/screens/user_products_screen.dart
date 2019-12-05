import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';


class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-product';

  @override
  Widget build(BuildContext context) {

    Products productsProvider = Provider.of<Products>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Your products'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          },)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsProvider.items.length,
          itemBuilder: (ctx, index) => UserProductItem(productsProvider.items[index]),
        ),
      ),
    );
  }
}
