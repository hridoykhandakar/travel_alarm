import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_alarm/features/alarm/models/alarm_model.dart';
import 'package:travel_alarm/features/alarm/providers/alarm_async_provider.dart';
import 'package:travel_alarm/features/alarm/providers/alarm_provider.dart';

class AlarmLists extends ConsumerWidget {
  const AlarmLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarms = ref.watch(alarmProvider);
    final alarms2 = ref.watch(alarmNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Alarm List")),
      body: alarms2.when(
        data: (alarms) {
          return ListView.builder(
            itemCount: alarms.length,
            itemBuilder: (context, index) {
              final todo = alarms[index];
              return ListTile(
                title: Text(todo.dateTime.toString()),
                trailing: Checkbox(
                  value: todo.isActive,
                  onChanged: (_) {
                    // ref.read(alarmProvider.notifier).(todo.id);
                  },
                ),
              );
            },
          );
        },
        error: (e, _) => Text("Error"),
        loading: () => CircularProgressIndicator(),
      ),
      // alarms.isEmpty
      //     ? const Center(child: Text("No Todos"))
      //     : Column(
      //         children: [
      //           Expanded(
      //             child: ListView.builder(
      //               itemCount: alarms.length,
      //               itemBuilder: (context, index) {
      //                 final todo = alarms[index];
      //                 return ListTile(
      //                   title: Text(todo.dateTime.toString()),
      //                   trailing: Checkbox(
      //                     value: todo.isActive,
      //                     onChanged: (_) {
      //                       // ref.read(alarmProvider.notifier).(todo.id);
      //                     },
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //
      //           ElevatedButton(
      //             onPressed: () {
      //               ref.read(alarmNotifierProvider.notifier).loadFromLocal();
      //             },
      //             child: Text("refetch"),
      //           ),
      //         ],
      //       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTodo = AlarmModel(
            id: Random().nextInt(100),
            dateTime: DateTime.now(),
            isActive: true,
          );
          ref.read(alarmProvider.notifier).addAlarm(newTodo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
