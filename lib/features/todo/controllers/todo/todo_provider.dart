import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management/helpers/db_helper.dart';
import 'package:task_management/models/todo.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Todo> build() => [];

  void refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => Todo.fromJson(e)).toList();
  }

  void addItem(Todo todo) async {
    await DBHelper.createItem(todo);
    refresh();
  }

  void updateItem(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await DBHelper.updateItem(
        id, title, desc, isCompleted, date, startTime, endTime);
    refresh();
  }

  void deleteItem(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await DBHelper.updateItem(id, title, desc, 1, date, startTime, endTime);
    refresh();
  }

  String getTodayTodos() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  List<String> last30days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));

    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(const Duration(days: 1));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(Todo todo) {
    bool? isCompleted;
    if (todo.isCompleted == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
