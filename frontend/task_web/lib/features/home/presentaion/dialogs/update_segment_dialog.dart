import 'package:flutter/material.dart';
import 'package:task_web/features/home/home_exports.dart' show Segment;

class UpdateSegmentDialog extends StatefulWidget {
  final Segment item;
  const UpdateSegmentDialog({super.key, required this.item});

  @override
  State<UpdateSegmentDialog> createState() => _UpdateSegmentDialogState();
}

class _UpdateSegmentDialogState extends State<UpdateSegmentDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descController = TextEditingController();
  // String? sourceType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _nameController.text = widget.item.name ?? "";
    _descController.text = widget.item.description ?? "";
    // sourceType = widget.item.sourceType ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text("Update Segment"),
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
          /* Container(
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
          ),*/
          const SizedBox(
            height: 32,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(
                    context, (_nameController.text, _descController.text));
              },
              icon: const Icon(Icons.done),
              label: const Text("Update"))
        ],
      ),
    );
  }
}
