import 'package:findit/utiles/color_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthTextRich extends StatelessWidget {
  const AuthTextRich({
    super.key,
    required this.firstlabel,
    required this.secondlabel,
    required this.secondPage,
  });
  final String firstlabel, secondlabel;
  final Widget secondPage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          maxLines: 2,
          TextSpan(children: [
            TextSpan(
                text: firstlabel,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: ColorHelper.white)),
            const TextSpan(text: " "),
            TextSpan(
                text: secondlabel,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorHelper.buttonColor,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => secondPage),
                      )),
          ])),
    );
  }
}
