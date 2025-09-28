
import 'package:go_router/go_router.dart';
import 'package:qr/featuer/login/presentation/views/login_view.dart';
import 'package:qr/featuer/register/presentation/components/register_form_component.dart';

import 'package:qr/featuer/scanqr/presentation/view/scan_qr_view.dart';
import 'package:qr/featuer/splash/presentation/views/splash.dart';
 abstract class AppRouter {

  static String ksplash = '/hsplash';
  static String kLoginView = '/loginView';
  static String kRegister = '/register';
  static String kScanqr = '/scanqr';

  static final  router = GoRouter(
  routes: [
    GoRoute(
       path: '/',
      builder: (context, state) => const SplahView(), 
    ),
    GoRoute(
       path: kLoginView,
      builder: (context, state) =>  LoginHome(), 
    ),
     GoRoute(
       path: kRegister,
      builder: (context, state) =>  RegisterHome(), 
    ),
        GoRoute(
       path: kScanqr,
      builder: (context, state) =>  ScanQr(), 
    )
  ],
  );
}



