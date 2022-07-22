import 'package:bloc/bloc.dart';
import 'package:ehub/screens/auth/choose_city_page.dart';
import 'package:ehub/screens/auth/sms_confirmation_page.dart';
import 'package:ehub/screens/home/main_screen.dart';
import 'package:ehub/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController signUpphoneController = TextEditingController();
  final TextEditingController smsController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  List variants = [];

  void onSignUpPressed(BuildContext context) async {
    String phone = signUpphoneController.text.trim();
    emit(AuthLoading());

    await EHubRegisterService().signup(phone: phone).then((value) {
      print(value.toString());
      if (value.toString() == "Request is received") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SmsConfirmationPage()),
        );
      } else {
        print("token yoq");
      }
    });
  }

  void onSmsPressed(BuildContext context) async {
    String sms = smsController.text.trim();

    emit(AuthLoading());
    await EHubRegisterService()
        .smsConfirmation(
      sms: sms,
    )
        .then((value) async {
      emit(AuthLoaded());
      if (value['token'] != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChooseCityPage()),
        );
      } else {
        print("sms   " + value.toString());
      }
    });
    smsController.clear();
  }

  String gender = "male";

  void changeValue(String value) {
    gender = value;
    emit(AuthInitial());
  }

  void onRegisterPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String surname = surnameController.text.trim();
      String date = dateController.text.trim();

      emit(AuthLoading());

      await EHubRegisterService()
          .registerService(
        name: name,
        surname: surname,
        date: date,
        gender: gender,
        variants: variants,
      )
          .then((value) {
        print(value.toString());
        if (value != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          print("token yoq");
        }
      });
    }
  }

  List indexList = List.generate(65, (index) => true);

  void changeValueArias(int index) {
    indexList[index] = !indexList[index];
    emit(AuthInitial());
  }
}
