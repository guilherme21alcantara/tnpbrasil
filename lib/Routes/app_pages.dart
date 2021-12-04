import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tnp/Routes/app_routes.dart';
import 'package:tnp/core/Modules/Category/Screen/category.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Screen/register_four_digits_password.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Screen/register_four_sing.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Screen/register_pix.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/fou_digits_pass_pix.dart';
import 'package:tnp/core/Modules/FourDigitsPassword/Widgets/four_digits_singup.dart';
import 'package:tnp/core/Modules/Home/screen.dart';
import 'package:tnp/core/Modules/Login/Screen/login_screen.dart';
import 'package:tnp/core/Modules/PIX/Screen/pix.dart';
import 'package:tnp/core/Modules/Recovery/Screen/recovery_screen.dart';
import 'package:tnp/core/Modules/SignUp/Screen/signup.dart';
import 'package:tnp/core/Modules/Splash/splash.dart';
import 'package:tnp/core/Modules/Transactions/Screen/card_register.dart';
import 'package:tnp/core/Modules/Transactions/Screen/confirm_pix.dart';
import 'package:tnp/core/Modules/Transactions/Screen/confirm_transaction_com_recorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/confirm_transaction_sem_recorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/insertcard_comrecorrencia.dart';
import 'package:tnp/core/Modules/Transactions/Screen/select_payment_method.dart';
import 'package:tnp/core/Modules/Transactions/Screen/successful_transaction.dart';
import 'package:tnp/core/Modules/Transactions/Screen/successful_transaction_tnp.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.initial, page: () => Splash()),
    GetPage(name: Routes.login, page: () => Login()),
    GetPage(name: Routes.recovery, page: () => Recovery()),
    GetPage(name: Routes.home, page: () => Home()),
    GetPage(name: Routes.category, page: () => Category()),
    GetPage(name: Routes.signup, page: () => SignUpScreen()),
    GetPage(name: Routes.transactions, page: () => SelectPaymentMethodScreen()),
    GetPage(
        name: Routes.insertValue, page: () => InsertTransactionValueScreen()),
    GetPage(
        name: Routes.successfulTransaction,
        page: () => SuccessfulTransactionsScreen()),
    GetPage(name: Routes.successfulTransactionTnp, page: () =>SuccessfulTransactionsScreenTnp()),
    GetPage(
        name: Routes.selectPaymentMethodScreen,
        page: () => SelectPaymentMethodScreen()),
    GetPage(name: Routes.registerCard, page: () => CardRegisterScreen()),
    GetPage(
        name: Routes.registerFourDigitsPassword,
        page: () => RegisterFourDigitsPasswordScreen()),
    GetPage(name: Routes.pix, page: () => PIXScreen()),
    GetPage(
        name: Routes.confirmTransactionData,
        page: () => ConfirmTransactionDataScreen()),
    GetPage(
        name: Routes.confirmTransactionDataPix,
        page: () => ConfirmTransactionDataPixScreen()),
    GetPage(name: Routes.registerFourDigitsPasPix, page: () => RegisterFourDigitsPasswordScreenPix()),
    GetPage(name: Routes.confirmTransactionDataSemRecorrencia, page: ()=>ConfirmTransactionDataScreenSemRecorrencia()), 
    GetPage(name: Routes.registerFourPasSing, page: () => RegisterFourDigitsPasswordScreenSing())
  ];
}
