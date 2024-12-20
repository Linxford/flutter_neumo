import 'package:flutter_neumo/flutter_neumo.dart';

export 'theme.dart';
export 'theme_wrapper.dart';

typedef NeumoThemeUpdater = NeumoThemeData Function(NeumoThemeData? current);

class NeumoThemeInherited extends InheritedWidget {
  @override
  final Widget child;
  final ThemeWrapper value;
  final ValueChanged<ThemeWrapper> onChanged;

  const NeumoThemeInherited(
      {super.key,
      required this.child,
      required this.value,
      required this.onChanged})
      : super(child: child);

  @override
  bool updateShouldNotify(NeumoThemeInherited other) => value != other.value;

  NeumoThemeData? get current {
    return value.current;
  }

  bool get isUsingDark {
    return value.useDark;
  }

  ThemeMode get themeMode => value.themeMode;

  set themeMode(ThemeMode currentTheme) {
    onChanged(value.copyWith(currentTheme: currentTheme));
  }

  void updateCurrentTheme(NeumoThemeData update) {
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      onChanged(newValue);
    }
  }

  void update(NeumoThemeUpdater themeUpdater) {
    final update = themeUpdater(value.current);
    if (value.useDark) {
      final newValue = value.copyWith(darkTheme: update);
      //this.value = newValue;
      onChanged(newValue);
    } else {
      final newValue = value.copyWith(theme: update);
      //this.value = newValue;
      onChanged(newValue);
    }
  }
}
