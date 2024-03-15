import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siec/controller/db_helper.dart';
import 'package:siec/view/upload_data.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({super.key});

  @override
  State<LocalPage> createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  final __dbHelper = DatabaseHelper();

  final taskController = TextEditingController();
  List<NewTask> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Data'),
      ),
      body: FutureBuilder<List<NewTask>>(
        future: __dbHelper.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
                    child: const Center(child: Icon(CupertinoIcons.doc_chart)),
                  ),
                  title: Text(task.title),
                  subtitle: Text(task.isComplete ? 'Complete' : 'Incomplete'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadData()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class NewTask {
  final int? id;
  final String title;
  final bool isComplete;

  NewTask({
    this.id,
    required this.title,
    required this.isComplete,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isComplete': isComplete ? 1 : 0,
    };
  }

  factory NewTask.fromJson(Map<String, dynamic> json) {
    return NewTask(
      id: json['id'],
      title: json['title'],
      isComplete: json['isComplete'] == 1,
    );
  }
}
