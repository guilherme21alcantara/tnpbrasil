import 'package:flutter/material.dart';
import 'package:tnp/Global/cores.dart';
import 'package:sizer/sizer.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Pages/access.dart';
import 'package:tnp/core/Modules/SignUp/Widgets/Wizard/Widgets/container_access.dart';
class Access extends StatefulWidget {
  const Access({ Key? key }) : super(key: key);

  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
   bool isDadosPessoal = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 15.sp),
                    child:isDadosPessoal == true
              ? Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 45,
                )
              : Icon(
                  Icons.create,
                  size: 45,
                  color: Colors.red,
                ),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    minWidth: 250,
                    height: 50,
                    child: Text(
                      '2°- passo',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () async {
                     bool flag = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Address(),
                          ));
                      if (flag) {
                        setState(() {
                          isDadosPessoal = flag;
                        });
                      } else {
                        setState(() {
                          isDadosPessoal = false;
                        });
                      }
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppCores.green, width: 2, style: BorderStyle.solid), borderRadius: BorderRadius.circular(0)),
                  ),
                ],
              );
  }
}