import 'package:flutter/cupertino.dart';

class Colors {
  const Colors();

  static const Color backgroundBlue = Color(0xFF000E6D);
  static const Color white = Color(0xFFFFFFFF);
  static const Color searchActiveBg = Color(0xFFE5F8FF);
  static const Color buttonBlue = Color(0xFF000E6D);



  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF5BC0FF), Color(0xFF0063FF)],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [Color(0xFF1e3c72), Color(0xFF2a5298)],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const backgroundGradient = LinearGradient(
    colors: [Color(0xFF00ADEF), Color(0xFF000000)],
    stops: [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class Constants {
  const Constants();

  static const double Padding20 = 20.0;
  static const double Padding5 = 5.0;
  static const double Padding2 = 2.0;
  static const double Padding10 = 10.0;
}
