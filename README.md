# flutter_neumo

A complete, ready to use, Neumo ui kit for Flutter

[![flutter_logo](/medias/flutter_logo_small.gif)](https://github.com/linxford/Flutter_Neumo)

Try Flutter_Neumo on your browser : 👉 https://flutter_neumo.firebaseapp.com/ 🌐

[![neumo_playground](/medias/playground.gif)](https://github.com/linxford/Flutter_Neumo)

# ⚙️ Installation

https://pub.dev/packages/flutter_neumo

[![pub package](https://img.shields.io/pub/v/flutter_neumo.svg)](
https://pub.dartlang.org/packages/flutter_neumo)
[![pub package](https://api.codemagic.io/apps/5e6113f78b547c3c80edbdb3/5e6113f78b547c3c80edbdb2/status_badge.svg)](https://github.com/linxford/Flutter_Neumo)


```dart
dependencies:
  flutter_neumo: ^1.0.0

//requires  flutter: ">=1.17.0"
```

The in your .dart files
```dart
import 'package:flutter_neumo/flutter_neumo.dart';
```

# 🗂 Widgets

<table>
<thead>
<tr>
<th>Preview</th>
<th>Widget</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
  <td><img width="300px" src="/medias/widgets/container.gif"/></td>
  <td>Neumo</td>
  <td>The main Neumo Widget, a container which adds white/dark gradient depending on a lightsource and a depth </td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/button.gif"/></td>
  <td>NeumoButton</td>
  <td>A neumo button that plays with the depth to respond to user interraction</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/radio.gif"/></td>
  <td>NeumoRadio</td>
  <td>A set of neumophic button whith only one selected at time, depending on a value and groupValue</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/checkbox.gif"/></td>
  <td>NeumoCheckbox</td>
  <td> A button associated with a value, can be checked/unckecked, if checked, takes the accent color</td>
</tr>

<tr>
  <td><img width="300px" src="/medias/widgets/text.png"/></td>
  <td>NeumoText</td>
  <td>A Neumo text (only work with positive depth)</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/icon.png"/></td>
  <td>NeumoIcon</td>
  <td>A Neumo icon (only work with positive depth)</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/textfield.png"/></td>
  <td>material.TextField</td>
  <td>For TextFields, just surround your existing material textfield widget with a Neumo (container)</td>
</tr>

<tr>
  <td><img width="300px" src="/medias/widgets/switch.gif"/> </td>
  <td>NeumoSwitch</td>
  <td>An On/Off toggle, associated with a value, if toggled, takes the accent color </td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/toggle.gif"/> </td>
  <td>NeumoToggle</td>
  <td>An mutiple value toggle, associated with a selecteedIndex</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/slider.gif"/></td>
  <td>NeumoSlider</td>
  <td>A Neumo seekbar (range slider), the user can select a value in a range</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/progress.gif"/></td>
  <td>NeumoProgress</td>
  <td>A determinate progress, takes the displayed percentage</td>
</tr>
<tr>
  <td><img width="300px"src="/medias/widgets/indeterminate.gif"/> </td>
  <td>NeumoProgressIndeterminate</td>
  <td>An inderminate progress-bar</td>
</tr>
<tr>
  <td><img src="/medias/widgets/background.png"/> </td>
  <td>NeumoBackground</td>
  <td>Take the background color of the theme, can clip the screen with a borderRadius</td>
</tr>
<tr>
  <td><img width="300px" src="/medias/widgets/background.png"/> </td>
  <td>NeumoApp</td>
  <td>An application that uses Neumo design. Handle theme, navigation, localisation, and much more</td>
</tr>
<tr>
  <td><img src="/medias/widgets/app_bar.png"/> </td>
  <td>NeumoAppBar</td>
  <td>A Neumorphhic design app bar. Can be used inside Scaffold</td>
</tr>

</tbody>
</table>

## 👀 Showcases

[![Neumo](/medias/samples/sample_form.png)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/samples/sample_clock.png)](https://github.com/Linxford/Flutter_Neumo)

[![Neumo](/medias/samples/sample_galaxy.png)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/samples/sample_widgets.png)](https://github.com/Linxford/Flutter_Neumo)

## 📦 Neumo

```dart

Neumo(
  style: NeumoStyle(
    shape: NeumoShape.concave,
    boxShape: NeumoBoxShape.roundRect(BorderRadius.circular(12)),
    depth: 8,
    lightSource: LightSource.topLeft,
    color: Colors.grey
  ),
  child: ...
)
```

[![Neumo](/medias/neumo_container.gif)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/neumo_circle_container.gif)](https://github.com/Linxford/Flutter_Neumo)

☝️ Playing with LightSource & Depth


### 🛠️ Attributes

| Attributes | Values | Description |
|------------|--------|-------------|
| LightSource | TopLeft, BottomRight, etc. / (dx, dy) | The source of light specifit to the theme or the widget, used to project white/dark shadows on neumo elements |
| [Shape](#-shapes) | Concave / Convex / Flat | The shape of the curve used in the neumo container |
| [Depth](#depth) | -20 <= double <= 20 | The distance of the widget to his parent. Can be negative => emboss. It influences on the shadow's color and its size/blur |
| [Intensity](#intensity) | 0 <= double <= 1 | The intensity of the Light, it influences on the shadow's color |
| [SurfaceIntensity](surfaceintensity) | 0 <= double <= 1 | The intensity of the Surface, it influences on the concave/convex darkness |
| Color | any Color | The default color of  Neumo elements |
| Accent | any Color | The default accent color of the Neumo element when activated (eg: checkbox) |
| Variant | any Color | The default secondary color of the Neumo element (eg: used as second color on the progress gradient) |
| [BoxShape](#-custom-shape) | Circle, RoundRect(radius), Stadium, Path | The box shape of a Neumo element. Stadium : roundrect with cirlces on each side |
| [Border](#-accessibility--border) | NeumoBorder | A border (color/width) to enhance contrast with background and others elements |

[![Neumo](/medias/doc/depth.gif)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/doc/intensity.gif)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/doc/surface_intensity.gif)](https://github.com/Linxford/Flutter_Neumo)
[![Neumo](/medias/doc/lightsource.gif)](https://github.com/Linxford/Flutter_Neumo)


### 🔧 Shapes

<table>
<thead>
<tr>
<th>Shape</th>
<th>Widget</th>
<th>Image</th>
<th>Condition</th>
</tr>
</thead>
<tbody>

<tr>
  <td>Flat</td>
  <td><img src="/medias/shapes/widget_flat.png"/></td>
  <td><img src="/medias/shapes/flat.png"/> </td>
  <td>depth >= 0 && shape == Flat</td>
</tr>


<tr>
  <td>Convex</td>
  <td><img src="/medias/shapes/widget_convex.png"/></td>
  <td><img src="/medias/shapes/convex.png"/> </td>
  <td>depth >= 0 && shape == Convex</td>
</tr>



<tr>
  <td>Concave</td>
  <td><img src="/medias/shapes/widget_concave.png"/></td>
  <td><img src="/medias/shapes/concave.png"/> </td>
  <td>depth >= 0 && shape == Concave</td>
</tr>


<tr>
  <td>Emboss</td>
  <td><img src="/medias/shapes/widget_emboss.png"/></td>
  <td><img src="/medias/shapes/emboss.png"/> </td>
  <td>depth < 0</td>
</tr>

</tbody>
</table>

## Neumo Text

[![text](/medias/widgets/text.png)](https://github.com/Linxford/Flutter_Neumo)

**Text only handle positive depth**

```dart
child: NeumoText(
        "I love flutter",
        style: NeumoStyle(
          depth: 4,  //customize depth here
          color: Colors.white, //customize color here
        ),
        textStyle: NeumoTextStyle(
          fontSize: 18, //customize size here
          // AND others usual text style properties (fontFamily, fontWeight, ...)
        ),
    ),
```


## Neumo Icon

[![custom_shape](/medias/neumo_icon.png)](https://github.com/Linxford/Flutter_Neumo)

```dart
child: NeumoIcon(
        Icons.add_circle,
        size: 80,
    ),
```

How to display **SVG** icons ?

Simply use [https://fluttericon.com/](https://fluttericon.com/) to export your svg as .ttf & use NeumoIcon(YOUR_ICON)

[![custom_shape](/medias/flutter_svg.png)](https://fluttericon.com/)

## 🎨 Custom Shape

[![custom_shape](/medias/custom_shape.gif)](https://github.com/Linxford/Flutter_Neumo)

Flutter Neumo supports custom shapes, just provide a path to

```dart
class MyShapePathProvider extends NeumoPathProvider {
  @override
  bool shouldReclip(NeumoPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width/2, 0)
      ..lineTo(size.width, size.height/2)
      ..lineTo(size.width/2, size.height/2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }
}
```

And use `NeumoBoxShape.path`

```dart
Neumo(
  style: NeumoStyle(
     boxShape: NeumoBoxShape.path(MyShapePathProvider()),
  ),
  ...
),
```

You can import the Flutter logo as a custom shape using

```dart
Neumo(
  style: NeumoStyle(
    shape: NeumoBoxShape.path(NeumoFlutterLogoPathProvider()),
  ),
  ...
),
```

## 🔲 Accessibility / Border

For design purposes, or simply to enhance accessibility,
you can add a border on Neumo widgets

[![Neumo](/medias/border.gif)](https://github.com/Linxford/Flutter_Neumo)

```dart
Neumo(
      style: NeumoStyle(
        border: NeumoBorder(
          color: Color(0x33000000),
          width: 0.8,
        )
      ),
      ...
)
```

You can enable/disable it (eg: listening an Accessibility Provider) with `isEnabled`

```dart
border: NeumoBorder(
    isEnabled: true,
    color: Color(0x33000000),
    width: 0.8,
)
```

Note that `borderColor` and `borderWidth` default values has been added to `NeumoThemeData`

## 🎨 Neumo Theme


[![neumo_theme](/medias/toggleDark.gif)](https://github.com/Linxford/Flutter_Neumo)
[![neumo_theme](/medias/toggleTheme.gif)](https://github.com/Linxford/Flutter_Neumo)

```dart
NeumoTheme(
    themeMode: ThemeMode.light, //or dark / system
    darkTheme: NeumoThemeData(
        baseColor: Color(0xff333333),
        accentColor: Colors.green,
        lightSource: LightSource.topLeft,
        depth: 4,
        intensity: 0.3,
    ),
    theme: NeumoThemeData(
        baseColor: Color(0xffDDDDDD),
        accentColor: Colors.cyan,
        lightSource: LightSource.topLeft,
        depth: 6,
        intensity: 0.5,
    ),
    child: ...
)
```

To retrieve the current used theme :

```dart
final theme = NeumoTheme.currentTheme(context);
final baseColor = theme.baseColor;
final accentColor = theme.accentColor;
...
```

Toggle from light to dark
```dart
NeumoTheme.of(context).themeMode = ThemeMode.dark;
```

Know if using dark
```dart
if(NeumoTheme.of(context).isUsingDark){

}
```

# NeumoApp

You can use direcly in your project a `NeumoApp`, surrounding your code

It handle directly NeumoTheme & Navigation (and all possibilities of MaterialApp )

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumoApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumo App',
      themeMode: ThemeMode.light,
      theme: NeumoThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumoThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
    );
  }
}
```

# What's neumo

[![neumo](/medias/neumo.jpg)]()

## Material Cards

A Modern / Material (upgraded) card usually is a surface floating on top of our perceived background and casting a shadow onto it. The shadow both gives it depth and also in many cases defines the shape itself — as it’s quite often borderless.

## Neumo cards

Neumo card however pretends to extrude from the background. It’s a raised shape made from the exact same material as the background. When we look at it from the side we see that it doesn’t “float”.

[![neumo_button](/medias/button_press.gif)](https://github.com/Linxford/Flutter_Neumo)

Here's a Nereumorphic Button tap (slowed x2) from the sample app, you can see how the element seems to change its depth to its surface.

<!--
# 👥 Contributors


|                                                                                | Contributors |
|:------------------------------------------------------------------------------:|--------------| -->
<!-- | [![florent](/medias/contributors/florent.jpeg)](https://github.com/florent37) | [Florent Champigny](https://github.com/florent37) |
| [![olivier](/medias/contributors/olivier.png)](https://github.com/Debilobob)  | [Olivier Bonvila](https://github.com/Debilobob)  |
| [![gyl](/medias/contributors/gyl.png)](https://github.com/almighty972)        | [Gyl Jean Lambert](https://github.com/almighty972)  |
| [![jaumard](/medias/contributors/jaumard.jpeg)](https://github.com/jaumard)    | [Jimmy Aumard](https://github.com/jaumard)  |
| [![Overman775](/medias/contributors/overman775.jpeg)](https://github.com/Overman775)    | [Overman775](https://github.com/Overman775)  |
| [![schopy](/medias/contributors/schopy.jpeg)](https://github.com/schopy)    | [schopy](https://github.com/schopy)  | -->


## 📄 License


Flutter_Neumo is released under the Apache2 license.
See [LICENSE](./LICENSE) for details.

If you use the open-source library in your project, please make sure to credit and backlink to www.idean.com

[![bottom_banner](/medias/bottom_banner.png)](https://www.idean.com)
