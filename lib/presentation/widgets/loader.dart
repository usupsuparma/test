import 'package:flutter/material.dart';
import 'dart:math';

enum DotType { square, circle, diamond, icon }
enum ColorType { color, white, custom }

class SwitchLoader extends StatelessWidget {
  final bool show;
  final double size;
  final ColorType colorType;
  final Color color;

  const SwitchLoader(
      {Key? key,
      this.show = true,
      this.size = 10,
      this.colorType = ColorType.color,
      this.color = Colors.grey})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return show
        ? Loader(
            size: size,
            colorType: colorType,
            color: color,
          )
        : SizedBox(
            height: size,
          );
  }
}

class Loader extends StatefulWidget {
  final Duration duration;
  final ColorType colorType;
  final double size;
  final Color color;

  Loader({
    this.duration = const Duration(milliseconds: 1000),
    this.colorType = ColorType.color,
    this.size = 10,
    this.color = Colors.grey,
  });

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Opacity(
            opacity: (animation_1.value <= 0.4
                ? 2.5 * animation_1.value
                : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                    ? 1.0
                    : 2.5 - (2.5 * animation_1.value)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4.0),
              child: Dot(
                radius: widget.size,
                color: widget.colorType == ColorType.color
                    ? Colors.yellow
                    : widget.colorType == ColorType.custom
                        ? widget.color
                        : Colors.white,
                type: DotType.circle,
                icon: Icon(Icons.blur_on),
              ),
            ),
          ),
          Opacity(
            opacity: (animation_2.value <= 0.4
                ? 2.5 * animation_2.value
                : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                    ? 1.0
                    : 2.5 - (2.5 * animation_2.value)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4.0),
              child: Dot(
                radius: widget.size,
                color: widget.colorType == ColorType.color
                    ? Colors.grey.shade400
                    : widget.colorType == ColorType.custom
                        ? widget.color
                        : Colors.white,
                type: DotType.circle,
                icon: Icon(Icons.blur_on),
              ),
            ),
          ),
          Opacity(
            opacity: (animation_3.value <= 0.4
                ? 2.5 * animation_3.value
                : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                    ? 1.0
                    : 2.5 - (2.5 * animation_3.value)),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4.0),
              child: Dot(
                radius: widget.size,
                color: widget.colorType == ColorType.color
                    ? Colors.pink
                    : widget.colorType == ColorType.custom
                        ? widget.color
                        : Colors.white,
                type: DotType.circle,
                icon: Icon(
                  Icons.blur_on,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  final DotType type;
  final Icon? icon;

  Dot(
      {this.radius = 10,
      this.color = Colors.white,
      this.type = DotType.circle,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon!.icon,
              color: color,
              size: 1.3 * radius,
            )
          : Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                  color: color,
                  shape: type == DotType.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                ),
              ),
            ),
    );
  }
}
