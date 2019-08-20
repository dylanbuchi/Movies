import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  static const String plot = "Resume:";
  static const double price = 9.99;

  List<Movie> _items = [
    Movie(
      id: 'p1',
      title: 'Batman Begins',
      description:
          "A young Bruce Wayne (Christian Bale) travels to the Far East, where he's trained in the martial arts by Henri Ducard (Liam Neeson), a member of the mysterious League of Shadows. When Ducard reveals the League's true purpose -- the complete destruction of Gotham City -- Wayne returns to Gotham intent on cleaning up the city without resorting to murder. With the help of Alfred (Michael Caine), his loyal butler, and Lucius Fox (Morgan Freeman), a tech expert at Wayne Enterprises, Batman is born.",
      price: price,
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SY1000_SX750_AL_.jpg',
      synopsis: plot,
      trailer: "https://www.youtube.com/watch?v=neY2xVmOfUM",
    ),
    Movie(
      id: 'p2',
      title: 'Avatar',
      description:
          "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Because the planet's environment is poisonous, human/Na'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully (Sam Worthington), a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman (Zoe Saldana). As a bond with her grows, he is drawn into a battle for the survival of her world.",
      price: price,
      imageUrl:
          'https://i.pinimg.com/564x/1d/42/8f/1d428fc1bb6d2c3528c02753d6b3559e.jpg',
      synopsis: plot,
      trailer: "https://www.youtube.com/watch?v=6ziBFh3V1aM",
    ),
    Movie(
      id: 'p3',
      title: 'Avengers',
      description:
          "When Thor's evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of S.H.I.E.L.D., initiates a superhero recruitment effort to defeat the unprecedented threat to Earth. Joining Fury's 'dream team' are Iron Man (Robert Downey Jr.), Captain America (Chris Evans), the Hulk (Mark Ruffalo), Thor (Chris Hemsworth), the Black Widow (Scarlett Johansson) and Hawkeye (Jeremy Renner).",
      price: price,
      imageUrl:
          'https://i.pinimg.com/564x/d6/a6/08/d6a608d0db69ed5b40b7dae2aa3a34bc.jpg',
      synopsis: plot,
      trailer: "https://www.youtube.com/watch?v=eOrNdBpGMv8",
    ),
    Movie(
      id: 'p4',
      title: 'Interstellar',
      description:
          "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand (Michael Caine), a brilliant NASA physicist, is working on plans to save mankind by transporting Earth's population to a new home via a wormhole. But first, Brand must send former NASA pilot Cooper (Matthew McConaughey) and a team of researchers through the wormhole and across the galaxy to find out which of three planets could be mankind's new home.",
      price: price,
      imageUrl:
          'https://i.pinimg.com/564x/ff/5b/05/ff5b05afa8de4271f922d2b9eccf61e7.jpg',
      synopsis: plot,
      trailer: "https://www.youtube.com/watch?v=zSWdZVtXT7E",
    ),
  ];
  var _showFavorites = false;

  List<Movie> get items {
    if (_showFavorites == true) {
      return _items.where((items) => items.isFavorite).toList();
    }
    return [..._items];
  }

  List<Movie> get favoriteItems {
    return _items.where((items) => items.isFavorite).toList();
  }

  Movie findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

/*   void showFavorites() {
    _showFavorites = true;
  }

  void showAll() {
    _showFavorites = false;
  } */

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }

  void deleteMovie(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
