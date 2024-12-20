import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const double toolbarHeight = kToolbarHeight + 32.0;
  static const double defaultSpacing = 4.0;

  final Widget? title;
  final Widget? leading;
  final bool? centerTitle;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double titleSpacing;
  final double actionSpacing;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final NeumoStyle? buttonStyle;
  final EdgeInsets? buttonPadding;
  final TextStyle? titleTextStyle;
  final double padding;

  @override
  final Size preferredSize;

  const NeumoAppBar({
    super.key,
    this.title,
    this.leading,
    this.centerTitle,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.actionSpacing = defaultSpacing,
    this.backgroundColor,
    this.iconTheme,
    this.buttonStyle,
    this.buttonPadding,
    this.titleTextStyle,
    this.padding = 16.0,
  }) : preferredSize = const Size.fromHeight(toolbarHeight);

  @override
  State<NeumoAppBar> createState() => _NeumoAppBarState();
}

class _NeumoAppBarState extends State<NeumoAppBar> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NeumoThemeInherited? neumoTheme = NeumoTheme.of(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
    final bool hasDrawer = scaffoldState?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffoldState?.hasEndDrawer ?? false;

    Widget? leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = NeumoButton(
          padding: widget.buttonPadding,
          style: widget.buttonStyle,
          onPressed: _openDrawer,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          child: const Icon(Icons.menu),
        );
      } else if (canPop) {
        leading = useCloseButton
            ? NeumoCloseButton(
                padding: widget.buttonPadding,
                style: widget.buttonStyle,
              )
            : NeumoBackButton(
                padding: widget.buttonPadding,
                style: widget.buttonStyle,
              );
      }
    }

    Widget? title = widget.title;
    if (title != null) {
      final AppBarTheme appBarTheme = AppBarTheme.of(context);
      title = DefaultTextStyle(
        style: appBarTheme.titleTextStyle?.copyWith(
              color: widget.titleTextStyle?.color ??
                  neumoTheme?.current?.defaultTextColor,
            ) ??
            theme.textTheme.titleLarge!,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: title,
      );
    }

    Widget? actions;
    if (widget.actions?.isNotEmpty ?? false) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!
            .map((child) => Padding(
                  padding: EdgeInsets.only(left: widget.actionSpacing),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(
                        width: kToolbarHeight, height: kToolbarHeight),
                    child: child,
                  ),
                ))
            .toList(),
      );
    } else if (hasEndDrawer) {
      actions = ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
            width: kToolbarHeight, height: kToolbarHeight),
        child: NeumoButton(
          padding: widget.buttonPadding,
          style: widget.buttonStyle,
          onPressed: _openEndDrawer,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          child: const Icon(Icons.menu),
        ),
      );
    }

    return Container(
      color: widget.backgroundColor ?? neumoTheme?.current?.appBarTheme.color,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(widget.padding),
          child: IconTheme(
            data: widget.iconTheme ??
                neumoTheme?.current?.appBarTheme.iconTheme ??
                const IconThemeData(),
            child: NavigationToolbar(
              leading: leading,
              middle: title,
              trailing: actions,
              centerMiddle:
                  _shouldCenterTitle(theme, neumoTheme as NeumoThemeData?),
              middleSpacing: widget.titleSpacing,
            ),
          ),
        ),
      ),
    );
  }

  bool _shouldCenterTitle(ThemeData theme, NeumoThemeData? neumoTheme) {
    if (widget.centerTitle != null) {
      return widget.centerTitle!;
    }
    if (neumoTheme?.appBarTheme.centerTitle != null) {
      return neumoTheme!.appBarTheme.centerTitle!;
    }
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return widget.actions == null || widget.actions!.length < 2;
    }
  }

  void _openDrawer() => Scaffold.of(context).openDrawer();

  void _openEndDrawer() => Scaffold.of(context).openEndDrawer();
}
