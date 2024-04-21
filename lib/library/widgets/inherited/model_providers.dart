import 'package:flutter/material.dart';

class NotifierModelProvider<Model extends ChangeNotifier> extends InheritedNotifier {
  final Model model;

  const NotifierModelProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(notifier: model);

  static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotifierModelProvider<Model>>()?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<NotifierModelProvider<Model>>()
        ?.widget;
    return widget is NotifierModelProvider<Model> ? widget.model : null;
  }
}

class ModelProvider<Model> extends InheritedWidget {
  final Model model;

  const ModelProvider({
    super.key,
    required this.model,
    required super.child,
  });

  static Model? watch<Model>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ModelProvider<Model>>()?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ModelProvider<Model>>()
        ?.widget;
    return widget is ModelProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(ModelProvider oldWidget) {
    return model != oldWidget.model;
  }
}