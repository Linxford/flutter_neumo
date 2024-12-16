import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeumoAccessibility extends StatefulWidget {
  const NeumoAccessibility({super.key});

  @override
  State<NeumoAccessibility> createState() => _NeumoAccessibilityState();
}

class _NeumoAccessibilityState extends State<NeumoAccessibility> {
  late ThemeData theme;
  LightSource lightSource = LightSource.topLeft;
  ShapeType shape = ShapeType.flat;
  double depth = 5;
  double intensity = 0.8;
  double surfaceIntensity = 0.5;
  BorderRadius borderRadius = BorderRadius.circular(20);
  double height = 150.0;
  double width = 150.0;

  late Color borderColor;
  late double borderWidth;

  static const double minWidth = 50.0;
  static const double maxWidth = 200.0;
  static const double minHeight = 50.0;
  static const double maxHeight = 200.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
    borderColor = theme.colorScheme.outline;
    borderWidth = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          surface: Colors.grey.shade300, // Base color for neumo effect
        ),
      ),
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              _buildBackButton(),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildLightSourceWidgets(),
                    Center(child: _buildNeumo()),
                  ],
                ),
              ),
              Expanded(child: _buildConfigurators()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: theme.colorScheme.primary,
        ),
        onPressed: () => Navigator.pop(context),
        child:
            Text('Back', style: TextStyle(color: theme.colorScheme.onPrimary)),
      ),
    );
  }

  Widget _buildNeumo() {
    return GestureDetector(
      onTap: () => setState(() {}),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: _calculateShadowColor(),
              offset: _calculateShadowOffset(),
              blurRadius: depth,
            ),
          ],
          border: borderWidth > 0
              ? Border.all(color: borderColor, width: borderWidth)
              : null,
        ),
      ),
    );
  }

  Color _calculateShadowColor() {
    return theme.brightness == Brightness.light
        ? theme.colorScheme.onSurface.withOpacity(intensity)
        : theme.colorScheme.onSurface.withOpacity(1 - intensity);
  }

  Offset _calculateShadowOffset() {
    return Offset(lightSource.dx * depth, lightSource.dy * depth);
  }

  int selectedConfiguratorIndex = 0;

  Widget _buildConfigurators() {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[300],
      child: Column(
        children: [
          _buildConfiguratorTabs(),
          _buildConfiguratorsChild(),
        ],
      ),
    );
  }

  Widget _buildConfiguratorTabs() {
    return Row(
      children: [
        _buildTabButton("Style", 0),
        _buildTabButton("Element", 1),
        _buildTabButton("Border", 2),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = selectedConfiguratorIndex == index;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isSelected ? theme.colorScheme.primary : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () => setState(() => selectedConfiguratorIndex = index),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfiguratorsChild() {
    switch (selectedConfiguratorIndex) {
      case 0:
        return _styleCustomizer();
      case 1:
        return _elementCustomizer();
      case 2:
        return _borderCustomizer();
      default:
        return const SizedBox();
    }
  }

  Widget _styleCustomizer() {
    return Column(
      children: [
        _slider(
            'Depth', depth, 0, 10, (value) => setState(() => depth = value)),
        _slider('Intensity', intensity, 0, 1,
            (value) => setState(() => intensity = value)),
        _slider('Surface Intensity', surfaceIntensity, 0, 1,
            (value) => setState(() => surfaceIntensity = value)),
      ],
    );
  }

  Widget _elementCustomizer() {
    return Column(
      children: [
        _slider('Corner Radius', borderRadius.topLeft.x, 0, 30, (value) {
          setState(() {});
        }),
        _shapeSelector(),
        _sizeSelector(),
      ],
    );
  }

  Widget _borderCustomizer() {
    return Column(
      children: [
        _colorPicker('Border Color', borderColor,
            (color) => setState(() => borderColor = color)),
        _slider('Border Width', borderWidth, 0, 10,
            (value) => setState(() => borderWidth = value)),
      ],
    );
  }

  Widget _slider(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(label),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(value.floor().toString()),
        ),
      ],
    );
  }

  Widget _colorPicker(String label, Color color, Function(Color) onChanged) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(label),
        ),
        Expanded(
          child: ColorPicker(
            color: color,
            onColorChanged: onChanged,
            pickerColor: color,
          ),
        ),
      ],
    );
  }

  Widget _shapeSelector() {
    return Row(
      children: [
        _shapeOption('Flat', ShapeType.flat),
        _shapeOption('Convex', ShapeType.convex),
        _shapeOption('Concave', ShapeType.concave),
      ],
    );
  }

  Widget _shapeOption(String label, ShapeType shapeType) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                shape == shapeType ? theme.colorScheme.primary : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onPressed: () => setState(() => shape = shapeType),
          child: Text(
            label,
            style: TextStyle(
              color: shape == shapeType
                  ? theme.colorScheme.onPrimary
                  : Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizeSelector() {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text("W: "),
        ),
        Expanded(
          child: Slider(
            value: width,
            min: minWidth,
            max: maxWidth,
            onChanged: (value) => setState(() => width = value),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text("H: "),
        ),
        Expanded(
          child: Slider(
            value: height,
            min: minHeight,
            max: maxHeight,
            onChanged: (value) => setState(() => height = value),
          ),
        ),
      ],
    );
  }

  Widget _buildLightSourceWidgets() {
    return Stack(
      children: [
        Positioned(
          left: 10,
          right: 10,
          child: Slider(
            value: lightSource.dx,
            min: -1,
            max: 1,
            onChanged: (value) =>
                setState(() => lightSource = lightSource.copyWith(dx: value)),
          ),
        ),
        Positioned(
          left: 0,
          top: 10,
          bottom: 10,
          child: RotatedBox(
            quarterTurns: 1,
            child: Slider(
              value: lightSource.dy,
              min: -1,
              max: 1,
              onChanged: (value) =>
                  setState(() => lightSource = lightSource.copyWith(dy: value)),
            ),
          ),
        ),
      ],
    );
  }
}

class LightSource {
  final double dx;
  final double dy;

  LightSource(this.dx, this.dy);

  LightSource copyWith({double? dx, double? dy}) {
    return LightSource(dx ?? this.dx, dy ?? this.dy);
  }
}

enum ShapeType {
  flat,
  convex,
  concave,
}

class ColorPicker extends StatelessWidget {
  final Color color;
  final Function(Color) onColorChanged;

  const ColorPicker(
      {super.key,
      required this.color,
      required this.onColorChanged,
      required Color pickerColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Pick a Color'),
              content: SingleChildScrollView(
                child: ColorPickerWidget(
                  pickerColor: color,
                  onColorChanged: onColorChanged,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ColorPickerWidget extends StatefulWidget {
  final Color pickerColor;
  final Function(Color) onColorChanged;

  const ColorPickerWidget(
      {super.key, required this.pickerColor, required this.onColorChanged});

  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  late Color _currentColor;

  @override
  void initState() {
    _currentColor = widget.pickerColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorPicker(
      pickerColor: _currentColor,
      onColorChanged: (color) {
        setState(() => _currentColor = color);
        widget.onColorChanged(color);
      },
      color: _currentColor,
      // Additional configuration for color picker can be added here
    );
  }
}

// Note: You would need to implement or use a package for the actual color picker widget,
// like `flutter_colorpicker` or `color_picker`.
