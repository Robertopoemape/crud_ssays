import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/usecases/create_description_usecases.dart';
import '../../../application/usecases/delete_description_usecases.dart';
import '../../../application/usecases/get_description_usecases.dart';
import '../../../application/usecases/update_description_usecases.dart';
import '../../../domain/entities/description.dart';
import '../../../infrastructure/datasources/description_local_datasources.dart';
import '../../../infrastructure/repositories/description_repository_impl.dart';

class DescriptionNotifier extends StateNotifier<AsyncValue<List<Description>>> {
  final GetDescriptions getDescriptions;
  final CreateDescription createDescription;
  final UpdateDescription updateDescription;
  final DeleteDescription deleteDescription;

  DescriptionNotifier({
    required this.getDescriptions,
    required this.createDescription,
    required this.updateDescription,
    required this.deleteDescription,
  }) : super(const AsyncValue.loading()) {
    loadDescriptions();
  }

  Future<void> loadDescriptions() async {
    state = const AsyncValue.loading();
    try {
      final list = await getDescriptions();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addDescription(Description description) async {
    await createDescription(description);
    await loadDescriptions();
  }

  Future<void> editDescription(Description description) async {
    await updateDescription(description);
    await loadDescriptions();
  }

  Future<void> removeDescription(String id) async {
    await deleteDescription(id);
    await loadDescriptions();
  }
}

final descriptionRepositoryProvider = Provider((ref) {
  final datasource = DescriptionLocalDataSource();
  return DescriptionRepositoryImpl(datasource);
});

final descriptionNotifierProvider =
    StateNotifierProvider<DescriptionNotifier, AsyncValue<List<Description>>>((
      ref,
    ) {
      final repo = ref.watch(descriptionRepositoryProvider);

      return DescriptionNotifier(
        getDescriptions: GetDescriptions(repo),
        createDescription: CreateDescription(repo),
        updateDescription: UpdateDescription(repo),
        deleteDescription: DeleteDescription(repo),
      );
    });
