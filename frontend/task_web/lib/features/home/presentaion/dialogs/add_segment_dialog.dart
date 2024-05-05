import 'package:flutter/material.dart';

class AddSegmentDialog extends StatefulWidget {
  const AddSegmentDialog({super.key});

  @override
  State<AddSegmentDialog> createState() => _AddSegmentDialogState();
}

class _AddSegmentDialogState extends State<AddSegmentDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  String? sourceType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text("Add New Segment"),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Segment Name',
            ),
            controller: _nameController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Segment Description',
            ),
            controller: _descController,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: DropdownButton<String>(
              value: sourceType,
              hint: const Text("Select Source Type"),
              onChanged: (String? newValue) {
                setState(() {
                  sourceType = newValue!;
                });
              },
              items: <String>[
                'FIRST_PARTY',
                'ENGAGEMENT',
                'PIXEL',
                'FOOT_TRAFFIC_INSIGHTS'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context,
                    (_nameController.text, _descController.text, sourceType));
              },
              icon: const Icon(Icons.done),
              label: const Text("Add"))
        ],
      ),
    );
  }
}
