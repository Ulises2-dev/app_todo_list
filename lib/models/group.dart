class Group {
  int id = 0;
  String name;
  int color;

  Group ({
    required this.name,
    required this.color
  });

  String tasksDescription() {
    // final tasksCompleted = tasks.where((task) => task.completed).length;
    // if (tasks.isEmpty) {
    //  return '';
    // }
    // return '$tasksCompleted of ${tasks.lenght}';
    return '0 of 3';
  }
}
