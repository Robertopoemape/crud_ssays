import '../../domain/entities/description.dart';
import '../../domain/repositories/description_repository.dart';

class CreateDescription {
  final IDescriptionRepository repository;

  CreateDescription(this.repository);

  Future<void> call(Description description) {
    return repository.createDescription(description);
  }
}
