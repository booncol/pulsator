import 'package:flutter/material.dart';

/// How the pulse should be scaled to fit the widget size.
enum PulseFit {
  /// The pulse will be scaled to fit the widget size.
  contain,

  /// The pulse will be scaled to fill the widget size.
  cover,
}

/// The style of the pulse gradient.
///
/// [radius] is the radius of the gradient, as a fraction pulse radius.
///
/// [start] is the start point of the gradient, as a fraction of the pulse
/// radius.
///
/// [end] is the end point of the gradient, as a fraction of the pulse radius.
///
/// [startColor] is the start color of the gradient. If null, the pulse color
/// will be used with the opacity set to 0.0.
///
/// [reverseColors] is if the gradient colors should be reversed. If true, the
/// gradient will start from [end] and end at [start].
class PulseGradientStyle {
  /// Make a new [PulseGradientStyle] instance.
  const PulseGradientStyle({
    this.radius = 0.5,
    this.start = 0.0,
    this.end = 1.0,
    this.startColor,
    this.reverseColors = false,
  })  : assert(radius >= 0.0 && radius <= 1.0),
        assert(start >= 0.0 && start <= 1.0),
        assert(end >= 0.0 && end <= 1.0);

  /// The radius of the gradient, as a fraction pulse radius. Default is 0.5.
  final double radius;

  /// The start point of the gradient, as a fraction of the pulse radius.
  /// Default is 0.0.
  final double start;

  /// The end point of the gradient, as a fraction of the pulse radius. Default
  /// is 1.0.
  final double end;

  /// The start color of the gradient. If null, the pulse color will be used
  /// with the opacity set to 0.0.
  final Color? startColor;

  /// Whether the gradient colors should be reversed. If true, the gradient will
  /// start from [end] and end at [start]. Default is false.
  final bool reverseColors;
}

/// The style of the pulse.
///
/// [color] is the main color of the pulse.
///
/// [borderColor] is the border color of the pulse.
///
/// [borderWidth] is the border width of the pulse. If 0, no border will be
/// rendered.
///
/// [gradientStyle] is the gradient style of the pulse. If null, no gradient
/// will be rendered.
///
/// [pulseCurve] is the pulse scale animation curve (default is linear).
///
/// [opacityCurve] is the pulse opacity animation curve (default is linear).
///
/// [fadeOpacity] is if the opacity should be animated from 1.0 to 0.0. Default
///
/// [startSize] is the size of the pulse when it begins, as a fraction of the
/// pulse radius. Default is 0.0.
class PulseStyle {
  /// Make a new [PulseStyle] instance.
  const PulseStyle({
    this.color = Colors.red,
    this.borderColor,
    this.borderWidth,
    this.gradientStyle,
    this.pulseCurve = Curves.linear,
    this.opacityCurve = Curves.linear,
    this.fadeOpacity = true,
    this.startSize = 0.0,
  }) : assert(startSize >= 0.0 && startSize <= 1.0);

  /// Main pulse color.
  final Color color;

  /// Pulse border color. If `null`, no border will be rendered.
  final Color? borderColor;

  /// Pulse border width. If `null`, no border will be rendered.
  final double? borderWidth;

  /// If set, the pulse will be rendered as a gradient.
  final PulseGradientStyle? gradientStyle;

  /// Pulse scale animation curve (default is linear).
  final Curve pulseCurve;

  /// Pulse opacity animation curve (default is linear).
  final Curve opacityCurve;

  /// Whether the opacity should be animated from 1.0 to 0.0. Default is true.
  final bool fadeOpacity;

  /// The size of the pulse when it begins, as a fraction of the pulse radius.
  /// Default is 0.0.
  final double startSize;
}
