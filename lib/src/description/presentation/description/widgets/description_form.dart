import 'package:flutter/material.dart';

class DescriptionForm extends StatefulWidget {
  final String? initialValue;
  final void Function(String) onSubmit;

  const DescriptionForm({super.key, this.initialValue, required this.onSubmit});

  @override
  State<DescriptionForm> createState() => _DescriptionFormState();
}

class _DescriptionFormState extends State<DescriptionForm> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.initialValue == null
            ? 'Nueva Descripción'
            : 'Editar Descripción',
      ),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Descripción'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(_controller.text);
            Navigator.pop(context);
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}
