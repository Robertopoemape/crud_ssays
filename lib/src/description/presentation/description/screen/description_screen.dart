import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/description.dart';
import '../providers/description_provider.dart';
import '../widgets/description_form.dart';
import 'package:uuid/uuid.dart';

class DescriptionScreen extends ConsumerWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(descriptionNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("CRUD Descripciones")),
      body: state.when(
        data: (descriptions) => ListView.builder(
          itemCount: descriptions.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(descriptions[i].value),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => ref
                  .read(descriptionNotifierProvider.notifier)
                  .removeDescription(descriptions[i].id),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => DescriptionForm(
                  initialValue: descriptions[i].value,
                  onSubmit: (val) {
                    ref
                        .read(descriptionNotifierProvider.notifier)
                        .editDescription(
                          Description(id: descriptions[i].id, value: val),
                        );
                  },
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => DescriptionForm(
              onSubmit: (val) {
                ref
                    .read(descriptionNotifierProvider.notifier)
                    .addDescription(
                      Description(id: const Uuid().v4(), value: val),
                    );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
