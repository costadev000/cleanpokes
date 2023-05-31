import 'package:hive/hive.dart';

part 'options_dto.g.dart';

@HiveType(typeId: 2)
class OptionsDto {
  @HiveField(1)
  final String? nextPage;
  @HiveField(2)
  final DateTime? lastUpdate;

  OptionsDto({
    this.nextPage,
    this.lastUpdate,
  });
  Map<String, dynamic> toMap() {
    return {
      'nextPage': nextPage,
      'lastUpdate': lastUpdate?.toLocal().toString(),
    };
  }

  @override
  String toString() {
    return "{'nextPage': $nextPage, 'lastUpdate': ${lastUpdate?.toLocal().toString()}}";
  }
}
