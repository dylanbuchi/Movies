import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            title,
            textScaleFactor: 1.2,
          ),
        ),
        leading: Container(
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.fitHeight),
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.movie,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                padding: EdgeInsets.only(left: 20),
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
