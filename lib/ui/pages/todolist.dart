import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<StatefulWidget> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final List<MapEntry<String, bool>> _todo =
      List.generate(5, (index) => MapEntry('$index', false));
  final _todoController = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todoリスト'),
        ),
        body: ListView(
          children: [
            TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                labelText: '新しい項目'
              ),
              onChanged: (String? input) {
                if (input == null) {
                  return;
                }
                setState(() {
                  _isValid = input.isNotEmpty;
                });
              },
            ),
            ElevatedButton(
                onPressed: _isValid
                  ? () {
                    setState(() {
                      _todo.add(MapEntry(_todoController.text, false));
                      _todoController.clear();
                      _isValid = false;
                    });
                  }
                : null,
                child: const Text('追加'),
            ),
            for (int i = 0; i < _todo.length; ++i)
              CheckboxListTile(
              value: _todo[i].value,
              onChanged: (checked) {
                if (checked == null) {
                  return;
                }
                setState(() {
                  _todo[i] = MapEntry(_todo[i].key, checked);
                });
              },
              title: Text(_todo[i].key),
            ),
          ],
        ),
      );
  }
}