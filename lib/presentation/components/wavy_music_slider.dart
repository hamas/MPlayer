import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WavyMusicSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final Color? activeColor;
  final Color? inactiveColor;
  final double trackHeight;
  final double thumbRadius;
  final double waveAmplitude;
  final double waveLength;

  const WavyMusicSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.activeColor,
    this.inactiveColor,
    this.trackHeight = 4.0,
    this.thumbRadius = 10.0,
    this.waveAmplitude = 4.0,
    this.waveLength = 20.0,
  });

  @override
  State<WavyMusicSlider> createState() => _WavyMusicSliderState();
}

class _WavyMusicSliderState extends State<WavyMusicSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _thumbController;
  late Animation<double> _thumbScaleAnimation;
  bool _isInteracting = false;

  @override
  void initState() {
    super.initState();
    _thumbController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _thumbScaleAnimation = Tween<double>(begin: 1.0, end: 1.4).animate(
      CurvedAnimation(parent: _thumbController, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _thumbController.dispose();
    super.dispose();
  }

  void _updateInteraction(bool interacting) {
    if (_isInteracting != interacting) {
      setState(() {
        _isInteracting = interacting;
      });
      if (interacting) {
        _thumbController.forward();
      } else {
        _thumbController.reverse();
      }
    }
  }

  void _handleUpdate(Offset localPosition, Size size) {
    final double extent = size.width - 2 * widget.thumbRadius;
    final double adjustedX = (localPosition.dx - widget.thumbRadius).clamp(
      0.0,
      extent,
    );
    final double newValue =
        widget.min + (adjustedX / extent) * (widget.max - widget.min);

    if (newValue != widget.value) {
      widget.onChanged(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeColor = widget.activeColor ?? theme.colorScheme.primary;
    final inactiveColor =
        widget.inactiveColor ?? theme.colorScheme.surfaceContainerHighest;

    return GestureDetector(
      onHorizontalDragStart: (details) {
        _updateInteraction(true);
        widget.onChangeStart?.call(widget.value);
        _handleUpdate(details.localPosition, context.size!);
      },
      onHorizontalDragUpdate: (details) {
        _handleUpdate(details.localPosition, context.size!);
      },
      onHorizontalDragEnd: (details) {
        _updateInteraction(false);
        widget.onChangeEnd?.call(widget.value);
        HapticFeedback.mediumImpact();
      },
      onTapDown: (details) {
        _updateInteraction(true);
        _handleUpdate(details.localPosition, context.size!);
        HapticFeedback.selectionClick();
      },
      onTapUp: (details) {
        _updateInteraction(false);
        widget.onChangeEnd?.call(widget.value);
      },
      child: AnimatedBuilder(
        animation: _thumbScaleAnimation,
        builder: (context, child) {
          return CustomPaint(
            size: Size.fromHeight(widget.thumbRadius * 3),
            painter: _WavyMusicSliderPainter(
              value: widget.value,
              min: widget.min,
              max: widget.max,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              trackHeight: widget.trackHeight,
              thumbRadius: widget.thumbRadius * _thumbScaleAnimation.value,
              waveAmplitude:
                  widget.waveAmplitude * (_isInteracting ? 1.5 : 1.0),
              waveLength: widget.waveLength,
              isInteracting: _isInteracting,
            ),
          );
        },
      ),
    );
  }
}

class _WavyMusicSliderPainter extends CustomPainter {
  final double value;
  final double min;
  final double max;
  final Color activeColor;
  final Color inactiveColor;
  final double trackHeight;
  final double thumbRadius;
  final double waveAmplitude;
  final double waveLength;
  final bool isInteracting;

  _WavyMusicSliderPainter({
    required this.value,
    required this.min,
    required this.max,
    required this.activeColor,
    required this.inactiveColor,
    required this.trackHeight,
    required this.thumbRadius,
    required this.waveAmplitude,
    required this.waveLength,
    required this.isInteracting,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height / 2;
    final startX = thumbRadius;
    final endX = size.width - thumbRadius;
    final width = endX - startX;

    final progress = (value - min) / (max - min);
    final thumbPosition = startX + width * progress;

    // Paint Inactive Track
    final inactivePaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackHeight
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(thumbPosition, centerY),
      Offset(endX, centerY),
      inactivePaint,
    );

    // Paint Active Track (Wavy)
    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackHeight
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(startX, centerY);

    const step = 2.0;
    for (double x = startX; x <= thumbPosition; x += step) {
      final relativeX = x - startX;
      final y =
          centerY +
          waveAmplitude * math.sin(2 * math.pi * relativeX / waveLength);
      path.lineTo(x, y);
    }
    // Ensure it ends at the thumb
    path.lineTo(thumbPosition, centerY);

    canvas.drawPath(path, activePaint);

    // Paint Thumb
    final thumbPaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;

    // Add shadow when interacting
    if (isInteracting) {
      canvas.drawCircle(
        Offset(thumbPosition, centerY),
        thumbRadius + 2,
        Paint()
          ..color = activeColor.withValues(alpha: 0.2)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
      );
    }

    canvas.drawCircle(Offset(thumbPosition, centerY), thumbRadius, thumbPaint);
  }

  @override
  bool shouldRepaint(covariant _WavyMusicSliderPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.isInteracting != isInteracting ||
        oldDelegate.thumbRadius != thumbRadius ||
        oldDelegate.waveAmplitude != waveAmplitude;
  }
}
