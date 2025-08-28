import '../../domain/entities/description.dart';
import '../../domain/repositories/description_repository.dart';

class UpdateDescription {
  final IDescriptionRepository repository;

  UpdateDescription(this.repository);

  Future<void> call(Description description) {
    return repository.updateDescription(description);
  }
}
