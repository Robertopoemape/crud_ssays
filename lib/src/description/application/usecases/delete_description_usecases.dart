import '../../domain/repositories/description_repository.dart';

class DeleteDescription {
  final IDescriptionRepository repository;

  DeleteDescription(this.repository);

  Future<void> call(String id) {
    return repository.deleteDescription(id);
  }
}
