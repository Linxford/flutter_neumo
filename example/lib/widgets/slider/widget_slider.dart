import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class SliderWidgetPage extends StatefulWidget {
  const SliderWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<SliderWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      themeMode: ThemeMode.light,
      theme: const NeumoThemeData(
        lightSource: LightSource.topLeft,
        accentColor: NeumoColors.accent,
        depth: 4,
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
        appBar: const TopBar(
          title: "Slider",
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
              _ColorWidget(),
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
  double age = 20;

  Widget _buildCode(BuildContext context) {
    return const Code("""
double age = 20;

Expanded(
  child: NeumoSlider(
      value: age,
      min: 18,
      max: 90,
      onChanged: (value) {
        setState(() {
          age = value;
        });
      },
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
          Expanded(
            child: NeumoSlider(
              value: age,
              min: 18,
              max: 90,
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "${age.round()}",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
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

class _ColorWidget extends StatefulWidget {
  @override
  createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<_ColorWidget> {
  double age = 50;

  Widget _buildCode(BuildContext context) {
    return const Code("""
double age = 50;

Expanded(
  child: NeumoSlider(
      style: SliderStyle(
           accent: Colors.green,
           variant: Colors.purple,
      ),
      value: age,
      min: 18,
      max: 90,
      onChanged: (value) {
        setState(() {
          age = value;
        });
      },
  ),
),
""");
  }

  Color accent = Colors.green;
  Color variant = Colors.purple;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Text("Accent : "),
              ColorSelector(
                onColorChanged: (color) {
                  setState(() {
                    accent = color;
                  });
                },
                color: accent,
              ),
              const SizedBox(width: 12),
              const Text("Variant : "),
              ColorSelector(
                onColorChanged: (color) {
                  setState(() {
                    variant = color;
                  });
                },
                color: variant,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Text(
                "Default",
                style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NeumoSlider(
                  style: SliderStyle(
                    accent: accent,
                    variant: variant,
                  ),
                  value: age,
                  min: 18,
                  max: 90,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${age.round()}",
                style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
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
