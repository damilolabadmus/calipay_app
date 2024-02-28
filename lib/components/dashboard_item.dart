
import 'package:flutter/material.dart';
import '../style/theme.dart' as Style;

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
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white, border: Border.all(width: 0.5, color: Style.Colors.buttonBlue)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(image!, color: Style.Colors.redBrown.withOpacity(0.7), height: 20, width: 20)
                    ),
                    Flexible(
                        child: Text(message!,
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Style.Colors.buttonBlue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins-Regular',
                            )))
                  ],
                ),
              ),
            ))
      ],
    );
  }
}



class ProductItem extends StatelessWidget {
  final String? message;
  final String? price;
  final Function? press;
  final String? image;

  const ProductItem(
      {Key? key, this.message, this.price, this.press, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        InkWell(
            onTap: press as void Function()?,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.8, color: Colors.orangeAccent), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(image!, height: 30, width: 40)
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                        child: Text(message!,
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Style.Colors.buttonBlue,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins-Regular',
                            ))),
                    Flexible(
                      child: Text(price!,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Style.Colors.buttonBlue,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins-Regular',
                          )),
                    ),
                    Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.orangeAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0 ),
                        child: Text('Add to Cart', style: TextStyle(color: Style.Colors.white)),
                      )
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

