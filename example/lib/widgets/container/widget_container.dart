import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class ContainerWidgetPage extends StatefulWidget {
  const ContainerWidgetPage({Key key}) : super(key: key);

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<ContainerWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      themeMode: ThemeMode.light,
      theme: const NeumoThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumoColors.accent,
        depth: 8,
        intensity: 0.5,
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
          title: "Container",
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
              _DefaultWidget(),
              _CircleWidget(),
              _RoundRectWidget(),
              _ColorizableWidget(),
              _FlatConcaveConvexWidget(),
              _EmbossWidget(),
              _DrawAboveWidget(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _DefaultWidget extends StatefulWidget {
  @override
  createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<_DefaultWidget> {
  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    child: SizedBox(
        height: 100,
        width: 100,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Default",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          const Neumo(
            child: SizedBox(
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 12),
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

class _CircleWidget extends StatefulWidget {
  @override
  createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<_CircleWidget> {
  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
     boxShape: NeumoBoxShape.circle(),
     padding: EdgeInsets.all(18.0),
     child: Icon(Icons.map),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Circle",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          const Neumo(
            style: NeumoStyle(
              boxShape: NeumoBoxShape.circle(),
            ),
            padding: EdgeInsets.all(18.0),
            child: Icon(Icons.map),
          ),
          const SizedBox(width: 12),
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

class _RoundRectWidget extends StatefulWidget {
  @override
  createState() => _RoundRectWidgetState();
}

class _RoundRectWidgetState extends State<_RoundRectWidget> {
  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    style: NeumoStyle(
         boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(8)),
    ),
    padding: EdgeInsets.all(18.0),
    child: Icon(Icons.map),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "RoundRect",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          Neumo(
            style: NeumoStyle(
              boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(8)),
            ),
            padding: const EdgeInsets.all(18.0),
            child: const Icon(Icons.map),
          ),
          const SizedBox(width: 12),
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

class _ColorizableWidget extends StatefulWidget {
  @override
  createState() => _ColorizableWidgetState();
}

class _ColorizableWidgetState extends State<_ColorizableWidget> {
  Color currentColor = Colors.white;

  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    style: NeumoStyle(
        color: Colors.white,
        boxShape: NeumoBoxShape.circle()
    ),
    child: SizedBox(
      height: 100,
      width: 100,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Color",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          ColorSelector(
            color: currentColor,
            onColorChanged: (color) {
              setState(() {
                currentColor = color;
              });
            },
          ),
          const SizedBox(width: 12),
          Neumo(
            style: NeumoStyle(
                color: currentColor, boxShape: const NeumoBoxShape.circle()),
            child: const SizedBox(
              height: 100,
              width: 100,
            ),
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

class _FlatConcaveConvexWidget extends StatefulWidget {
  @override
  createState() => _FlatConcaveConvexWidgetState();
}

class _FlatConcaveConvexWidgetState extends State<_FlatConcaveConvexWidget> {
  bool isChecked = false;

  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    style: NeumoStyle(
         shape: NeumoShape.flat
         //or convex, concave
    ),

    child: ...
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Flat",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const Neumo(
                style: NeumoStyle(
                  shape: NeumoShape.flat,
                  boxShape: NeumoBoxShape.circle(),
                ),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Concave",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const Neumo(
                style: NeumoStyle(
                  shape: NeumoShape.concave,
                  boxShape: NeumoBoxShape.circle(),
                ),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Convex",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              const NeumoButton(
                style: NeumoStyle(
                    shape: NeumoShape.convex, boxShape: NeumoBoxShape.circle()),
                padding: EdgeInsets.all(18.0),
                child: Icon(Icons.play_arrow),
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

class _EmbossWidget extends StatefulWidget {
  @override
  createState() => _EmbossWidgetState();
}

class _EmbossWidgetState extends State<_EmbossWidget> {
  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    child: Icon(Icons.play_arrow),
    style: NeumoStyle(
      depth: -10.0,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Text(
                "Emboss",
                style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
              ),
              const SizedBox(width: 12),
              const Neumo(
                padding: EdgeInsets.all(18),
                style: NeumoStyle(
                  depth: -10.0,
                ),
                child: Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 12),
              const Neumo(
                padding: EdgeInsets.all(18),
                style: NeumoStyle(
                  boxShape: NeumoBoxShape.circle(),
                  depth: -10.0,
                ),
                child: Icon(Icons.play_arrow),
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

class _DrawAboveWidget extends StatefulWidget {
  @override
  createState() => _DrawAboveWidgetState();
}

class _DrawAboveWidgetState extends State<_DrawAboveWidget> {
  Widget _buildCode(BuildContext context) {
    return const Code("""
Neumo(
    child: ...,
    drawSurfaceAboveChild: true,
    style: NeumoStyle(
        surfaceIntensity: 1,
        shape: NeumoShape.concave,
    ),
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Text(
            "DrawAbove",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(height: 12),
          Row(children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("false")),
            ),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("true\n(concave)")),
            ),
            const SizedBox(width: 12),
            Container(
              margin: const EdgeInsets.all(8),
              width: 100,
              child: const Center(child: Text("true\n(convex)")),
            ),
          ]),
          Row(
            children: <Widget>[
              Neumo(
                drawSurfaceAboveChild: false,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  surfaceIntensity: 1,
                  shape: NeumoShape.concave,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Neumo(
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  surfaceIntensity: 1,
                  shape: NeumoShape.concave,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Neumo(
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  intensity: 1,
                  shape: NeumoShape.convex,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Neumo(
                drawSurfaceAboveChild: false,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  boxShape: NeumoBoxShape.circle(),
                  surfaceIntensity: 1,
                  shape: NeumoShape.concave,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Neumo(
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  surfaceIntensity: 1,
                  boxShape: NeumoBoxShape.circle(),
                  shape: NeumoShape.concave,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Neumo(
                drawSurfaceAboveChild: true,
                margin: const EdgeInsets.all(8),
                style: const NeumoStyle(
                  surfaceIntensity: 1,
                  boxShape: NeumoBoxShape.circle(),
                  shape: NeumoShape.convex,
                ),
                child: Image.asset(
                  "assets/images/weeknd.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
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
