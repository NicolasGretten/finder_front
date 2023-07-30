import 'package:flutter/material.dart';

class BlogRow extends StatelessWidget {
  final String title;
  final int price;
  final String coverURL;

  const BlogRow({
    Key? key,
    required this.title,
    required this.price,
    required this.coverURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child:  Image.network(coverURL)
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  price.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}