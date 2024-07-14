import '../utils/result.dart';

abstract class IUsecase<Output extends Result, Input> {
  Future<Output> call(Input params);
}
