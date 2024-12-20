import 'package:flutter_neumo/flutter_neumo.dart';

class AudioPlayerSample extends StatefulWidget {
  const AudioPlayerSample({super.key});

  @override
  _AudioPlayerSampleState createState() => _AudioPlayerSampleState();
}

class _AudioPlayerSampleState extends State<AudioPlayerSample> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
        themeMode: ThemeMode.light,
        theme: const NeumoThemeData(
          defaultTextColor: Color(0xFF3E3E3E),
          baseColor: Color(0xFFDDE6E8),
          intensity: 0.5,
          lightSource: LightSource.topLeft,
          depth: 10,
        ),
        darkTheme:
            neumoDefaultDarkTheme.copyWith(defaultTextColor: Colors.white70),
        child: _Page());
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  bool _useDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NeumoBackground(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 14),
              _buildTopBar(context),
              const SizedBox(height: 80),
              _buildImage(context),
              const SizedBox(height: 30),
              _buildTitle(context),
              const SizedBox(height: 30),
              _buildSeekBar(context),
              const SizedBox(height: 30),
              _buildControlsBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: NeumoButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: const NeumoStyle(
                shape: NeumoShape.flat,
                boxShape: NeumoBoxShape.circle(),
              ),
              child: Icon(
                Icons.navigate_before,
                color: _iconsColor(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Now Playing",
              style: TextStyle(color: NeumoTheme.defaultTextColor(context)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: NeumoButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                setState(() {
                  _useDark = !_useDark;
                  NeumoTheme.of(context)?.themeMode =
                      _useDark ? ThemeMode.dark : ThemeMode.light;
                });
              },
              style: const NeumoStyle(
                shape: NeumoShape.flat,
                boxShape: NeumoBoxShape.circle(),
              ),
              child: Icon(
                Icons.favorite_border,
                color: _iconsColor(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Neumo(
      style: const NeumoStyle(
        boxShape: NeumoBoxShape.circle(),
      ),
      child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            "assets/images/weeknd.jpg",
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Blinding Lights",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 34,
                color: NeumoTheme.defaultTextColor(context))),
        const SizedBox(
          height: 4,
        ),
        Text("The Weeknd",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: NeumoTheme.defaultTextColor(context))),
      ],
    );
  }

  Widget _buildSeekBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "2.00",
                    style:
                        TextStyle(color: NeumoTheme.defaultTextColor(context)),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "3.14",
                    style:
                        TextStyle(color: NeumoTheme.defaultTextColor(context)),
                  )),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          NeumoSlider(
            height: 8,
            min: 0,
            max: 314,
            value: 100,
            onChanged: (value) {},
          )
        ],
      ),
    );
  }

  Widget _buildControlsBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NeumoButton(
          padding: const EdgeInsets.all(18.0),
          onPressed: () {},
          style: const NeumoStyle(
            shape: NeumoShape.flat,
            boxShape: NeumoBoxShape.circle(),
          ),
          child: Icon(
            Icons.skip_previous,
            color: _iconsColor(),
          ),
        ),
        const SizedBox(width: 12),
        NeumoButton(
          padding: const EdgeInsets.all(24.0),
          onPressed: () {},
          style: const NeumoStyle(
            shape: NeumoShape.flat,
            boxShape: NeumoBoxShape.circle(),
          ),
          child: Icon(
            Icons.play_arrow,
            size: 42,
            color: _iconsColor(),
          ),
        ),
        const SizedBox(width: 12),
        NeumoButton(
          padding: const EdgeInsets.all(18.0),
          onPressed: () {},
          style: const NeumoStyle(
            shape: NeumoShape.flat,
            boxShape: NeumoBoxShape.circle(),
          ),
          child: Icon(
            Icons.skip_next,
            color: _iconsColor(),
          ),
        ),
      ],
    );
  }

  Color _iconsColor() {
    final theme = NeumoTheme.of(context);
    if (theme?.isUsingDark ?? false) {
      return theme?.current?.accentColor ?? Colors.white;
    } else {
      return theme?.current?.accentColor ?? Colors.black;
    }
  }
}
