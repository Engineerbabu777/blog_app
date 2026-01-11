import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SucessType> {
  Future<Either<Failure, SucessType>> call();
}
