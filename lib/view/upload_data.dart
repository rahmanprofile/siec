import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siec/controller/db_helper.dart';
import 'package:siec/view/main_widget.dart';

import 'local_page.dart';

class UploadData extends StatefulWidget {
  const UploadData({super.key});

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final taskController = TextEditingController();
  bool selectedValue = false;
  final __dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Data"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: taskController,
              style: GoogleFonts.inter(),
              decoration: InputDecoration(
                hintText: 'Enter title',
                hintStyle: GoogleFonts.inter(),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Text('Mark as Complete/Incomplete',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final newTask = NewTask(title: taskController.text, isComplete: selectedValue);
                  await __dbHelper.insertTask(newTask);
                  setState(() {});
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainWidget()), (route) => false);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
