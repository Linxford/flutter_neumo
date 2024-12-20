import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/color_selector.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class SwitchWidgetPage extends StatefulWidget {
  const SwitchWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<SwitchWidgetPage> {
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
          title: "Switch",
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
              _ColorizableWidget(),
              const ColorizableThumbSwitch(),
              _FlatConcaveConvexWidget(),
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
  bool isChecked = false;
  bool isEnabled = true;

  Widget _buildCode(BuildContext context) {
    return const Code("""
bool isChecked;

NeumoSwitch(
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
          NeumoSwitch(
            isEnabled: isEnabled,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          const SizedBox(width: 12),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
              child: Text(isEnabled ? 'Disable' : 'Enable'))
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
bool isChecked;

NeumoSwitch(
    value: isChecked,
    style: NeumoSwitchStyle(
         thumbShape: NeumoShape.flat
         //or convex, concave
    ),
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
              NeumoSwitch(
                style: const NeumoSwitchStyle(thumbShape: NeumoShape.flat),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              )
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
              NeumoSwitch(
                style: const NeumoSwitchStyle(thumbShape: NeumoShape.concave),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
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
              NeumoSwitch(
                style: const NeumoSwitchStyle(thumbShape: NeumoShape.convex),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
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

class _ColorizableWidget extends StatefulWidget {
  @override
  createState() => _ColorizableWidgetState();
}

class _ColorizableWidgetState extends State<_ColorizableWidget> {
  bool isChecked = false;
  Color currentColor = Colors.green;

  Widget _buildCode(BuildContext context) {
    return const Code("""
bool isChecked;

NeumoSwitch(
    value: isChecked,
    style: NeumoSwitchStyle(
        activeTrackColor: Colors.green
    ),
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
          NeumoSwitch(
            value: isChecked,
            style: NeumoSwitchStyle(activeTrackColor: currentColor),
            onChanged: (value) {
              setState(() {
                isChecked = value;
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

class ColorizableThumbSwitch extends StatefulWidget {
  const ColorizableThumbSwitch({super.key});

  @override
  createState() => _ColorizableThumbSwitchState();
}

class _ColorizableThumbSwitchState extends State<ColorizableThumbSwitch> {
  bool isChecked = false;
  Color thumbColor = Colors.purple;
  Color trackColor = Colors.lightGreen;

  Widget _buildCode(BuildContext context) {
    return const Code("""
bool isChecked;

NeumoSwitch(
    value: isChecked,
    style: NeumoSwitchStyle(
          activeTrackColor: Colors.lightGreen,
          activeThumbColor: Colors.purple
    ),
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
            "Track",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          ColorSelector(
            color: trackColor,
            onColorChanged: (color) {
              setState(() {
                trackColor = color;
              });
            },
          ),
          const SizedBox(width: 12),
          Text(
            "Thumb",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          ColorSelector(
            color: thumbColor,
            onColorChanged: (color) {
              setState(() {
                thumbColor = color;
              });
            },
          ),
          const SizedBox(width: 12),
          NeumoSwitch(
            value: isChecked,
            style: NeumoSwitchStyle(
                activeTrackColor: trackColor, activeThumbColor: thumbColor),
            onChanged: (value) {
              setState(() {
                isChecked = value;
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

class _EnabledDisabledWidget extends StatefulWidget {
  @override
  createState() => _EnabledDisabledWidgetState();
}

class _EnabledDisabledWidgetState extends State<_EnabledDisabledWidget> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  Widget _buildCode(BuildContext context) {
    return const Code("""
bool isChecked;

NeumoSwitch(
    value: isChecked,
    isEnabled: false,
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
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Enabled",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              NeumoSwitch(
                style: const NeumoSwitchStyle(thumbShape: NeumoShape.concave),
                value: isChecked1,
                onChanged: (value) {
                  setState(() {
                    isChecked1 = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "Disabled",
                  style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
                ),
              ),
              const SizedBox(width: 12),
              NeumoSwitch(
                isEnabled: false,
                style: const NeumoSwitchStyle(thumbShape: NeumoShape.convex),
                value: isChecked2,
                onChanged: (value) {
                  setState(() {
                    isChecked2 = value;
                  });
                },
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
