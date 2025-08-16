import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedFile;

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['srt'],
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name;
      });
      print("Selected file: ${result.files.first.name}");
    } else {
      setState(() {
        selectedFile = "No file selected";
      });
      print("User canceled file selection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home screen")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: selectFile,
              child: const Text("Select a subtitle file"),
            ),
            const SizedBox(height: 20),
            Text(
              selectedFile ?? "No file selected",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
