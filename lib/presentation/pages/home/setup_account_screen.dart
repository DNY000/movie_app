import 'package:flutter/material.dart';
import 'package:loadmore/presentation/pages/home/widget/bio_account_widget.dart';
import 'package:loadmore/presentation/pages/home/widget/choose_enjoy_action_widget.dart';
import 'package:loadmore/presentation/pages/home/widget/create_new_pin_widget.dart';

class SetupAccountScreen extends StatefulWidget {
  const SetupAccountScreen({super.key});

  @override
  State<SetupAccountScreen> createState() => _SetupAccountScreenState();
}

class _SetupAccountScreenState extends State<SetupAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ChooseEnjoyActionWidget(),
          CreateNewPinWidget(),
          BioAccountWidget(),
        ],
      ),
    );
  }
}
