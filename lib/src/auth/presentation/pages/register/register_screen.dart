import 'dart:io';

import 'package:app/core/widgets/drop_down/drop_down.dart';
import 'package:app/core/widgets/text-field/mobile_text_field.dart';

import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../../core/widgets/text-field/date_text_field.dart';
import '../../../../../core/widgets/text-field/email_text_field.dart';
import '../../../../../core/widgets/text-field/file_picker_field.dart';
import '../../../../../core/widgets/text-field/password_text_field.dart';
import '../../../../../core/widgets/texts/hint_texts.dart';
import '../../../../../core/widgets/texts/primary_texts.dart';
import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../widgets/signature_pad.dart';

class RegisterScreen extends BaseStatelessWidget {
  final List<DropDownItem> countries;
  final List<DropDownItem> currencies;
  final Function(RegisterParams)? onRegister;

  RegisterScreen({Key? key, required this.countries, required this.currencies, this.onRegister}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String gender = '';
  String nationality = '';
  TextEditingController addressController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  String currency = '';
  TextEditingController passportNumberController = TextEditingController();
  File? passportFile;
  String? signatureBase64;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: basePadding,
      child: Form(
        key: formKey,
        child: Container(
          padding: basePadding,
          decoration: Decorations.shapeDecorationShadow(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              25.ph,
              CustomTextField(
                title: 'Full Name',
                controller: nameController,
              ),
              CustomTextField(
                title: 'Full Name AR',
                controller: nameArController,
              ),
              EmailTextField(
                controller: emailController,
              ),
              MobileTextField(
                controller: phoneController,
              ),
              PasswordTextField(
                controller: passwordController,
              ),
              PasswordTextField(
                title: 'Confirm Password',
                controller: confirmPasswordController,
              ),
              DateTextField(
                title: 'Date of Birth',
                controller: dateController,
              ),
              DropDownField(
                title: 'Gender',
                items: const [
                  DropDownItem(
                    id: '1',
                    title: 'Male',
                  ),
                  DropDownItem(
                    id: '2',
                    title: 'Female',
                  ),
                ],
                onChanged: (item){
                  gender = item.id ?? '';
                },
              ),

              DropDownField(
                title: 'Nationality',
                items: countries,
                onChanged: (item){
                  nationality = item.id ?? '';
                },
              ),
              CustomTextField(
                title: 'Address',
                controller: addressController,
              ),
              CustomTextField(
                title: 'Bank Account',
                controller: bankAccountController,
              ),
              DropDownField(
                title: 'Currency',
                items: currencies,
                onChanged: (item){
                  currency = item.id ?? '';
                },
              ),
              CustomTextField(
                title: 'Passport Number',
                controller: passportNumberController,
              ),
              FilePickerField(
                title: 'Passport Copy',
                onFileSelected: (file) {
                  print(file.path);
                  passportFile = file;
                },
              ),
              SignaturePad(
                onSigned: (signature) {
                  print(signature);
                  signatureBase64 = signature;
                },
              ),
              PrimaryButton(
                title: 'Register',
                fontSize: 18,
                radius: 8,
                margin: 16.paddingHoriz + 30.paddingVert,
                borderRadius: BorderRadius.circular(8),
                onPressed: onPressed,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginPage);
                },
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HintMediumText(
                        label: 'Already have an account? ',
                        fontSize: 14,
                      ),
                      5.pw,
                      PrimaryMediumText(
                        label: strings.login,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    if (formKey.currentState!.validate()) {
      onRegister!(RegisterParams(
        fullName: nameController.text,
        fullNameAr: nameArController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
        googleRecaptchaResponse: '',
        firebaseDeviceId: '',
        idNumber: passportNumberController.text,
        address: addressController.text,
        passportFile: passportFile,
        signture: signatureBase64,
        accountCategory: '1',
        accountType: '1',
        idType: '1',
        gender: gender,
        birthDate: dateController.text,
        bankAccount: bankAccountController.text,
        passPort: passportNumberController.text,
        currency: currency,

      ));
    }
  }
}
