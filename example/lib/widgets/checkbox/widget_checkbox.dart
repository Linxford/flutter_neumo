import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class CheckboxWidgetPage extends StatefulWidget {
  const CheckboxWidgetPage({super.key});

  @override
  State<CheckboxWidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<CheckboxWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return const NeumoTheme(
      themeMode: ThemeMode.light,
      theme: NeumoThemeData(
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
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return NeumoBackground(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: const TopBar(
          title: "Checkbox",
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
              const _DefaultWidget(),
              _ColorWidget(),
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
  const _DefaultWidget();

  @override
  State<_DefaultWidget> createState() => _DefaultWidgetState();
}

class _DefaultWidgetState extends State<_DefaultWidget> {
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;

  Widget _buildCode(BuildContext context) {
    return const Code("""
bool isChecked = false;

NeumoCheckbox(
    value: isChecked,
    onChanged: (value) {
        setState(() {
          isChecked = value;
        });
    },
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
          NeumoCheckbox(
            value: check1,
            onChanged: (value) {
              setState(() {
                check1 = value;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            value: check2,
            onChanged: (value) {
              setState(() {
                check2 = value;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            value: check3,
            onChanged: (value) {
              setState(() {
                check3 = value;
              });
            },
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
  Color customColor = Colors.green;

  bool checkColor1 = false;
  bool checkColor2 = false;
  bool checkColor3 = false;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Colorizable",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          ColorSelector(
            color: customColor,
            onColorChanged: (color) {
              setState(() {
                customColor = color;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            style: NeumoCheckboxStyle(selectedColor: customColor),
            value: checkColor1,
            onChanged: (value) {
              setState(() {
                checkColor1 = value;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            style: NeumoCheckboxStyle(selectedColor: customColor),
            value: checkColor2,
            onChanged: (value) {
              setState(() {
                checkColor2 = value;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            value: checkColor3,
            style: NeumoCheckboxStyle(selectedColor: customColor),
            onChanged: (value) {
              setState(() {
                checkColor3 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return const Code("""

bool isChecked = false;

NeumoCheckbox(
    value: isChecked,
    style: NeumoCheckboxStyle(
        selectedColor: Colors.green,
    ),
    onChanged: (value) {
        setState(() {
          isChecked = value;
        });
    },
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

class _EnabledDisabledWidget extends StatefulWidget {
  @override
  createState() => _EnabledDisabledWidgetState();
}

class _EnabledDisabledWidgetState extends State<_EnabledDisabledWidget> {
  bool check1 = false;
  bool check2 = false;

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          Text(
            "Enabled",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            value: check1,
            onChanged: (value) {
              setState(() {
                check1 = value;
              });
            },
          ),
          const SizedBox(width: 24),
          Text(
            "Disabled",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          NeumoCheckbox(
            isEnabled: false,
            value: check2,
            onChanged: (value) {
              setState(() {
                check2 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCode(BuildContext context) {
    return const Code("""

bool isChecked = false;

NeumoCheckbox(
     isEnabled: false,
     value: isChecked,
     onChanged: (value) {
       setState(() {
         isChecked = value;
       });
     },
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
