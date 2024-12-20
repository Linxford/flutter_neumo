import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class RadioButtonWidgetPage extends StatefulWidget {
  const RadioButtonWidgetPage({Key key}) : super(key: key);

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<RadioButtonWidgetPage> {
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
        appBar: TopBar(
          title: "Radios",
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
              CircleRadios(),
              _EnabledDisabledWidget(),
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
  int groupValue;

  Widget _buildCode(BuildContext context) {
    return const Code("""
int groupValue;

NeumoRadio(
    groupValue: groupValue
    value: 1991,
    onChanged: (value) {
        setState(() {
          groupValue = value;
        });
    },
    child: Text("2012"),
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
          NeumoRadio(
            //uncomment to test colors
            //style: NeumoRadioStyle(
            //  selectedColor: Colors.black,
            //  unselectedColor: Colors.blue
            //),
            groupValue: groupValue,
            value: 1991,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(8.0),
            child: const Text("1991"),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            value: 2000,
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(8.0),
            child: const Text("2000"),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            groupValue: groupValue,
            value: 2012,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(8.0),
            child: const Text("2012"),
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

class CircleRadios extends StatefulWidget {
  const CircleRadios({super.key});

  @override
  createState() => _CircleRadiosState();
}

class _CircleRadiosState extends State<CircleRadios> {
  String groupValue;

  Widget _buildCode(BuildContext context) {
    return const Code("""
String groupValue;

NeumoRadio(
    groupValue: groupValue
    style: NeumoRadioStyle(boxShape: NeumoBoxShape.circle()),
    value: "A",
    onChanged: (value) {
        setState(() {
          groupValue = value;
        });
    },
    child: Text("A"),
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
          NeumoRadio(
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
            ),
            groupValue: groupValue,
            value: "A",
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(18.0),
            child: const Text("A"),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            value: "B",
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
            ),
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(18.0),
            child: const Text("B"),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
            ),
            groupValue: groupValue,
            value: "C",
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
            padding: const EdgeInsets.all(18.0),
            child: const Text("C"),
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

class _EnabledDisabledWidget extends StatefulWidget {
  @override
  createState() => _EnabledDisabledWidgetState();
}

class _EnabledDisabledWidgetState extends State<_EnabledDisabledWidget> {
  int groupValue;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Enabled :",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            groupValue: groupValue,
            value: 1,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: const Text("First"),
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          const SizedBox(width: 24),
          Text(
            "Disabled :",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          NeumoRadio(
            isEnabled: false,
            groupValue: groupValue,
            value: 2,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            child: const Text("Second"),
            onChanged: (value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return const Code("""
int groupValue;

NeumoRadio(
     isEnabled: false,
     groupValue: groupValue,
     value: 2,
     onChanged: (value) {
       setState(() {
         isChecked = value;
       });
     },
     child: Text("Second"),
),
""");
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
