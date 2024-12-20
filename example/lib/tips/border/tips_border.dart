import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class TipsBorderPage extends StatefulWidget {
  const TipsBorderPage({Key key}) : super(key: key);

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<TipsBorderPage> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      themeMode: ThemeMode.light,
      theme: const NeumoThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumoColors.accent,
        depth: 4,
        intensity: 0.6,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return NeumoBackground(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: TopBar(
          title: "Border",
          actions: <Widget>[
            ThemeConfigurator(),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _CustomWidget(
                title: "Emboss Inside Flat",
                firstStyle: const NeumoStyle(
                  shape: NeumoShape.flat,
                  depth: 8,
                ),
                secondStyle: const NeumoStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Convex",
                firstStyle: const NeumoStyle(
                  shape: NeumoShape.convex,
                  depth: 8,
                ),
                secondStyle: const NeumoStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Emboss Inside Concave",
                firstStyle: const NeumoStyle(
                  shape: NeumoShape.concave,
                  depth: 8,
                ),
                secondStyle: const NeumoStyle(
                  depth: -8,
                ),
              ),
              _CustomWidget(
                title: "Flat Inside Emboss",
                firstStyle: const NeumoStyle(
                  depth: -8,
                ),
                secondStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.flat,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Emboss",
                firstStyle: const NeumoStyle(
                  depth: -8,
                ),
                secondStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.convex,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Emboss",
                firstStyle: const NeumoStyle(
                  depth: -8,
                ),
                secondStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Concave Inside Convex",
                firstStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.convex,
                ),
                secondStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.concave,
                ),
              ),
              _CustomWidget(
                title: "Convex Inside Concave",
                firstStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.concave,
                ),
                secondStyle: const NeumoStyle(
                  depth: 8,
                  shape: NeumoShape.convex,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomWidget extends StatefulWidget {
  final String title;

  final NeumoStyle firstStyle;
  final NeumoStyle secondStyle;

  const _CustomWidget(
      {@required this.title,
      @required this.firstStyle,
      @required this.secondStyle});

  @override
  createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  String _describe(NeumoStyle style) {
    return "NeumoStyle(depth: ${style.depth}, oppositeShadowLightSource: ${style.oppositeShadowLightSource}, ...)";
  }

  Widget _buildCode(BuildContext context) {
    return Code("""
Neumo(
      padding: EdgeInsets.all(20),
      boxShape: NeumoBoxShape.circle(),
      style: ${_describe(widget.firstStyle)},
      child: Neumo(
          boxShape: NeumoBoxShape.circle(),
          style: ${_describe(widget.secondStyle)},
          child: SizedBox(
            height: 100,
            width: 100,
          ),
      ),
    ),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  widget.title,
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              Neumo(
                padding: const EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: const NeumoBoxShape.circle(),
                ),
                child: Neumo(
                  style: widget.secondStyle.copyWith(
                    boxShape: const NeumoBoxShape.circle(),
                  ),
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 12, right: 12),
                width: 100,
                child: Text(
                  "opposite\nchild\nlightsource",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              Neumo(
                padding: const EdgeInsets.all(20),
                style: widget.firstStyle.copyWith(
                  boxShape: const NeumoBoxShape.circle(),
                ),
                child: Neumo(
                  style: widget.secondStyle.copyWith(
                    boxShape: const NeumoBoxShape.circle(),
                    oppositeShadowLightSource: true,
                  ),
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildWidget(context),
        _buildCode(context),
      ],
    );
  }
}
