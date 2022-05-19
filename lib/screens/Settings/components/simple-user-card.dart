import 'package:flutter/material.dart';
import 'package:settings/theme/mandelbrot.dart' as theme;

class SimpleUserCard extends StatelessWidget {
  late ImageProvider userProfilePic;
  late String userName;
  double? imageRadius;
  Widget? userMoreInfo;
  VoidCallback? onTap;
  TextStyle? textStyle;
  Icon? icon;

  SimpleUserCard({
    required this.userProfilePic,
    required this.userName,
    this.imageRadius = 10,
    this.userMoreInfo,
    this.onTap,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Container(
      width: mediaQueryWidth,
      height: mediaQueryHeight / 2,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            theme.Mandelbrot.secondPageContainerGradient1stColor,
            theme.Mandelbrot.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 10),
              blurRadius: 10,
              color: theme.Mandelbrot.gradientSecond.withOpacity(0.2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: GestureDetector(
              onTap: (onTap == null) ? () {} : onTap,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        mediaQueryWidth / 2), //imageRadius!),
                    child: Image(
                      image: userProfilePic,
                      fit: BoxFit.cover,
                      height: mediaQueryWidth / 2,
                      width: mediaQueryWidth / 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: (icon != null)
                        ? icon!
                        : Icon(
                            Icons.camera,
                            color: Colors.transparent,
                          ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(
              userName,
              style: (textStyle == null)
                  ? TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                  : textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
