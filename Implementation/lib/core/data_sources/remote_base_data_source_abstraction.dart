import 'package:zamaan/core/utils/typedef.dart';

//TODO implement this
abstract class RemoteBaseDataSourceAbstraction {
  @override
  ResultFutureVoid createEntity({required newEntity}) {
    throw UnimplementedError();
  }

  @override
  ResultFutureVoid deleteEntity({required String id}) {
    throw UnimplementedError();
  }

  @override
  ResultFutureVoid dispose() {
    throw UnimplementedError();
  }

  @override
  ResultFuture<List> getEntities() {
    throw UnimplementedError();
  }

  @override
  ResultFuture getEntity({required String id}) {
    throw UnimplementedError();
  }

  @override
  ResultFutureVoid updateEntity({required entity}) {
    throw UnimplementedError();
  }
}
