

class Group{
  late String direction;
  late int yearCreate;
  late int course;

  Group(this.direction, this.yearCreate, this.course);

  int getCourse(){
    return course;
  }

  @override
  String toString() {
    return '$direction-$yearCreate';
  }
}