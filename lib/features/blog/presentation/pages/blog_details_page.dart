import 'package:blogger/features/blog/domain/entities/blog_entities.dart';
import 'package:flutter/material.dart';

class BlogDetailsPage extends StatelessWidget {
  static route(Blog blog) => MaterialPageRoute(builder: (context) {
        return BlogDetailsPage(blog: blog);
      });
  final Blog blog;
  const BlogDetailsPage({
    super.key,
    required this.blog,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
