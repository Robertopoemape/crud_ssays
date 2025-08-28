import '../../domain/entities/description.dart';
import '../../domain/repositories/description_repository.dart';

class GetDescriptions {
  final IDescriptionRepository repository;

  GetDescriptions(this.repository);

  Future<List<Description>> call() => repository.getDescriptions();
}
