import 'package:firebase_auth/firebase_auth.dart';
import 'package:frentalk_app/pages/login_page.dart/controllers/login_controller.dart';
import 'package:frentalk_app/pages/register_page/controllers/register_controller.dart';
import 'package:frentalk_app/routes/name_route.dart';
import 'package:frentalk_app/utils/dialog_dua.dart';
import 'package:frentalk_app/utils/dialog_satu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth authn = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => authn.authStateChanges();

  void login(String email, String password) async {
    final loginC = Get.find<LoginController>();
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential myUser = await authn.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (myUser.user!.emailVerified == true) {
          String? uId = authn.currentUser!.uid;
          final box = GetStorage();
          if (box.read('userId') != null) {
            box.erase();
            box.write('userId', uId);
          } else {
            box.write('userId', uId);
          }
          loginC.emailC.clear();
          loginC.passC.clear();
          Get.offAllNamed(RouteNames.home);
        } else {
          Get.dialog(CustomDialogDua(
              title: 'PEMBERITAHUAN',
              content:
                  'Kamu belum verifikasi email kamu, silahkan cek email kamu untuk verifikasi',
              textConfirm: 'OK',
              onConfirm: () => Get.back(),
              textCancle: 'Kirim ulang',
              onCancle: () async {
                await myUser.user!.sendEmailVerification();
              }));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.dialog(CustomDialogSatu(
            title: 'PEMBERITAHUAN',
            content: 'Akun tidak ditemukan',
            textConfirm: 'OK',
            onConfirm: () => Get.back(),
          ));
        } else if (e.code == 'wrong-password') {
          Get.dialog(CustomDialogSatu(
            title: 'PEMBERITAHUAN',
            content: 'Password yang anda masukkan salah, harap periksa kembali',
            textConfirm: 'OK',
            onConfirm: () => Get.back(),
          ));
        }
      }
    } else {
      Get.dialog(CustomDialogSatu(
        title: 'PEMBERITAHUAN',
        content: 'Mohon untuk tidak mengosongkan field',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      ));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteNames.login);
  }

  void register(String email, String password, String confirmPass) async {
    final signinC = Get.find<RegisController>();
    if (email.isNotEmpty && password.isNotEmpty && confirmPass.isNotEmpty) {
      if (password == confirmPass) {
        try {
          UserCredential myUser = await authn.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          Get.dialog(CustomDialogDua(
            title: 'PEMBERITAHUAN',
            content:
                'Verifikasi akun anda, kami sudah mengirim email ke akun $email',
            textConfirm: 'OK',
            onConfirm: () async {
              print(myUser);
              await myUser.user!.sendEmailVerification();
              signinC.emailC.clear();
              signinC.passC.clear();
              signinC.confimPassC.clear();
              Get.back();
              Get.back();
            },
            textCancle: 'Batal',
            onCancle: () async {
              await myUser.user!.delete();
            },
          ));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.dialog(CustomDialogSatu(
              title: 'PEMBERITAHUAN',
              content: 'Password terlalu lemah, gunakan minimal 6 karakter',
              textConfirm: 'OK',
              onConfirm: () => Get.back(),
            ));
          } else if (e.code == 'email-already-in-use') {
            Get.dialog(CustomDialogSatu(
              title: 'PEMBERITAHUAN',
              content: 'Email sudah digunakan',
              textConfirm: 'OK',
              onConfirm: () {
                signinC.emailC.clear();
                signinC.passC.clear();
                signinC.confimPassC.clear();
                Get.back();
              },
            ));
          }
        } catch (e) {
          Get.dialog(CustomDialogSatu(
            title: 'PEMBERITAHUAN',
            content: 'Terjadi kesalahan, harap periksa kembali',
            textConfirm: 'OK',
            onConfirm: () => Get.back(),
          ));
        }
      } else {
        Get.dialog(CustomDialogSatu(
          title: 'PEMBERITAHUAN',
          content: 'Password berbeda, harap untuk periksa dengan benar',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        ));
      }
    } else {
      Get.dialog(CustomDialogSatu(
        title: 'PEMBERITAHUAN',
        content: 'Mohon untuk mengisi email dan password',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      ));
    }
  }

  void resetPass(String email) async {
    if (email.isNotEmpty && GetUtils.isEmail(email)) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.dialog(CustomDialogSatu(
          title: 'PEMBERITAHUAN',
          content: 'Kami sudah mengirim ulang verifikasi ke akun email $email',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        ));
      } catch (e) {
        Get.dialog(CustomDialogSatu(
          title: 'PEMBERITAHUAN',
          content:
              'Terjadi kesalahan, akun tidak ditemukan, periksa email anda dengan benar',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        ));
      }
    } else {
      Get.dialog(CustomDialogSatu(
        title: 'PEMBERITAHUAN',
        content: 'Email tidak valid, mohon untuk periksa dengan benar',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      ));
    }
  }
}
