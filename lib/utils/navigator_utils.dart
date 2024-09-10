import 'package:flutter/material.dart';

final List<String> backStack = [];

extension NavigatorUtils on BuildContext{
  ///Used to push a route
  Future push(String name, [Object? args]){
    backStack.add(name);
    return Navigator.of(this).pushNamed(name, arguments: args);
  }

  ///This method used to push a route without duplicate push, used in bottom navigation
  Future managedPush(String name, [Object? args]){
    if(backStack.contains(name)){
      Navigator.of(this).popUntil((route){
        final n = route.settings.name;
        if(n != name) {
          backStack.remove(n);
        }
        return n == name;
      });
      return Future(() => null);
    } else {
      backStack.add(name);
      return Navigator.of(this).pushNamed(name, arguments: args);
    }

  }

  ///used to replace current route
  Future replace(String name, [Object? args]){
    if(backStack.isNotEmpty) {
      backStack.removeLast();
    }
    backStack.add(name);
    return Navigator.of(this).pushReplacementNamed(name, arguments: args);
  }
  ///pops current route or dialog
  void pop([Object? result]){
    if(backStack.isNotEmpty && ModalRoute.of(this)?.settings.name != null) {
      backStack.removeLast();
    }
    return Navigator.of(this).pop(result);
  }

  void popDialog([Object? result]){
    return Navigator.of(this).pop(result);
  }

  ///pops all route until predicate callback returns true and push new route
  Future pushAndRemoveUntil(String name, bool Function(Route) predicate, [Object? args]) => Navigator.of(this).pushNamedAndRemoveUntil(name, predicate, arguments: args);
}