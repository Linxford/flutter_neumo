import 'package:example/lib/color_selector.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class NeumoPlayground extends StatefulWidget {
  const NeumoPlayground({super.key});

  @override
  _NeumoPlaygroundState createState() => _NeumoPlaygroundState();
}

class _NeumoPlaygroundState extends State<NeumoPlayground> {
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
  NeumoBoxShape boxShape = NeumoBoxShape.roundRect(BorderRadius.circular(20));
  double depth = 5;
  double intensity = 0.5;
  double surfaceIntensity = 0.5;
  double cornerRadius = 20;
  double height = 150.0;
  double width = 150.0;

  static const minWidth = 50.0;
  static const maxWidth = 200.0;
  static const minHeight = 50.0;
  static const maxHeight = 200.0;

  bool haveNeumoChild = false;
  bool childOppositeLightsourceChild = false;
  bool drawAboveChild = false;
  double childMargin = 5;
  double childDepth = 5;

  @override
  void initState() {
    boxShape = NeumoBoxShape.path(NeumoFlutterLogoPathProvider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumoTheme.baseColor(context),
        //appBar: NeumoAppBar(
        //  title: Text('Playground'),
        //),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
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
                  Center(child: neumo()),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: _configurators(),
            )
          ],
        ));
  }

  int selectedConfiguratorIndex = 0;

  Widget _configurators() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.primary;
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
                          borderRadius: BorderRadius.circular(12)),
                    ),
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
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        "Element",
                        style: TextStyle(
                          color: selectedConfiguratorIndex == 1
                              ? textActiveColor
                              : textInactiveColor,
                        ),
                      ),
                      onPressed: () {
                        onPressed:
                        () {
                          setState(() {
                            selectedConfiguratorIndex = 1;
                          });
                        };
                      }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      "Child",
                      style: TextStyle(
                        color: selectedConfiguratorIndex == 2
                            ? textActiveColor
                            : textInactiveColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedConfiguratorIndex = 2;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          if (_configuratorsChild() != null) _configuratorsChild()!,
        ],
      ),
    );
  }

  Widget? _configuratorsChild() {
    switch (selectedConfiguratorIndex) {
      case 0:
        return styleCustomizer();
      case 1:
        return elementCustomizer();
      case 2:
        return childCustomizer();
    }
    return null;
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
        boxshapeWidget(),
        cornerRadiusSelector(),
        shapeWidget(),
        sizeSelector(),
      ],
    );
  }

  Widget childCustomizer() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        hasChildSelector(),
        drawAboveChildSelector(),
        childDepthSelector(),
        childMarginSelector(),
        childOppositeLightsourceSelector(),
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

  Widget neumo() {
    return NeumoButton(
      padding: EdgeInsets.zero,
      duration: const Duration(milliseconds: 300),
      onPressed: () {
        setState(() {});
      },
      drawSurfaceAboveChild: drawAboveChild,
      style: NeumoStyle(
        boxShape: boxShape,
        //border: NeumoBorder(),
        shape: shape,
        intensity: intensity,
        /*
        shadowLightColor: Colors.red,
        shadowDarkColor: Colors.blue,
        shadowLightColorEmboss: Colors.red,
        shadowDarkColorEmboss: Colors.blue,
         */
        surfaceIntensity: surfaceIntensity,
        depth: depth,
        lightSource: lightSource,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: haveNeumoChild ? neumoChild() : const Center(child: Text("")),
      ),
    );
  }

  Widget neumoChild() {
    return Neumo(
      padding: EdgeInsets.zero,
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(childMargin),
      drawSurfaceAboveChild: true,
      style: NeumoStyle(
          boxShape: boxShape,
          //shape: this.shape,
          intensity: intensity,
          surfaceIntensity: surfaceIntensity,
          depth: childDepth,
          lightSource: lightSource,
          oppositeShadowLightSource: childOppositeLightsourceChild),
      child: const SizedBox.expand(),
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

  Widget childDepthSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Child Depth"),
        ),
        Expanded(
          child: Slider(
            min: Neumo.MIN_DEPTH,
            max: Neumo.MAX_DEPTH,
            value: childDepth,
            onChanged: (value) {
              setState(() {
                childDepth = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(childDepth.floor().toString()),
        ),
      ],
    );
  }

  Widget childMarginSelector() {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("Child Margin"),
        ),
        Expanded(
          child: Slider(
            min: 0,
            max: 40,
            value: childMargin,
            onChanged: (value) {
              setState(() {
                childMargin = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(childMargin.floor().toString()),
        ),
      ],
    );
  }

  Widget hasChildSelector() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Has Child"),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Checkbox(
            value: haveNeumoChild,
            onChanged: (value) {
              setState(() {
                haveNeumoChild = value ?? false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget drawAboveChildSelector() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Draw above child"),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Checkbox(
            value: drawAboveChild,
            onChanged: (value) {
              setState(() {
                drawAboveChild = value ?? false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget childOppositeLightsourceSelector() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("OppositeLight"),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Checkbox(
            value: childOppositeLightsourceChild,
            onChanged: (value) {
              setState(() {
                childOppositeLightsourceChild = value ?? false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget sizeSelector() {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 12,
        ),
        const Text("W: "),
        Expanded(
          child: Slider(
            min: minWidth,
            max: maxWidth,
            value: width,
            onChanged: (value) {
              setState(() {
                width = value;
              });
            },
          ),
        ),
        const Text("H: "),
        Expanded(
          child: Slider(
            min: minHeight,
            max: maxHeight,
            value: height,
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget cornerRadiusSelector() {
    if (boxShape.isRoundRect || boxShape.isBeveled) {
      return Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text("Corner"),
          ),
          Expanded(
            child: Slider(
              min: 0,
              max: 30,
              value: cornerRadius,
              onChanged: (value) {
                setState(() {
                  cornerRadius = value;
                  if (boxShape.isRoundRect) {
                    boxShape = NeumoBoxShape.roundRect(
                        BorderRadius.circular(cornerRadius));
                  }
                  if (boxShape.isBeveled) {
                    boxShape = NeumoBoxShape.beveled(
                        BorderRadius.circular(cornerRadius));
                  }
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(cornerRadius.floor().toString()),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
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

  Widget boxshapeWidget() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.primary;
    const Color buttonInnactiveColor = Colors.white;

    const Color textActiveColor = Colors.white;
    final Color textInactiveColor = Colors.black.withOpacity(0.3);

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  boxShape = NeumoBoxShape.roundRect(
                      BorderRadius.circular(cornerRadius));
                });
              },
              child: Text(
                "Rect",
                style: TextStyle(
                    color: boxShape.isRoundRect
                        ? textActiveColor
                        : textInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  boxShape = NeumoBoxShape.beveled(
                      BorderRadius.circular(cornerRadius));
                });
              },
              child: Text(
                "Beveled",
                style: TextStyle(
                    color: boxShape.isBeveled
                        ? textActiveColor
                        : textInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  boxShape = const NeumoBoxShape.circle();
                });
              },
              child: Text(
                "Circle",
                style: TextStyle(
                    color: boxShape.isCircle
                        ? textActiveColor
                        : textInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  boxShape = const NeumoBoxShape.stadium();
                });
              },
              child: Text(
                "Stadium",
                style: TextStyle(
                    color: boxShape.isStadium
                        ? textActiveColor
                        : textInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  boxShape = NeumoBoxShape.path(NeumoFlutterLogoPathProvider());
                });
              },
              child: Text(
                "Custom",
                style: TextStyle(
                    color: boxShape.isCustomPath
                        ? textActiveColor
                        : textInactiveColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget shapeWidget() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.primary;
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
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.concave;
                });
              },
              child: Text(
                "Concave",
                style: TextStyle(
                    color: shape == NeumoShape.concave
                        ? iconActiveColor
                        : iconInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.convex;
                });
              },
              child: Text(
                "Convex",
                style: TextStyle(
                    color: shape == NeumoShape.convex
                        ? iconActiveColor
                        : iconInactiveColor),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                setState(() {
                  shape = NeumoShape.flat;
                });
              },
              child: Text(
                "Flat",
                style: TextStyle(
                    color: shape == NeumoShape.flat
                        ? iconActiveColor
                        : iconInactiveColor),
              ),
            ),
          ),
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
