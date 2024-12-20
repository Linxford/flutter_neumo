// ignore_for_file: prefer_const_constructors

import 'package:example/lib/top_bar.dart';
import 'package:example/widgets/appbar/widget_app_bar.dart';
import 'package:example/widgets/toggle/widget_toggle.dart';
import 'package:flutter_neumo/flutter_neumo.dart';

import 'background/widget_background.dart';
import 'button/widget_button.dart';
import 'checkbox/widget_checkbox.dart';
import 'container/widget_container.dart';
import 'icon/widget_icon.dart';
import 'indeterminate_progress/widget_indeterminate_progress.dart';
import 'indicator/widget_indicator.dart';
import 'progress/widget_progress.dart';
import 'radiobutton/widget_radio_button.dart';
import 'range_slider/widget_range_slider.dart';
import 'slider/widget_slider.dart';
import 'switch/widget_switch.dart';

class WidgetsHome extends StatelessWidget {
  const WidgetsHome({super.key});

  Widget _buildButton({required String text, required VoidCallback onClick}) {
    return NeumoButton(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumoStyle(
        boxShape: NeumoBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
        shape: NeumoShape.flat,
      ),
      onPressed: onClick,
      child: Center(child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumoTheme(
      theme: const NeumoThemeData(depth: 8),
      child: Scaffold(
        backgroundColor: NeumoColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const TopBar(title: "Widgets"),
                  _buildButton(
                      text: "Container",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ContainerWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "App bar",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return AppBarWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Button",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ButtonWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Icon",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return IconWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "RadioButton",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RadioButtonWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Checkbox",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return CheckboxWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Switch",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const SwitchWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Toggle",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const ToggleWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Slider",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return SliderWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Range slider",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RangeSliderWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Indicator",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return IndicatorWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Progress",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProgressWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "IndeterminateProgress",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return IndeterminateProgressWidgetPage();
                        }));
                      }),
                  _buildButton(
                      text: "Background",
                      onClick: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return BackgroundWidgetPage();
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
