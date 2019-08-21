import 'package:flutter/material.dart';
import 'package:movies/providers/auth.dart';
import 'package:movies/screens/home.dart';

import 'package:movies/screens/order_screen.dart';

import 'package:movies/screens/products_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text(
              "Menu",
            ),
            automaticallyImplyLeading: false,
          ),
          MenuTile(
            icon: Icons.history,
            text: Text("History"),
            navigation: () =>
                Navigator.of(context).pushReplacementNamed(OrderScreen.page),
          ),
          Divider(),
          MenuTile(
            icon: Icons.local_movies,
            text: Text("Movies"),
            navigation: () =>
                Navigator.of(context).pushReplacementNamed(ProductScreen.page),
          ),
          Divider(),
          MenuTile(
            icon: Icons.home,
            text: Text("Home"),
            navigation: () =>
                Navigator.of(context).pushReplacementNamed(MyHomePage.page),
          ),
          Divider(),
          MenuTile(
            icon: Icons.exit_to_app,
            text: Text("Log out"),
            navigation: () =>
                Provider.of<Auth>(context, listen: false).logout(),
            //Navigator.of(context).pushReplacementNamed(MyHomePage.page),
          ),
        ],
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final Text text;
  final Function navigation;

  const MenuTile({
    this.icon,
    this.text,
    this.navigation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 25,
        ),
        title: text,
        onTap: navigation,
      ),
    );
  }
}
/* /*               Navigator.of(context).pushReplacementNamed(
                 */ProductDetailScreen.page, */
