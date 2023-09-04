// TODO(Viktor): use dartz
abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}
