import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';
import 'package:social_share/social_share.dart';
import 'package:tnp/Global/cores.dart';
import 'package:tnp/Global/pt.dart';
import 'package:social_share_plugin/social_share_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class IndicateCard extends StatefulWidget {
  const IndicateCard({Key? key}) : super(key: key);

  @override
  _IndicateCardState createState() => _IndicateCardState();
}

class _IndicateCardState extends State<IndicateCard> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: Container(
        height: _size.height * 0.7,
        width: 275.sp,
        padding: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
            color: AppCores.pureWhite, borderRadius: BorderRadius.circular(10)),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.sp, top: 15.sp),
              child: Text(
                PurchaseTexts.indicateFriends,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  inherit: false,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: isPortrait == true
                      ? _size.height * 0.046
                      : _size.height * 0.1,
                  width: 180.sp,
                  padding: EdgeInsets.all(3.sp),
                  decoration: BoxDecoration(
                    color: AppCores.gray95,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      PurchaseTexts.link,
                      maxLines: 1,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppCores.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 10.sp),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.sp,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(AppCores.gray90),
                      maximumSize:
                          MaterialStateProperty.all<Size>(Size(65.sp, 23.sp)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(65.sp, 23.sp)),
                    ),
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      String user = prefs.getInt("user_id").toString();
                      SocialShare.copyToClipboard(
                          'Parabéns, você recebeu uma indicação para conhecer a TNP. Faça parte da melhor comunidade que conecta pessoas, gera negócios e ajuda pessoas no país. - https://www.todosnospodemos.com.br/socios/public/cadastro/$user');
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Sucesso"),
                              content: Text("Link copiado com sucesso"),
                              actions: [
                                ElevatedButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    child: Center(
                      child: Text(
                        PurchaseTexts.copyLink,
                        style:
                            TextStyle(color: AppCores.black, fontSize: 10.sp),
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  child: Image(
                    image: AssetImage(
                      'assets/whatsapp.png',
                    ),
                    width: 22,
                  ),
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();
                    String user = prefs.getInt("user_id").toString();
                    await launch(
                        'https://api.whatsapp.com/send?text=Parabéns, você recebeu uma indicação para conhecer a TNP. Faça parte da melhor comunidade que conecta pessoas, gera negócios e ajuda pessoas no país. - https://www.todosnospodemos.com.br/socios/public/cadastro/$user');
                  },
                ),
                SizedBox(
                  width: _size.width * 0.03,
                ),
                GestureDetector(
                  child: Image(
                    image: AssetImage(
                      'assets/facebook.png',
                    ),
                    width: 22,
                  ),
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();
                    String user = prefs.getInt("user_id").toString();

                    String url =
                        'https://www.todosnospodemos.com.br/socios/public/cadastro/$user';
                    final quote =
                        'Parabéns, você recebeu uma indicação para conhecer a TNP. Faça parte da melhor comunidade que conecta pessoas, gera negócios e ajuda pessoas no país. - ';
                    final result =
                        await SocialSharePlugin.shareToFeedFacebookLink(
                      quote: quote,
                      url: url,
                      onSuccess: (_) {
                        print('FACEBOOK SUCCESS');
                        return;
                      },
                      onCancel: () {
                        print('FACEBOOK CANCELLED');
                        return;
                      },
                      onError: (error) {
                        print('FACEBOOK ERROR $error');
                        return;
                      },
                    );
                  },
                ),
                IconButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    String user = prefs.getInt("user_id").toString();
                    String url =
                        'Parabéns, você recebeu uma indicação para conhecer a TNP. Faça parte da melhor comunidade que conecta pessoas, gera negócios e ajuda pessoas no país. - https://www.todosnospodemos.com.br/socios/public/cadastro/$user';

                    final result =
                        await SocialSharePlugin.shareToFeedFacebookLink(
                      url: url,
                      onSuccess: (_) {
                        print('FACEBOOK SUCCESS');
                        return;
                      },
                      onCancel: () {
                        print('FACEBOOK CANCELLED');
                        return;
                      },
                      onError: (error) {
                        print('FACEBOOK ERROR $error');
                        return;
                      },
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.facebookMessenger,
                    size: 18.sp,
                    color: Colors.green[600],
                  ),
                  splashRadius: 1,
                ),
                GestureDetector(
                  child: Image(
                    image: AssetImage('assets/twitter.png'),
                    width: 25,
                  ),
                  onTap: () async {
                    var prefs = await SharedPreferences.getInstance();
                    String user = prefs.getInt("user_id").toString();
                    String url =
                        'Parabéns, você recebeu uma indicação para conhecer a TNP. Faça parte da melhor comunidade que conecta pessoas, gera negócios e ajuda pessoas no país. - https://www.todosnospodemos.com.br/socios/public/cadastro/$user';

                    final result = await SocialSharePlugin.shareToTwitterLink(
                      url: url,
                      onSuccess: (_) {
                        print('FACEBOOK SUCCESS');
                        return;
                      },
                      onCancel: () {
                        print('FACEBOOK CANCELLED');
                        return;
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
