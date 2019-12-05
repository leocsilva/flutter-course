import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {

  final Product product;

  UserProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(product.title),
          leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
          trailing: Container(
            width: 100,
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.edit), onPressed: (){
                  Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: product);
                }, color: Theme.of(context).primaryColor),
                IconButton(icon: Icon(Icons.delete), onPressed: (){
                  Provider.of<Products>(context).deleteProduct(product.id);
                }, color: Theme.of(context).errorColor)
              ],
            ),
          ),
          
        ),
        Divider()
      ],
    );
  }
}