import 'package:equatable/equatable.dart';

class Description extends Equatable {
  final String id;
  final String value;

  const Description({required this.id, required this.value});

  @override
  List<Object?> get props => [value];
}
