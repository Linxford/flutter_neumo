import 'package:example/lib/top_bar.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

class ClockAlarmPage extends StatelessWidget {
  const ClockAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      theme: const NeumoThemeData(
          defaultTextColor: Color(0xFF303E57),
          accentColor: Color(0xFF7B79FC),
          variantColor: Colors.black38,
          baseColor: Color(0xFFF8F9FC),
          depth: 8,
          intensity: 0.5,
          lightSource: LightSource.topLeft),
      themeMode: ThemeMode.light,
      child: Material(
        child: NeumoBackground(
          child: _Page(),
        ),
      ),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  createState() => _ClockPageState();
}

class _ClockPageState extends State<_Page> {
  final List<Alarm> items = [
    const Alarm(
      enabled: true,
      time: "8:30 AM",
      label: "Awake !",
    ),
    const Alarm(
      enabled: false,
      time: "8:45 AM",
      label: "Wake up !",
    ),
    const Alarm(
      enabled: false,
      time: "9:00 AM",
      label: "Hurry up !",
    ),
    const Alarm(
      enabled: false,
      time: "2:00 AM",
      label: "Lunchtime",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
            child: TopBar(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Alarm",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      shadows: const [
                        Shadow(
                            color: Colors.black38,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2)
                      ],
                      color: NeumoTheme.defaultTextColor(context),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Neumo(
                    style: NeumoStyle(
                      depth: 20,
                      intensity: 0.4,
                      boxShape:
                          NeumoBoxShape.roundRect(BorderRadius.circular(8)),
                    ),
                    child: NeumoButton(
                      padding: const EdgeInsets.all(12.0),
                      style: NeumoStyle(
                        depth: -1,
                        boxShape:
                            NeumoBoxShape.roundRect(BorderRadius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFFC1CDE5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const _Divider(),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlarmCell(items[index]);
              },
              itemCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}

class AlarmCell extends StatelessWidget {
  final Alarm alarm;

  const AlarmCell(this.alarm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      alarm.time,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        shadows: const [
                          Shadow(
                              color: Colors.black38,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2)
                        ],
                        color: NeumoTheme.defaultTextColor(context),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      alarm.label,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: NeumoTheme.variantColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Neumo(
                        style: const NeumoStyle(
                          depth: 8,
                          intensity: 0.5,
                          boxShape: NeumoBoxShape.stadium(),
                        ),
                        child: NeumoSwitch(
                          style: const NeumoSwitchStyle(
                              inactiveTrackColor: Color(0xffC1CDE5)),
                          height: 30,
                          value: alarm.enabled,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const _Divider(),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 1,
      child: Neumo(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        style: NeumoStyle(
          depth: -4,
          boxShape: NeumoBoxShape.stadium(),
        ),
        child: SizedBox(
          height: 6,
        ),
      ),
    );
  }
}

class Alarm {
  final bool enabled;
  final String time;
  final String label;

  const Alarm({
    required this.enabled,
    required this.time,
    required this.label,
  });
}
