import '../../domain/entities/description.dart';
import '../../domain/repositories/description_repository.dart';
import '../datasources/description_local_datasources.dart';
import '../models/description_model.dart';

class DescriptionRepositoryImpl implements IDescriptionRepository {
  final DescriptionLocalDataSource dataSource;

  DescriptionRepositoryImpl(this.dataSource);

  @override
  Future<List<Description>> getDescriptions() => dataSource.getDescriptions();

  @override
  Future<void> createDescription(Description description) =>
      dataSource.addDescription(
        DescriptionModel(id: description.id, value: description.value),
      );

  @override
  Future<void> updateDescription(Description description) =>
      dataSource.updateDescription(
        DescriptionModel(id: description.id, value: description.value),
      );

  @override
  Future<void> deleteDescription(String id) => dataSource.deleteDescription(id);
}
