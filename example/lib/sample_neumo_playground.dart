import 'package:example/lib/color_selector.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

void main() => runApp(const NeumoPlayground());

class NeumoPlayground extends StatefulWidget {
  const NeumoPlayground({super.key});

  @override
  _NeumoPlaygroundState createState() => _NeumoPlaygroundState();
}

class _NeumoPlaygroundState extends State<NeumoPlayground> {
  @override
  Widget build(BuildContext context) {
    return NeumoApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: const NeumoThemeData(
        baseColor: Color(0xffDDDDDD),
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
      ),
      home: _Page(),
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
  NeumoBoxShape boxShape = NeumoBoxShape.roundRect(BorderRadius.circular(12));

  double depth = 5;
  double intensity = 0.5;
  double surfaceIntensity = 0.5;
  double cornerRadius = 40;
  double height = 150.0;
  double width = 150.0;

  bool haveNeumoChild = false;
  bool childOppositeLightsourceChild = false;
  bool drawAboveChild = false;
  double childMargin = 5;
  double childDepth = 5;

  @override
  void initState() {
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

  Widget _configurators() {
    final Color buttonActiveColor = Theme.of(context).colorScheme.primary;
    const Color buttonInnactiveColor = Colors.white;

    const Color textActiveColor = Colors.white;
    final Color textInactiveColor = Colors.black.withOpacity(0.3);

    return Column(
      children: <Widget>[
        styleCustomizer(),
      ],
    );
  }

  Widget styleCustomizer() {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        //depthSelector(),
        //intensitySelector(),
        //surfaceIntensitySelector(),
        //shapeWidget(),
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
        child: haveNeumoChild
            ? neumoChild()
            : Container(
                //color: Colors.blue,
                child: const Center(child: Text("")),
              ),
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

  Widget lightSourceWidgets() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 20,
          right: 20,
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
          top: 20,
          bottom: 20,
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
