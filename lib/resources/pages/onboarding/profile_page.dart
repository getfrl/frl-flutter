import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../widgets/inputs/custom_text_field_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '/resources/pages/onboarding/allow_notifications_page.dart';

class ProfilePage extends NyStatefulWidget {
  static const path = '/profile';

  ProfilePage() : super(path, child: _ProfilePageState());
}

class _ProfilePageState extends NyState<ProfilePage> {
  final _usernameController = TextEditingController();
  final _dobController = TextEditingController();
  final _countryController = TextEditingController();
  XFile? _profileImage;

  @override
  init() async {}

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complete your profile")),
      body: SafeArea(
        child: SingleChildScrollView(
          // Changed to SingleChildScrollView to allow the page to be scrollable when keyboard shows
          child: Column(
            children: [
              SizedBox(height: 32),
              Padding(
                // Wrapped Column in Padding instead of Expanded
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final ImagePicker _picker = ImagePicker();
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _profileImage = image;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 48,
                            backgroundImage: _profileImage != null
                                ? FileImage(File(_profileImage!.path))
                                : null,
                            child: _profileImage == null
                                ? Icon(Icons.person, size: 48)
                                : null,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),
                    CustomTextField(
                      label: 'Username',
                      placeholder: 'username',
                      controller: _usernameController,
                      helptext:
                          'Spaces and special characters are not allowed.',
                      leadingIcon: Icons.alternate_email,
                      isRequired: true,
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Gender",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14.0,
                            ), // Ensure the text color matches your theme
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: List<Widget>.generate(
                        3,
                        (int index) {
                          return ChoiceChip(
                            label: Text(index == 0
                                ? 'Male'
                                : index == 1
                                    ? 'Female'
                                    : 'Non-Binary'),
                            selected: false,
                            onSelected: (bool selected) {
                              // Handle chip selection
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Date of Birth (Age)',
                      placeholder: 'Select your date of birth',
                      helptext: 'You must be 13 years or older',
                      controller: _dobController,
                      leadingIcon: Icons.cake,
                      readOnly: true,
                      isRequired: true,
                      onTap: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context)
                                      .copyWith()
                                      .size
                                      .height /
                                  3,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: CupertinoDatePicker(
                                dateOrder: DatePickerDateOrder.dmy,
                                initialDateTime: _dobController.text.isNotEmpty
                                    ? DateFormat('dd-MM-yyyy')
                                        .parse(_dobController.text)
                                    : DateTime.now()
                                        .subtract(Duration(days: 365 * 18)),
                                minimumYear: 1924,
                                maximumYear: DateTime.now().year,
                                onDateTimeChanged: (DateTime newDate) {
                                  _dobController.text =
                                      DateFormat('dd-MM-yyyy').format(newDate);
                                },
                                mode: CupertinoDatePickerMode.date,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      label: 'Country',
                      placeholder: 'Select your country',
                      readOnly: true,
                      controller: _countryController,
                      isRequired: true,
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          useSafeArea: true,
                          searchAutofocus: true,
                          // favorite: ['DE', 'NL', 'GB', 'FR', 'US'],
                          countryListTheme: CountryListThemeData(
                            bottomSheetHeight: 800,
                            flagSize: 24,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            textStyle: TextStyle(fontSize: 16),
                            inputDecoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0), // Decreased vertical padding
                              hintText: 'Start typing to search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      const Color(0xFF8C98A8).withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                          showPhoneCode:
                              false, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            _countryController.text = country.name;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    routeTo(AllowNotificationsPage.path,
                        navigationType: NavigationType.pushReplace);
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 12), // Increased height
                  ),
                  child: Text('Next',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
