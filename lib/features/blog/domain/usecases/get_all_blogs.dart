import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/src/either.dart';

class GetAllBlogsUseCase implements UseCase<List<BlogEntity>, NoParams> {
  final BlogRepository _blogRepository;

  GetAllBlogsUseCase({required BlogRepository blogRepository})
    : _blogRepository = blogRepository;

  @override
  Future<Either<Failure, List<BlogEntity>>> call(NoParams params) async {
    return await _blogRepository.getAllBlogs();
  }
}

class NoParams {}
