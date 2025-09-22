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

  final List<String> genders = ['Male', 'Female', 'Other'];
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = genders.first;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precache image ở đây (không được gọi trong initState vì lỗi MediaQuery)
    precacheImage(const AssetImage('assets/images/Welcome.png'), context);
  }

  @override
  void dispose() {
    _nameConntroller.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: kGradientApp),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                24,
                24,
                24,
                24 +
                    MediaQuery.of(
                      context,
                    ).viewInsets.bottom, // đẩy UI lên khi bàn phím mở
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
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

                    /// Full name
                    _buildLabel("FULL NAME"),
                    CustomTextField(
                      controller: _nameConntroller,
                      hintText: 'full name',
                    ),
                    const SizedBox(height: 20),

                    /// Email
                    _buildLabel("EMAIL"),
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'example@gmail.com',
                    ),
                    const SizedBox(height: 20),

                    /// Phone + Gender
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel("PHONE"),
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
                              _buildLabel("GENDER"),
                              Container(
                                height: 56,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kGreyColor.withOpacity(0.2),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    value:
                                        genders.contains(selectedGender)
                                            ? selectedGender
                                            : null,
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
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    items:
                                        genders
                                            .map(
                                              (e) => DropdownMenuItem<String>(
                                                value: e,
                                                child: Text(e),
                                              ),
                                            )
                                            .toList(),
                                    onChanged: (val) {
                                      setState(() => selectedGender = val);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// Save button
                    GradientButton(
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
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          color: kGreyColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
