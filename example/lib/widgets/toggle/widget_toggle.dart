import 'package:example/lib/Code.dart';
import 'package:example/lib/ThemeConfigurator.dart';
import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class ToggleWidgetPage extends StatefulWidget {
  const ToggleWidgetPage({super.key});

  @override
  createState() => _WidgetPageState();
}

class _WidgetPageState extends State<ToggleWidgetPage> {
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
          title: "Toggle",
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
              _SmallWidget(),
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
  int _selectedIndex = 0;

  Widget _buildCode(BuildContext context) {
    return Code("""
Expanded(
  child: NeumoToggle(
    height: 50,
    selectedIndex: _selectedIndex,
    displayForegroundOnlyIfSelected: true,
    children: [
      ToggleElement(
        background: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w500),)),
        foreground: Center(child: Text("This week", style: TextStyle(fontWeight: FontWeight.w700),)),
      ),
      ToggleElement(
        background: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w500),)),
        foreground: Center(child: Text("This month", style: TextStyle(fontWeight: FontWeight.w700),)),
      ),
      ToggleElement(
        background: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w500),)),
        foreground: Center(child: Text("This year", style: TextStyle(fontWeight: FontWeight.w700),)),
      )
    ],
    thumb: Neumo(
      boxShape: NeumoBoxShape.roundRect(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
    onChanged: (value) {
      setState(() {
        _selectedIndex = value;
        print("_firstSelected: $_selectedIndex");
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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Default",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: NeumoToggle(
              height: 50,
              style: const NeumoToggleStyle(
                  //backgroundColor: Colors.red,
                  ),
              selectedIndex: _selectedIndex,
              displayForegroundOnlyIfSelected: true,
              children: [
                ToggleElement(
                  background: const Center(
                      child: Text(
                    "This week",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: const Center(
                      child: Text(
                    "This week",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ),
                ToggleElement(
                  background: const Center(
                      child: Text(
                    "This month",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: const Center(
                      child: Text(
                    "This month",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ),
                ToggleElement(
                  background: const Center(
                      child: Text(
                    "This year",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  foreground: const Center(
                      child: Text(
                    "This year",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                )
              ],
              thumb: Neumo(
                style: NeumoStyle(
                  boxShape: NeumoBoxShape.roundRect(
                      const BorderRadius.all(Radius.circular(12))),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                  print("_firstSelected: $_selectedIndex");
                });
              },
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

class _SmallWidget extends StatefulWidget {
  @override
  createState() => _SmallWidgetState();
}

class _SmallWidgetState extends State<_SmallWidget> {
  int _selectedIndex = 1;

  Widget _buildCode(BuildContext context) {
    return Code("""
NeumoToggle(
  height: 45,
  width: 100,
  selectedIndex: _selectedIndex,
  children: [
    ToggleElement(
      background: Center(child: Icon(Icons.arrow_back, color: Colors.grey[800],)),
    ),
    ToggleElement(),
  ],
  thumb: Neumo(
    boxShape: NeumoBoxShape.roundRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Icon(Icons.blur_on, color: Colors.grey,),
  ),
  onAnimationChangedFinished: (value){
    if(value == 0) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('on back !')));
      print("onAnimationChangedFinished: $_selectedIndex");
    }
  },
  onChanged: (value) {
    setState(() {
      _selectedIndex = value;
      print("_firstSelected: $_selectedIndex");
    });
  },
),
""");
  }

  Widget _buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Small",
            style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
          ),
          const SizedBox(width: 12),
          NeumoToggle(
            height: 45,
            width: 100,
            selectedIndex: _selectedIndex,
            children: [
              ToggleElement(
                background: Center(
                    child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey[800],
                )),
              ),
              ToggleElement(),
            ],
            thumb: Neumo(
              style: NeumoStyle(
                boxShape: NeumoBoxShape.roundRect(
                  const BorderRadius.all(Radius.circular(12)),
                ),
              ),
              child: const Icon(
                Icons.blur_on,
                color: Colors.grey,
              ),
            ),
            onAnimationChangedFinished: (value) {
              if (value == 0) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('on back !')));
                print("onAnimationChangedFinished: $_selectedIndex");
              }
            },
            onChanged: (value) {
              setState(() {
                _selectedIndex = value;
                print("_firstSelected: $_selectedIndex");
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
