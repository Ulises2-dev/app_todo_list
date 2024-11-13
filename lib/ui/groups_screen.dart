import 'package:flutter/material.dart';
import 'package:app_todo_list/models/group.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  final _groups = <Group>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
      ),
      body: _groups.isEmpty
          ? const Center(
              child: Text('There are no Groups'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                final group = _groups[index];
                return _GroupItem(
                  onTap: () => _goToTask(group),
                  group: group,
                );
              },
            ),
    );
  }

  void _goToTask(Group group) {
    // Implementación de navegación a tareas del grupo
  }
}

class _GroupItem extends StatelessWidget {
  final Group group;
  final VoidCallback onTap;

  const _GroupItem({required this.group, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final description = group.tasksDescription();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(group.color),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                group.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              if (description.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
