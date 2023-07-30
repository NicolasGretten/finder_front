
import 'package:graphql_flutter/graphql_flutter.dart';

class PopularCategory {
  final String category;
  final String id;

  PopularCategory({this.category = '', this.id = ''});
}

class Product {
  final String title;
  final double price;
  final List<Img> images;

  Product({this.title = '', this.price = 0.0, this.images = const <Img>[] });
}

class Img{
  final String url;

  Img({this.url = '' });
}

final homePopularCategories = [
  PopularCategory(category: 'Tous', id: '1'),
  PopularCategory(category: 'Guitares', id: '2'),
  PopularCategory(category: 'Basses', id: '3'),
  PopularCategory(category: 'Cordes', id: '4'),
  PopularCategory(category: 'Trompettes', id: '5'),
  PopularCategory(category: 'Percussions', id: '6'),
  PopularCategory(category: 'Pianos', id: '7'),
  PopularCategory(category: 'Cuivres', id: '8'),
];

final homePopularProducts = [
  Product(
    title: 'FOoam Padded Chair',
    price: 120.00,
  ),
  Product(
    title: 'Small Bookcase',
    price: 145.40,
  ),
  Product(
    title: 'Glass Lamp',
    price: 40.00,
  ),
  Product(
    title: 'Glass Package',
    price: 55.00,
  ),
  Product(
    title: 'Plastic Chair',
    price: 65.00,
  ),
  Product(
    title: 'Wooden Chairs',
    price: 69.00,
  ),
];
