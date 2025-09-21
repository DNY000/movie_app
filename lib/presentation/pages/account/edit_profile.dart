import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/core/common/gradient_button.dart';
import 'package:loadmore/core/common/textField/custom_text_field.dart';
import 'package:loadmore/core/config/colors.dart';
import 'package:loadmore/presentation/pages/account/widgets/avatar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameConntroller = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // luôn đồng bộ với list items
  final List<String> genders = ['Male', 'Female', 'Other'];
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = genders.first; // gán mặc định "Male"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
        decoration: const BoxDecoration(gradient: kGradientApp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AvatarWidget(
                        onPress: () {},
                        avatarUrl: 'assets/images/Welcome.png',
                      ),
                    ),
                    const SizedBox(height: 32),

                    Text(
                      'FULL NAME',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _nameConntroller,
                      hintText: 'full name',
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'EMAIL',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PHONE',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                controller: _phoneController,
                                hintText: '+84',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'GENDER',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomDropdown(
                                items: genders,
                                value: selectedGender,
                                onChanged: (val) {
                                  setState(() {
                                    selectedGender = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: GradientButton(
                width: double.infinity,
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: kDarkTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kGreyColor.withOpacity(0.2), // giữ nền giống TextField
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: items.contains(value) ? value : null,
          isExpanded: true,
          hint: const Text(
            "Select an option",
            style: TextStyle(color: Colors.white54),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kGreyDartColor,
            ),
            maxHeight: 250,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          items:
              items
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
