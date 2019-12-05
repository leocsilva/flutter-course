import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart' as cart;

class CartItem extends StatelessWidget {
  final cart.CartItem cartItem;

  CartItem(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you whant to remove the item from the cart?'),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<cart.Cart>(context, listen: false).removeItem(cartItem.id);
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(cartItem.id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
                child: FittedBox(child: Text('\$${cartItem.product.price}'))),
            title: Text(cartItem.product.title),
            subtitle:
                Text('Total: \$${cartItem.product.price * cartItem.quantity}'),
            trailing: Text('${cartItem.quantity} x'),
          ),
        ),
      ),
    );
  }
}
