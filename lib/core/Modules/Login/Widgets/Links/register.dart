import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';

class register extends StatelessWidget {
  final String textoComum;
  final String textoClicavel;
  final Function() function;

  const register({
    Key? key,
    required this.textoComum,
    required this.textoClicavel,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            isPortrait == true ? _size.width * 0.22 : _size.width * 0.35,
      ),
      child: Container(
        height: isPortrait == true ? _size.height * 1 : _size.height * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textoComum,
                style: TextStyle(
                  color: AppCores.nero,
                )),
            Container(
              padding: EdgeInsets.only(
                  bottom: isPortrait == true
                      ? _size.height * 0.08
                      : _size.height * 0.115),
              child: TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, minimumSize: Size(35, 15)),
                  onPressed: function,
                  child: Text(
                    textoClicavel,
                    style: TextStyle(
                        color: AppCores.nero,
                        fontWeight: FontWeight.bold,
                        decorationColor: AppCores.nero),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
