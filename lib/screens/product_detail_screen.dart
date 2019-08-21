import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player/youtube_player.dart';

class ProductDetailScreen extends StatefulWidget {
/*   final String title;

  ProductDetailScreen(this.title); */
  static const page = 'product_detail_screen';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: double.infinity,
              child: Hero(
                tag: loadedProduct.imageUrl,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: loadedProduct.imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  loadedProduct.synopsis,
                  style: const TextStyle(fontSize: 24),
                ),
                height: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            YoutubePlayer(
              aspectRatio: 16 / 9,
              hideShareButton: true,
              autoPlay: false,
              switchFullScreenOnLongPress: true,
              context: context,
              source: loadedProduct.trailer,
              quality: YoutubeQuality.HD,
              // callbackController is (optional).
              // use it to control player on your own.
            ),
          ],
        ),
      ),
    );
  }
}
