import 'dart:ui';

import 'package:flutter_neumo/flutter_neumo.dart';

class CreditCardSample extends StatefulWidget {
  const CreditCardSample({super.key});

  @override
  createState() => _CreditCardSampleState();
}

class _CreditCardSampleState extends State<CreditCardSample> {
  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      theme: const NeumoThemeData(
          intensity: 0.6, lightSource: LightSource.topLeft, depth: 5),
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
  int _dotIndex = 1;
  bool _useDark = false;

  @override
  Widget build(BuildContext context) {
    return NeumoBackground(
      borderRadius: BorderRadius.circular(12),
      margin: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 14),
          _buildTopBar(context),
          const SizedBox(height: 30),
          Expanded(child: _buildCard(context)),
          const SizedBox(height: 30),
          _buildDots(context),
          const SizedBox(height: 30),
          _buildBalance(context),
          const SizedBox(height: 30),
          _buildIndicator(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      child: Neumo(
        style: NeumoStyle(
          depth: 10,
          boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(20)),
          shape: NeumoShape.flat,
        ),
        child: Neumo(
          margin: const EdgeInsets.all(8),
          style: NeumoStyle(
            depth: 10,
            boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(20)),
            shape: NeumoShape.flat,
          ),
          child: SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  //Image.asset("assets/images/map.jpg", fit: BoxFit.cover),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                            Colors.purple.withOpacity(0.5),
                            Colors.red.withOpacity(0.5)
                          ])),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Positioned(
                        top: 12,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "VISA",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "1234 5678",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              "1234 5678",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 16,
                        child: SizedBox(
                          height: 60,
                          child: Neumo(
                            style: NeumoStyle(
                              depth: 5,
                              intensity: 0.8,
                              lightSource: LightSource.topLeft,
                              boxShape: NeumoBoxShape.roundRect(
                                BorderRadius.circular(12),
                              ),
                            ),
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Image.asset(
                                    "assets/images/credit_card_chip.png")),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 16,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "09/24",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Stack(
                              children: <Widget>[
                                Neumo(
                                  style: NeumoStyle(
                                      shape: NeumoShape.convex,
                                      depth: -10,
                                      boxShape: const NeumoBoxShape.circle(),
                                      color: Colors.grey[300]),
                                  child: const SizedBox(
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Neumo(
                                    style: NeumoStyle(
                                        shape: NeumoShape.convex,
                                        boxShape: NeumoBoxShape.circle(),
                                        depth: 10),
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: const NeumoStyle(
                shape: NeumoShape.flat,
                boxShape: NeumoBoxShape.circle(),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.navigate_before),
              ),
            ),
          ),
          const Align(alignment: Alignment.center, child: Text("Card")),
          Align(
            alignment: Alignment.centerRight,
            child: NeumoButton(
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
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.loop),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalance(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Balance",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      color: Color(0xFF3E3E3E)))),
          Align(
              alignment: Alignment.centerRight,
              child: Text("\$ 14,020.44",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF3E3E3E)))),
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          NeumoIndicator(
            percent: 0.3,
            padding: const EdgeInsets.all(3),
            orientation: NeumoIndicatorOrientation.horizontal,
            height: 20,
            style: IndicatorStyle(
              accent: Colors.grey[100],
              variant: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft, child: Text("Credit limit")),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text("\$ 220 / \$ 1000")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDots(BuildContext context) {
    const double dotsSize = 18;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumoRadio(
            groupValue: _dotIndex,
            value: 0,
            onChanged: (value) {
              setState(() {
                _dotIndex = value!;
              });
            },
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
              shape: NeumoShape.convex,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumoRadio(
            groupValue: _dotIndex,
            value: 1,
            onChanged: (value) {
              setState(() {
                _dotIndex = value!;
              });
            },
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
              shape: NeumoShape.convex,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: dotsSize,
          height: dotsSize,
          child: NeumoRadio(
            groupValue: _dotIndex,
            value: 2,
            onChanged: (value) {
              setState(() {
                _dotIndex = value!;
              });
            },
            style: const NeumoRadioStyle(
              boxShape: NeumoBoxShape.circle(),
              shape: NeumoShape.convex,
            ),
          ),
        )
      ],
    );
  }
}
