import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_web/features/home/home_exports.dart'
    show HomeBloc, Segment, UsersSegmentsDialog;
import 'package:task_web/features/home/presentaion/blocs/home_bloc/home_state.dart';

import '../dialogs/add_users_dialog.dart';
import '../dialogs/update_segment_dialog.dart';

class SegmentItem extends StatelessWidget {
  final Segment item;
  const SegmentItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListTile(
          title: Text(item.name ?? ""),
          subtitle: Text(item.description ?? ""),
          trailing: Container(
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //    Text(item.createdAt.toString()),
                ElevatedButton.icon(
                    onPressed: () async {
                      (String, List<String>) data = await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext c) {
                          return BlocProvider<HomeBloc>.value(
                            value: context.read<HomeBloc>(),
                            child: UsersSegmentsDialog(
                              item: item,
                            ),
                          );
                        },
                      );
                      context
                          .read<HomeBloc>()
                          .addUsersToSegments(item.id!, data.$1, data.$2);
                    },
                    icon: const Icon(Icons.view_agenda),
                    label: const Text("Show Current Users")),
                ElevatedButton.icon(
                    onPressed: () async {
                      (String, List<String>) data = await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return AddUsersDialog(
                            item: item,
                          );
                        },
                      );
                      context
                          .read<HomeBloc>()
                          .addUsersToSegments(item.id!, data.$1, data.$2);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Users")),
                ElevatedButton.icon(
                    onPressed: () async {
                      (String, String) data = await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UpdateSegmentDialog(
                            item: item,
                          );
                        },
                      );
                      context
                          .read<HomeBloc>()
                          .updateSegment(item.id!, data.$1, data.$2);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Segment")),
              ],
            ),
          ),
        );
      },
    );
  }
}
