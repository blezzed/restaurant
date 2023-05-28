import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String img;
  const NoDataPage ({Key? key,
    required this.text,
    this.img="assets/images/emptycart.png"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          img,
          height: MediaQuery.of(context).size.height*0.25,
          width: MediaQuery.of(context).size.height*0.25,
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.03,),
        Center(
          child: Text(
              text,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: MediaQuery.of(context).size.height*0.0175,
                color: Theme.of(context).disabledColor,
              )
          ),
        )
      ],
    );
  }
}
