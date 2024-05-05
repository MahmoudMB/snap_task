import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_web/features/home/home_exports.dart';

class AddUsersDialog extends StatefulWidget {
  final Segment item;
  const AddUsersDialog({super.key, required this.item});

  @override
  State<AddUsersDialog> createState() => _AddUsersDialogState();
}

class _AddUsersDialogState extends State<AddUsersDialog> {
  String? userSchemaType;
  List<String> userIds = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text("Add Users To Segment ${widget.item.name}"),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: DropdownButton<String>(
              value: userSchemaType,
              hint: const Text("Select User Schema Type"),
              onChanged: (String? newValue) {
                setState(() {
                  userSchemaType = newValue!;
                });
              },
              items: <String>[
                'EMAIL_SHA256',
                'MOBILE_AD_ID_SHA256',
                'PHONE',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton.icon(
              onPressed: () async {
                userIds = await _pickFile();
                setState(() {});
              },
              icon: const Icon(Icons.upload),
              label: const Text("Load User Ids")),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: userIds.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(userIds[index]),
                  );
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, (userSchemaType, userIds));
              },
              icon: const Icon(Icons.done),
              label: const Text("Add"))
        ],
      ),
    );
  }

  Future<List<String>> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["txt"]);

    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        String fileContent = await getFileContent(filePath);
        return fileContent.split(",").map((e) => e.trim()).toList();
      }
      ;
    } else {
      // User canceled the picker
      print('No file picked.');
      return [];
    }
    return [];
  }

  Future<String> getFileContent(String filePath) async {
    File file = File(filePath);
    return await file.readAsString();
  }
}
