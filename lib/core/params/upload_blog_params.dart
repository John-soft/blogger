import 'dart:io';

class UploadBlogParams {
  final String psoterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.psoterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
