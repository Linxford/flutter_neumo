import 'package:flutter_neumo/flutter_neumo.dart';

class TeslaSample extends StatefulWidget {
  @override
  createState() => _TeslaSampleState();
}

class _TeslaSampleState extends State<TeslaSample> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      theme: NeumoThemeData(
        baseColor: Color(0xFF30353B),
        intensity: 0.3,
        accentColor: Color(0xFF0F95E6),
        lightSource: LightSource.topLeft,
        depth: 2,
      ),
      child: Scaffold(
        body: SafeArea(
          child: NeumoBackground(child: _PageContent()),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF373C43),
        Color(0xFF17181C),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTopBar(context),
          Expanded(flex: 2, child: _buildTitle(context)),
          Expanded(flex: 5, child: _buildCenterContent(context)),
          _buildBottomAction(context),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: _bumpButton(
              Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: _bumpButton(
              Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _bumpButton(Widget child) {
    return Neumo(
      drawSurfaceAboveChild: false,
      style: NeumoStyle(
        color: Color(0xFF2D3238),
        depth: 8,
        boxShape: NeumoBoxShape.circle(),
        intensity: 0.3,
        shape: NeumoShape.concave,
      ),
      child: NeumoButton(
          onPressed: () {},
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(14.0),
          style: NeumoStyle(
            boxShape: NeumoBoxShape.circle(),
            color: Color(0xFF212528),
            depth: 0,
            shape: NeumoShape.convex,
          ),
          child: child),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Tesla",
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
        Text(
          "CyberTruck",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "297",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              "km",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            height: 280,
            child: Padding(
              padding: EdgeInsets.only(top: 35),
              child: Image.asset(
                "assets/images/tesla_cropped.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18),
      child: Column(
        children: <Widget>[
          Text(
            "A/C is turned on",
            style: TextStyle(
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          NeumoButton(
            drawSurfaceAboveChild: false,
            onPressed: () {},
            padding: EdgeInsets.all(4),
            style: NeumoStyle(
              depth: 10,
              boxShape: NeumoBoxShape.circle(),
              color: NeumoTheme.accentColor(context),
              shape: NeumoShape.flat,
            ),
            child: Neumo(
              style: NeumoStyle(
                surfaceIntensity: 0.7,
                depth: 0,
                boxShape: NeumoBoxShape.circle(),
                shape: NeumoShape.concave,
                color: NeumoTheme.accentColor(context),
              ),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Icon(
                  Icons.lock,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Tap to open the car",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
