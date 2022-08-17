import 'package:hive/hive.dart';

part 'Datamodel.g.dart';

@HiveType(typeId: 0)
class Records extends HiveObject {
  @HiveField(0)
  String? courseTitle;

  @HiveField(1)
  int? absentee;

  Records({this.courseTitle, this.absentee});
}

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? semester;

  Person({this.name, this.semester});
}
