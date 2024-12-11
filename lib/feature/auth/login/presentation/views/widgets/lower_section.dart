import 'package:atw/feature/auth/login/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class LowerSection extends StatelessWidget {
  const LowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomElevatedButton(),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Opacity(
              opacity: 0.6,
              child: TextWidget(
                text: "Don't have an account?",
                size: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: (){},
              child: const TextWidget(
                text: "Register",
                size: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
