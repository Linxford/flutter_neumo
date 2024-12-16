import '../../flutter_neumo.dart';

export 'inherited_neumo_theme.dart';
export 'theme.dart';
export 'theme_wrapper.dart';

/// The NeumoTheme (provider)
/// 1. Defines the used neumo theme used in child widgets
///
///   @see NeumoThemeData
///
///   NeumoTheme(
///     theme: NeumoThemeData(...),
///     darkTheme: NeumoThemeData(...),
///     currentTheme: CurrentTheme.LIGHT,
///     child: ...
///
/// 2. Provide by static methods the current theme
///
///   NeumoThemeData theme = NeumoTheme.getCurrentTheme(context);
///
/// 3. Provide by static methods the current theme's colors
///
///   Color baseColor = NeumoTheme.baseColor(context);
///   Color accent = NeumoTheme.accentColor(context);
///   Color variant = NeumoTheme.variantColor(context);
///
/// 4. Tells if the current theme is dark
///
///   bool dark = NeumoTheme.isUsingDark(context);
///
/// 5. Provides a way to update the current theme
///
///   NeumoTheme.of(context).updateCurrentTheme(
///     NeumoThemeData(
///       /* new values */
///     )
///   )
///
class NeumoTheme extends StatefulWidget {
  final NeumoThemeData theme;
  final NeumoThemeData darkTheme;
  final Widget child;
  final ThemeMode themeMode;

  const NeumoTheme({
    super.key,
    required this.child,
    this.theme = neumoDefaultTheme,
    this.darkTheme = neumoDefaultDarkTheme,
    this.themeMode = ThemeMode.system,
  });

  @override
  _NeumoThemeState createState() => _NeumoThemeState();

  static NeumoThemeInherited? of(BuildContext context) {
    try {
      return context.dependOnInheritedWidgetOfExactType<NeumoThemeInherited>();
    } catch (t) {
      return null;
    }
  }

  static void update(BuildContext context, NeumoThemeUpdater updater) {
    final theme = of(context);
    if (theme == null) return;
    return theme.update(updater);
  }

  static bool isUsingDark(BuildContext context) {
    final theme = of(context);
    if (theme == null) return false;
    return theme.isUsingDark;
  }

  static Color accentColor(BuildContext context) {
    return currentTheme(context).accentColor;
  }

  static Color baseColor(BuildContext context) {
    return currentTheme(context).baseColor;
  }

  static Color variantColor(BuildContext context) {
    return currentTheme(context).variantColor;
  }

  static Color disabledColor(BuildContext context) {
    return currentTheme(context).disabledColor;
  }

  static double? intensity(BuildContext context) {
    return currentTheme(context).intensity;
  }

  static double? depth(BuildContext context) {
    return currentTheme(context).depth;
  }

  static double? embossDepth(BuildContext context) {
    return -currentTheme(context).depth.abs();
  }

  static Color defaultTextColor(BuildContext context) {
    return currentTheme(context).defaultTextColor;
  }

  static NeumoThemeData currentTheme(BuildContext context) {
    final provider = NeumoTheme.of(context);
    if (provider == null) return neumoDefaultTheme;
    return provider.current == null ? neumoDefaultTheme : provider.current!;
  }
}

double applyThemeDepthEnable(
    {required BuildContext context,
    required bool styleEnableDepth,
    required double depth}) {
  final NeumoThemeData theme = NeumoTheme.currentTheme(context);
  return wrapDepthWithThemeData(
      themeData: theme, styleEnableDepth: styleEnableDepth, depth: depth);
}

double wrapDepthWithThemeData(
    {required NeumoThemeData themeData,
    required bool styleEnableDepth,
    required double depth}) {
  if (themeData.disableDepth) {
    return 0;
  } else {
    return depth;
  }
}

class _NeumoThemeState extends State<NeumoTheme> {
  late ThemeWrapper _themeHost;

  @override
  void initState() {
    super.initState();
    _themeHost = ThemeWrapper(
      theme: widget.theme,
      themeMode: widget.themeMode,
      darkTheme: widget.darkTheme,
    );
  }

  @override
  void didUpdateWidget(NeumoTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _themeHost = ThemeWrapper(
        theme: widget.theme,
        themeMode: widget.themeMode,
        darkTheme: widget.darkTheme,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeumoThemeInherited(
      value: _themeHost,
      onChanged: (value) {
        setState(() {
          _themeHost = value;
        });
      },
      child: widget.child,
    );
  }
}
