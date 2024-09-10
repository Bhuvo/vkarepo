import 'package:flutter/material.dart';
import 'package:timesmedlite/model/user.dart';

class UserProvider extends InheritedWidget {
  final User data;
  const UserProvider({required super.child, super.key, required this.data,});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static User? of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<UserProvider>()?.data;
}