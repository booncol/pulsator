import 'package:flutter/material.dart';
import 'package:pulsator/src/pulsator.dart';
import 'package:pulsator/src/styles.dart';

/// A widget that displays an icon with a pulsing effect.
///
/// The icon is displayed in the center of the widget. The pulsing effect is
/// displayed as a circle around the icon.
///
/// [icon] is the icon to display. Required.
///
/// [iconColor] is the color of the icon. Default is white.
///
/// [iconSize] is the size of the icon. Default is 24.
///
/// [innerColor] is the color of the inner, non-pulsing circle. Default is the
/// pulse color.
///
/// [innerSize] is the size of the inner, non-pulsing circle. Default is the
/// icon size.
///
/// [pulseColor] is the color of the pulse.
///
/// [pulseSize] is the size of the pulse. Default is 64.
///
/// [pulseCount] is the number of pulses to display. Default is 3.
///
/// [pulseDuration] is the duration of a single pulse animation. Default is 4
/// seconds.
///
/// Example:
/// ```dart
/// PulseIcon(
///  icon: Icons.favorite,
///  pulseColor: Colors.red,
///  pulseCount: 5,
///  pulseDuration: Duration(seconds: 2),
///  iconColor: Colors.white,
///  iconSize: 44,
///  innerSize: 54,
///  pulseSize: 116,
/// )
/// ```
class PulseIcon extends StatelessWidget {
  const PulseIcon({
    required this.icon,
    required this.pulseColor,
    this.iconColor = Colors.white,
    this.iconSize = 24,
    this.pulseSize = 64,
    this.innerColor,
    this.innerSize,
    this.pulseCount = 3,
    this.pulseDuration = const Duration(seconds: 4),
    super.key,
  })  : assert(pulseCount > 0),
        assert(pulseSize > 0.0),
        assert(iconSize > 0.0);

  /// The icon to display.
  final IconData icon;

  /// The color of the icon. Default is white.
  final Color iconColor;

  /// The size of the icon. Default is 24.
  final double iconSize;

  /// The color of the inner, non-pulsing circle. Default is the pulse color.
  final Color? innerColor;

  /// The size of the inner, non-pulsing circle. Default is the icon size.
  final double? innerSize;

  /// The color of the pulse.
  final Color pulseColor;

  /// The size of the pulse. Default is 64.
  final double pulseSize;

  /// The number of pulses to display. Default is 3.
  final int pulseCount;

  /// The duration of a single pulse animation. Default is 4 seconds.
  final Duration pulseDuration;

  @override
  Widget build(BuildContext context) {
    final innerSize = this.innerSize ?? iconSize;
    return SizedBox(
      width: pulseSize,
      height: pulseSize,
      child: Pulsator(
        count: pulseCount,
        duration: pulseDuration,
        startFromScratch: false,
        style: PulseStyle(
          color: pulseColor,
          startSize: innerSize / pulseSize,
          // scaleCurve: Curves.easeOut,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (innerSize > 0.0)
              Container(
                width: innerSize,
                height: innerSize,
                decoration: BoxDecoration(
                  color: innerColor ?? pulseColor,
                  shape: BoxShape.circle,
                ),
              ),
            Icon(icon, color: iconColor, size: iconSize),
          ],
        ),
      ),
    );
  }
}
