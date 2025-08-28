import '../models/description_model.dart';

class DescriptionLocalDataSource {
  final List<DescriptionModel> _storage = [];

  Future<List<DescriptionModel>> getDescriptions() async => _storage;

  Future<void> addDescription(DescriptionModel description) async {
    _storage.add(description);
  }

  Future<void> updateDescription(DescriptionModel description) async {
    final index = _storage.indexWhere((e) => e.id == description.id);
    if (index != -1) _storage[index] = description;
  }

  Future<void> deleteDescription(String id) async {
    _storage.removeWhere((e) => e.id == id);
  }
}
