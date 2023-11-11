import 'package:flutter/material.dart';

class FormValidationScreen extends StatefulWidget {
  const FormValidationScreen({super.key});

  @override
  State<FormValidationScreen> createState() => _FormValidationScreenState();
}

class _FormValidationScreenState extends State<FormValidationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String password = '';

  String meritalStatus = 'Single';
  bool isChecked = true;

  List<String> locations = ['A', 'V', 'C', 'D'];
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Form Validation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    labelText: 'Enter Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      name = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Age',
                    labelText: 'Enter Age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter age';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      age = int.parse(value!);
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Enter Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Password';
                    } else if (value.length < 8) {
                      return 'Password should be more than 8 characters';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButton(
                  hint: Text('Please choose the city you live in '),
                  value: selectedLocation,
                  items: locations.map((location) {
                    return DropdownMenuItem(
                      child: Text(location),
                      value: location,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue;
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Single'),
                        value: 'Single',
                        groupValue: meritalStatus,
                        onChanged: (String? value) {
                          setState(() {
                            meritalStatus = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Married'),
                        value: 'Married',
                        groupValue: meritalStatus,
                        onChanged: (String? value) {
                          setState(() {
                            meritalStatus = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                CheckboxListTile(
                  value: isChecked,
                  title:
                      Text('Sign up for the news paper and related articles'),
                  onChanged: (value) {
                    isChecked = value!;
                  },

                  ///make che check list to leading first then text
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('name ${name}');
                      print('Age ${age}');
                      print('Password ${password}');
                      print('City ${selectedLocation}');
                      print('Merital Status ${meritalStatus}');
                      print('isChecked ${isChecked}');
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
