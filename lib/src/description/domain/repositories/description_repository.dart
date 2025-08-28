import '../entities/description.dart';

abstract class IDescriptionRepository {
  Future<List<Description>> getDescriptions();
  Future<void> createDescription(Description description);
  Future<void> updateDescription(Description description);
  Future<void> deleteDescription(String id);
}
