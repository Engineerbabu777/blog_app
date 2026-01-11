import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SucessType, Params> {
  Future<Either<Failure, SucessType>> call(Params params);
}
