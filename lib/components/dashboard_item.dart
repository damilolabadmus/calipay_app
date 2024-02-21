

import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  final String? message;
  final Function? press;
  final String? image;

  const DashboardItem(
      {Key? key, this.message, this.press, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
            onTap: press as void Function()?,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: const Color(0xFF000E6D)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5,top: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Image.asset(image!, color: Colors.white, height: 80, width: 100)
                    ),
                    Flexible(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(message!,
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins-Regular',
                                ))))
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

