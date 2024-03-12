import 'package:architecture/core/results/result_state.dart';
import 'package:flutter/material.dart';

typedef CompletedWidget<T> = Widget Function(T);

class ResultStateBuilder<T, E extends Exception> extends StatelessWidget {
  final ResultState<T, E> resultState;
  final CompletedWidget<T> completed;
  const ResultStateBuilder(
      {super.key, required this.resultState, required this.completed});

  @override
  Widget build(BuildContext context) {
    return resultState.when(
      idle: () {
        return Container();
      },
      pending: () {
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      completed: (data) {
        return completed(data);
      },
      failed: (error, textColor) {
        return Text(error.toString());
      },
      empty: (color) {
        return Center(
            child: Text(
          "Gösterilecek Sonuç Bulunamadı",
          style: TextStyle(fontSize: 16, color: color ?? Colors.black),
        ));
      },
    );
  }
}
