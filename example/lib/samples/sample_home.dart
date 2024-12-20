import 'package:example/lib/top_bar.dart';
import 'package:example/samples/audio_player_sample.dart';
import 'package:example/samples/calculator_sample.dart';
import 'package:example/samples/clock/clock_sample.dart';
import 'package:example/samples/credit_card_sample.dart';
import 'package:example/samples/form_sample.dart';
import 'package:example/samples/testla_sample.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

import 'galaxy_sample.dart';
import 'widgets_sample.dart';

class SamplesHome extends StatelessWidget {
  const SamplesHome({super.key});

  Widget _buildButton({String text, VoidCallback onClick}) {
    return NeumoButton(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumoStyle(
        shape: NeumoShape.flat,
        boxShape: NeumoBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
      ),
      onPressed: onClick,
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NeumoTheme(
      theme: NeumoThemeData(depth: 8),
      darkTheme: NeumoThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumoColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopBar(),
                  _buildButton(
                      text: "Tesla",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TeslaSample();
                        }));
                      }),
                  _buildButton(
                      text: "Audio Player",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AudioPlayerSample();
                        }));
                      }),
                  _buildButton(
                      text: "Clock",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ClockSample();
                        }));
                      }),
                  _buildButton(
                      text: "Galaxy",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return GalaxySample();
                        }));
                      }),
                  _buildButton(
                      text: "Calculator",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CalculatorSample();
                        }));
                      }),
                  _buildButton(
                      text: "Form",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FormSample();
                        }));
                      }),
                  _buildButton(
                      text: "CreditCard",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CreditCardSample();
                        }));
                      }),
                  _buildButton(
                      text: "Widgets",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return WidgetsSample();
                        }));
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
