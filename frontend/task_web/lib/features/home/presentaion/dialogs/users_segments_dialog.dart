import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_web/features/home/home_exports.dart';
import 'package:task_web/features/home/presentaion/blocs/home_bloc/home_state.dart';

class UsersSegmentsDialog extends StatefulWidget {
  final Segment item;
  const UsersSegmentsDialog({super.key, required this.item});

  @override
  State<UsersSegmentsDialog> createState() => _UsersSegmentsDialogState();
}

class _UsersSegmentsDialogState extends State<UsersSegmentsDialog> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().getUsersSegments(widget.item.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Text("Segment ${widget.item.name}"),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.segmentUsers?.length ?? 0,
                itemBuilder: (ctx, index) {
                  return ListTile(
                      title: Text(state.segmentUsers?[index].userId ?? ""));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
