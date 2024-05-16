import 'package:blogger/core/error/failures.dart';
import 'package:blogger/core/params/upload_blog_params.dart';
import 'package:blogger/core/usecase/usecase.dart';
import 'package:blogger/features/blog/domain/entities/blog_entities.dart';
import 'package:blogger/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class UploadBlog implements UseCase<Blog, UploadBlogParams> {
  final BlogRepository blogRepository;
  UploadBlog(this.blogRepository);
  @override
  Future<Either<Failure, Blog>> call(UploadBlogParams params) async {
    return await blogRepository.uploadBlog(
      image: params.image,
      title: params.title,
      content: params.content,
      posterId: params.psoterId,
      topics: params.topics,
    );
  }
}
