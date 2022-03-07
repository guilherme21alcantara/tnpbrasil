import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tnp/Global/pt.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/core/Data/Api/api_login.dart';
import 'package:tnp/core/Data/Models/db_biometria.dart';
import 'package:tnp/core/Data/Models/db_salva.dart';
import 'package:tnp/core/Data/db_table.dart';
import 'package:tnp/core/Modules/Login/Controller/login_controller.dart';
import 'package:tnp/core/Modules/Login/Widgets/auth.dart';
import 'package:tnp/core/Modules/Login/Widgets/authbio.dart';
import 'package:tnp/core/Modules/Login/Widgets/loading.dart';
import 'package:tnp/core/Modules/Transactions/Controller/card.dart';

class ButtonLogin extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final CardController card = Get.put(CardController());
    final dbhelper = DatabaseHelper.instance;
    final dba = DatabaseHelperSave.instance;
    final api = ApiLogin();

    Size _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
            left: _size.width * 0.045, top: _size.height * 0.02),
        child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_) {
              return SizedBox(
                height: _size.height * 0.09,
                width: _size.width * 0.8,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppCores.green),
                  ),
                  onPressed: () async {
                    final dbHelpersave = DatabaseHelperSave.instance.database;
                    final dbsave = await dbHelpersave;
                    var ressave = await dbsave.rawQuery("SELECT * FROM save");
                    final dbHelper = DatabaseHelper.instance.database;
                    final db = await dbHelper;
                    var res = await db.rawQuery("SELECT * FROM login");
                    Map<String, dynamic> row = {
                      dbhelper.columnUser: controller.emailc.text,
                      dbhelper.columnPassword: controller.passc.text
                    };
                    final id = await dbhelper.insert(row);
                    if (card.recorrencia != null) {
                      print("alalalalalallala");
                      Map<String, dynamic> row = {
                        dba.columnUser: 'true',
                      };
                      final id = await dba.insert(row);
                    }

                    if (res.isEmpty) {
                      Map<String, dynamic> row = {
                        dbhelper.columnUser: controller.emailc.text,
                        dbhelper.columnPassword: controller.passc.text
                      };
                      final id = await dbhelper.insert(row);
                      print(controller.emailc.text);
                      //onLoading(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Biometria"),
                              content: Text("Deseja cadastrar biometria?"),
                              actions: [
                                ElevatedButton(
                                  child: Text("Não"),
                                  onPressed: () {
                                    api.postAcesso();
                                    sleep(Duration(milliseconds: 200));
                                    onLoading(context);
                                  },
                                ),
                                ElevatedButton(
                                  child: Text("Sim"),
                                  onPressed: () {
                                    Get.to(AuthAppBio());
                                  },
                                )
                              ],
                            );
                          });
                      print('linha inserida id: $id');
                    } else {
                      final dbHelperbio = DatabaseHelperBio.instance.database;
                      final dbbio = await dbHelperbio;
                      var resbio = await dbbio.rawQuery("SELECT * FROM bio");
                      if (resbio.isNotEmpty &&
                          controller.emailc.text != '' &&
                          controller.passc.text != '') {
                        if (controller.emailc.text != '' &&
                            controller.passc.text != '') {
                          controller.emailController.text =
                              controller.emailc.text;
                          controller.passwordController.text =
                              controller.passc.text;
                          sleep(Duration(milliseconds: 200));
                          onLoading(context);
                        } else {
                          onLoading(context);
                        }
                      } else {
                        if (controller.emailc.text != '' &&
                            controller.passc.text != '') {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Biometria"),
                                  content: Text("Deseja cadastrar biometria?"),
                                  actions: [
                                    ElevatedButton(
                                      child: Text("Não"),
                                      onPressed: () {
                                        if (controller.passc.text != '' &&
                                            controller.emailc.text != '') {
                                          onLoading(context);
                                        } else {
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text("Sim"),
                                      onPressed: () {
                                        if (controller.passc.text != '' &&
                                            controller.emailc.text != '') {
                                          Get.to(AuthAppBio());
                                        }
                                      },
                                    )
                                  ],
                                );
                              });
                        } else {
                          if (resbio.isEmpty &&
                              controller.emailController.text != '' &&
                              controller.passwordController.text != '') {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Biometria"),
                                    content:
                                        Text("Deseja cadastrar biometria?"),
                                    actions: [
                                      ElevatedButton(
                                        child: Text("Não"),
                                        onPressed: () {
                                          if (controller.passwordController
                                                      .text !=
                                                  '' &&
                                              controller.emailController.text !=
                                                  '') {
                                            onLoading(context);
                                          } else {
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text("Sim"),
                                        onPressed: () {
                                          if (controller.passwordController
                                                      .text !=
                                                  '' &&
                                              controller.emailController.text !=
                                                  '') {
                                            Get.to(AuthAppBio());
                                          }
                                        },
                                      )
                                    ],
                                  );
                                });
                          } else {
                            print('abacaxiiiiiii');
                            onLoading(context);
                          }
                        }

//
                      }
                    }
                  },
                  child: Text(
                    LoginTexts.enterButton,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              );
            }));
  }
}
