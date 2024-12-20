import 'package:flutter_neumo/flutter_neumo.dart';

import 'samples/sample_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const NeumoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumoThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumoThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NeumoFloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: () {},
      ),
      backgroundColor: NeumoTheme.baseColor(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NeumoButton(
              onPressed: () {
                print("onClick");
              },
              style: const NeumoStyle(
                shape: NeumoShape.flat,
                boxShape: NeumoBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.favorite_border,
                color: _iconsColor(context),
              ),
            ),
            NeumoButton(
                margin: const EdgeInsets.only(top: 12),
                onPressed: () {
                  NeumoTheme.of(context)?.themeMode =
                      NeumoTheme.isUsingDark(context)
                          ? ThemeMode.light
                          : ThemeMode.dark;
                },
                style: NeumoStyle(
                  shape: NeumoShape.flat,
                  boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(8)),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Toggle Theme",
                  style: TextStyle(color: _textColor(context)),
                )),
            NeumoButton(
                margin: const EdgeInsets.only(top: 12),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const SamplesHome();
                  }));
                },
                style: NeumoStyle(
                  shape: NeumoShape.flat,
                  boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(8)),
                  //border: NeumoBorder()
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Go to full sample",
                  style: TextStyle(color: _textColor(context)),
                )),
          ],
        ),
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumoTheme.of(context);
    if (theme?.isUsingDark ?? false) {
      return theme?.current?.accentColor ?? Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumoTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
