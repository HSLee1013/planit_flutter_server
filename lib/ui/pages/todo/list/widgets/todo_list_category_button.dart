import 'package:flutter/material.dart';
import 'package:planit/ui/widgets/dialogs/sort_todo_dialog.dart';

class TodoListCategoryButton extends StatelessWidget {
  const TodoListCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('작업 정렬'),
      onPressed: () {
        Navigator.pop(context);
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => SortTodoDialog());
      },
    );
  }
}
