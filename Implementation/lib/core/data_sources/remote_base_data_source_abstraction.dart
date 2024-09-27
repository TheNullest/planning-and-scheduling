import 'package:zamaan/core/utils/typedef.dart';

//TODO implement this
abstract class RemoteBaseDataSourceAbstraction {
  ResultFutureVoid createEntity({required newEntity}) {
    throw UnimplementedError();
  }

  ResultFutureVoid deleteEntity({required String id}) {
    throw UnimplementedError();
  }

  ResultFutureVoid dispose() {
    throw UnimplementedError();
  }

  ResultFuture<List> getEntities() {
    throw UnimplementedError();
  }

  ResultFuture getEntity({required String id}) {
    throw UnimplementedError();
  }

  ResultFutureVoid updateEntity({required entity}) {
    throw UnimplementedError();
  }
}
