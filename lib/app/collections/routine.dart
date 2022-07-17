import 'package:isar/isar.dart';
import 'category.dart';
part 'routine.g.dart';

// category, title, start time, day
@Collection()
class Routine {
  @Id()
  int id = Isar.autoIncrement;

  late String title;

  @Index()
  late String startTimeRoutine; // data will be recorded according to startTime

  @Index(caseSensitive: false)
  late String day;

  @Index(composite: [CompositeIndex('title')])
  final category = IsarLink<Category>();
}
