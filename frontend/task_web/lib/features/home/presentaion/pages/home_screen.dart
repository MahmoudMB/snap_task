import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_web/features/home/presentaion/blocs/home_bloc/home_state.dart';

import '../../home_exports.dart';
import '../dialogs/add_segment_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const Text("Segments"),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.segments?.segments?.length ?? 0,
                    itemBuilder: (ctx, index) {
                      return SegmentItem(
                          item: state.segments!.segments![index].segment!);
                    }),
                ElevatedButton.icon(
                    onPressed: () async {
                      (String, String, String) data =
                          await showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const AddSegmentDialog();
                        },
                      );
                      context
                          .read<HomeBloc>()
                          .addSegments(data.$1, data.$2, data.$3);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add Segment"))
              ],
            ),
          );
        },
      ),
    );
  }
}
