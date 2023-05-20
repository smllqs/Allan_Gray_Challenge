import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  double? letterspacing;
  FontWeight? fontWeight;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
        this.color = const Color(0xFF332d2b),
        required this.text,
        this.letterspacing = 2,
        this.fontWeight = FontWeight.w400,
        this.size = 20,
        this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        fontSize: size,
        letterSpacing: letterspacing
      ),
    );
  }
}
