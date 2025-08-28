import '../../domain/entities/description.dart';

class DescriptionModel extends Description {
  const DescriptionModel({required super.id, required super.value});

  factory DescriptionModel.fromJson(Map<String, dynamic> json) =>
      DescriptionModel(id: json['id'], value: json['value']);

  Map<String, dynamic> toJson() => {'id': id, 'value': value};
}
