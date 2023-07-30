const String findAllPost = r'''
  query Query {
  allPosts {
    title
    price
    images {
      url
    }
  }
}
''';