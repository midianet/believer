import 'package:believer/model/classtype.dart';
import 'package:believer/model/level.dart';

class Classroom {
  DateTime date;
  String teacher;
  String photo;
  Level level;
  Classtype type;
  String name;
  String theme;
  Classroom(this.date, this.teacher, this.photo, this.level, this.type, this.name, this.theme);
}