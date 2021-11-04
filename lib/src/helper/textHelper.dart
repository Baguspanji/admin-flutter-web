import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.title, {
    this.color,
    this.weight,
    this.size,
    this.decoration,
    this.center = true,
  });

  final String title;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final TextDecoration? decoration;
  final bool? center;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: center == false ? Alignment.centerLeft : Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: color == null ? Colors.black : color,
          fontWeight: weight == null ? FontWeight.normal : weight,
          fontSize: size == null ? 20.0 : size,
          decoration: decoration == null ? TextDecoration.none : decoration,
        ),
      ),
    );
  }
}

class InteractiveText extends StatefulWidget {
  final String? text;

  const InteractiveText(@required this.text);

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: _hovering
          ? CustomText(
              widget.text!,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            )
          : CustomText(widget.text!),
    );
  }

  _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}

class LinkItems extends StatelessWidget {
  final String? title;
  final Function? onClick;

  const LinkItems({Key? key, this.title, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick == null ? () {} : onClick!();
      },
      child: InteractiveText(title),
    );
  }
}
