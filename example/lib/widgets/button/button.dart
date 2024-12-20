import 'package:flutter_neumo/flutter_neumo.dart';

class ButtonSample extends StatefulWidget {
  const ButtonSample({super.key});

  @override
  createState() => _ButtonSampleState();
}

class _ButtonSampleState extends State<ButtonSample> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
        themeMode: ThemeMode.light,
        theme: const NeumoThemeData(
          baseColor: Color(0xFFFFFFFF),
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        darkTheme: const NeumoThemeData(
          baseColor: Color(0xFF000000),
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        child: _Page());
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => __PageState();
}

class __PageState extends State<_Page> {
  bool _useDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("back"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _useDark = !_useDark;
                  NeumoTheme.of(context)?.themeMode =
                      _useDark ? ThemeMode.dark : ThemeMode.light;
                });
              },
              child: const Text("toggle theme"),
            ),
            const SizedBox(height: 34),
            _buildTopBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Center(
      child: NeumoButton(
        onPressed: () {
          debugPrint("click");
        },
        style: const NeumoStyle(
          shape: NeumoShape.flat,
          boxShape: NeumoBoxShape.circle(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Icons.favorite_border,
            color: _iconsColor(),
          ),
        ),
      ),
    );
  }

  Color _iconsColor() {
    final theme = NeumoTheme.of(context);
    if (theme?.isUsingDark ?? false) {
      return theme?.current?.accentColor ?? Colors.grey;
    } else {
      return Colors.black;
    }
  }
}
