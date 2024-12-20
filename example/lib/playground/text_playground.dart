import 'package:example/lib/color_selector.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoTextPlayground extends StatefulWidget {
  const NeumoTextPlayground({super.key});

  @override
  _NeumoPlaygroundState createState() => _NeumoPlaygroundState();
}

class _NeumoPlaygroundState extends State<NeumoTextPlayground> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      themeMode: ThemeMode.light,
      theme: const NeumoThemeData(
        baseColor: Color(0xffDDDDDD),
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
      ),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  LightSource lightSource = LightSource.topLeft;
  NeumoShape shape = NeumoShape.flat;
  double depth = 2;
  double intensity = 0.8;
  double surfaceIntensity = 0.5;
  double cornerRadius = 20;
  double height = 150.0;
  double width = 150.0;

  double fontSize = 100;
  int fontWeight = 800;

  final _textController = TextEditingController(text: "Flutter");

  bool displayIcon = false;

  Widget neumoText() {
    if (displayIcon) {
      return NeumoIcon(
        Icons.public,
        size: fontSize,
        style: NeumoStyle(
          shape: shape,
          intensity: intensity,
          surfaceIntensity: surfaceIntensity,
          depth: depth,
          lightSource: lightSource,
        ),
      );
    } else {
      return NeumoText(
        _textController.text,
        textStyle: NeumoTextStyle(
          fontSize: fontSize,
          fontWeight: _fontWeight(),
        ),
        style: NeumoStyle(
          shape: shape,
          intensity: intensity,
          surfaceIntensity: surfaceIntensity,
          depth: depth,
          lightSource: lightSource,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NeumoBackground(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: const Text(
                      "back",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      lightSourceWidgets(),
                      Center(child: neumoText()),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: _configurators(),
                )
              ],
            )),
      ),
    );
  }

  int selectedConfiguratorIndex = 0;

  Widget _configurators() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.secondary;
    const Color buttonInnactiveColor = Colors.white;

    const Color textActiveColor = Colors.white;
    final Color textInactiveColor = Colors.black.withOpacity(0.3);

    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      "Style",
                      style: TextStyle(
                        color: selectedConfiguratorIndex == 0
                            ? textActiveColor
                            : textInactiveColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedConfiguratorIndex = 0;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      "Element",
                      style: TextStyle(
                        color: selectedConfiguratorIndex == 1
                            ? textActiveColor
                            : textInactiveColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedConfiguratorIndex = 1;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          _configuratorsChild(),
        ],
      ),
    );
  }

  Widget _configuratorsChild() {
    switch (selectedConfiguratorIndex) {
      case 0:
        return styleCustomizer();
        break;
      case 1:
        return elementCustomizer();
        break;
    }
    return const SizedBox.shrink();
  }

  Widget styleCustomizer() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        depthSelector(),
        intensitySelector(),
        surfaceIntensitySelector(),
        colorPicker(),
      ],
    );
  }

  Widget elementCustomizer() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        fontSizeSelector(),
        fontWeightSelector(),
        textSelector(),
        shapeWidget(),
      ],
    );
  }

  Widget shapeWidget() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.secondary;
    const Color buttonInnactiveColor = Colors.white;

    const Color iconActiveColor = Colors.white;
    final Color iconInactiveColor = Colors.black.withOpacity(0.3);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.concave;
                });
              },
              child: Image.asset("assets/images/concave.png",
                  color: shape == NeumoShape.concave
                      ? iconActiveColor
                      : iconInactiveColor),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.convex;
                });
              },
              child: Image.asset("assets/images/convex.png",
                  color: shape == NeumoShape.convex
                      ? iconActiveColor
                      : iconInactiveColor),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.flat;
                });
              },
              child: Image.asset("assets/images/flat.png",
                  color: shape == NeumoShape.flat
                      ? iconActiveColor
                      : iconInactiveColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget colorPicker() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 12,
        ),
        const Text("Color "),
        const SizedBox(
          width: 4,
        ),
        ColorSelector(
          onColorChanged: (color) {
            setState(() {
              NeumoTheme.of(context)
                  ?.updateCurrentTheme(NeumoThemeData(baseColor: color));
            });
          },
          color: NeumoTheme.baseColor(context),
        ),
      ],
    );
  }

  Widget depthSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Depth"),
        ),
        Expanded(
          child: Slider(
            min: Neumo.MIN_DEPTH,
            max: Neumo.MAX_DEPTH,
            value: depth,
            onChanged: (value) {
              setState(() {
                depth = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(depth.floor().toString()),
        ),
      ],
    );
  }

  Widget fontSizeSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("FontSize"),
        ),
        Expanded(
          child: Slider(
            min: 40,
            max: 200,
            value: fontSize,
            onChanged: (value) {
              setState(() {
                fontSize = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(fontSize.floor().toString()),
        ),
      ],
    );
  }

  Widget textSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Text"),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (s) {
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget intensitySelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Intensity"),
        ),
        Expanded(
          child: Slider(
            min: Neumo.MIN_INTENSITY, //in case of != 0
            max: Neumo.MAX_INTENSITY,
            value: intensity,
            onChanged: (value) {
              setState(() {
                intensity = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(((intensity * 100).floor() / 100).toString()),
        ),
      ],
    );
  }

  FontWeight _fontWeight() {
    switch (fontWeight ~/ 100) {
      case 1:
        return FontWeight.w100;
      case 2:
        return FontWeight.w200;
      case 3:
        return FontWeight.w300;
      case 4:
        return FontWeight.w400;
      case 5:
        return FontWeight.w500;
      case 6:
        return FontWeight.w600;
      case 7:
        return FontWeight.w700;
      case 8:
        return FontWeight.w800;
      case 9:
        return FontWeight.w900;
    }
    return FontWeight.w500;
  }

  Widget fontWeightSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("FontWeight"),
        ),
        Expanded(
          child: Slider(
            min: 100,
            max: 900,
            value: fontWeight.toDouble(),
            onChanged: (value) {
              setState(() {
                fontWeight = value.toInt();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(((fontWeight * 100).floor() / 100).toString()),
        ),
      ],
    );
  }

  Widget surfaceIntensitySelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("SurfaceIntensity"),
        ),
        Expanded(
          child: Slider(
            min: Neumo.MIN_INTENSITY, //in case of != 0
            max: Neumo.MAX_INTENSITY,
            value: surfaceIntensity,
            onChanged: (value) {
              setState(() {
                surfaceIntensity = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(((surfaceIntensity * 100).floor() / 100).toString()),
        ),
      ],
    );
  }

  Widget lightSourceWidgets() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 10,
          right: 10,
          child: Slider(
            min: -1,
            max: 1,
            value: lightSource.dx,
            onChanged: (value) {
              setState(() {
                lightSource = lightSource.copyWith(dx: value);
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          top: 10,
          bottom: 10,
          child: RotatedBox(
            quarterTurns: 1,
            child: Slider(
              min: -1,
              max: 1,
              value: lightSource.dy,
              onChanged: (value) {
                setState(() {
                  lightSource = lightSource.copyWith(dy: value);
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
