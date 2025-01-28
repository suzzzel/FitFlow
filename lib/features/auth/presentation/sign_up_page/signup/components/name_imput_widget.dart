import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameSignUpImputWidget extends StatelessWidget {
  const NameSignUpImputWidget({
    super.key,
    required this.nameController,
    required this.nameInput,
  });

  final TextEditingController nameController;
  final StateController<String> nameInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 46, right: 47, bottom: 8),
      child: CustomTextField(
        controller: nameController,
        obscureText: false,
        onChanged: (value) {
          nameInput.state = value;
          return value;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        labelText: 'Имя пользователя',
      ),
    );
  }
}
