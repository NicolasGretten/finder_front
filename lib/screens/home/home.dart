import 'package:flutter/material.dart';
import 'package:freshbuyer/components/product_card.dart';
import 'package:freshbuyer/screens/home/hearder.dart';
import 'package:freshbuyer/screens/home/most_popular.dart';
import 'package:freshbuyer/screens/home/search_field.dart';
import 'package:freshbuyer/screens/home/special_offer.dart';
import 'package:freshbuyer/screens/mostpopular/most_popular_screen.dart';
import 'package:freshbuyer/screens/special_offers/special_offers_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../graphql_operation/queries/findAllPost.dart';

class GraphQLWidgetScreen extends StatelessWidget {
  const GraphQLWidgetScreen({super.key});
  static String route() => '/home';
  @override
  Widget build(BuildContext context) {
    var httpLink = HttpLink('http://localhost:8080/');

    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        // child: MyHomePage(title: 'GraphQL Widget'),
        child: MaterialApp(
            home: Scaffold(
              body: Query(
                  options: QueryOptions(
                      document: gql(findAllPost),
                      variables: const <String, dynamic>{"variableName": "value"}),
                  builder: (result, {fetchMore, refetch}) {
                    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
                    if (result.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (result.data == null) {
                      return const Center(
                        child: Text("No article found!"),
                      );
                    }
                    final posts = result.data!['allPosts'];
                    return Scaffold(
                      body: CustomScrollView(
                        slivers: <Widget>[
                          SliverPadding(
                            padding: const EdgeInsets.only(top: 24),
                            sliver: SliverAppBar(
                              backgroundColor: Colors.white,
                              pinned: true,
                              flexibleSpace: HomeAppBar(),
                            ),
                          ),
                          SliverPadding(
                            padding: padding,
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                ((context, index) => _buildBody(context)),
                                childCount: 1,
                              ),
                            ),
                          ),
                          SliverPadding(
                              padding: padding,
                            sliver: SliverGrid(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 185,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 16,
                                mainAxisExtent: 285,
                              ),
                              delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){
                                return ProductCard(
                                        data: posts[index],
                                        // ontap: (data) => Navigator.pushNamed(context, ShopDetailScreen.route()),
                                  );
                                }, childCount: posts.length),
                            ),
                          ),
                          const SliverAppBar(backgroundColor: Colors.white, flexibleSpace: SizedBox(height: 24))
                        ],
                      ),
                    );
                    // return ListView.builder(
                    //   itemCount: posts.length,
                    //   itemBuilder: (context, index) {
                    //     final post = posts[index];
                    //     final title = post['title'];
                    //     final price = post['price'];
                    //     final coverImageURL = post!['images'][0]['url'];
                    //     return BlogRow(
                    //       title: title,
                    //       price: price ?? 0,
                    //       coverURL: coverImageURL,
                    //     );
                    //   },
                    // );
                  }),
            )),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SearchField(),
        const SizedBox(height: 24),
        SpecialOffers(onTapSeeAll: () => _onTapSpecialOffersSeeAll(context)),
        const SizedBox(height: 24),
        MostPopularTitle(onTapseeAll: () => _onTapMostPopularSeeAll(context)),
        const SizedBox(height: 24),
        const MostPupularCategory(),
      ],
    );
  }

  void _onTapMostPopularSeeAll(BuildContext context) {
    Navigator.pushNamed(context, MostPopularScreen.route());
  }

  void _onTapSpecialOffersSeeAll(BuildContext context) {
    Navigator.pushNamed(context, SpecialOfferScreen.route());
  }
}
