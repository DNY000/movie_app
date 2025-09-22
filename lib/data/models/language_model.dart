import 'package:loadmore/domain/entities/language_entity.dart';

class LanguageModel extends LanguageEntity {
  const LanguageModel({
    required super.id,
    required super.name,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['iso_639_1'],
      name: json['english_name'],
    );
  }
}
