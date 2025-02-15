import 'package:flutter/material.dart';
import 'dart:io'; // For File handling
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _alternatePhoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _rationCardNoController = TextEditingController();

  File? _rationCardImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _rationCardImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Successful")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Government Portal - Register"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Your Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                ),
                SizedBox(height: 20),

                // First Name
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter your first name" : null,
                ),
                SizedBox(height: 15),

                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter your last name" : null,
                ),
                SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) => !value!.contains("@") ? "Enter a valid email" : null,
                ),
                SizedBox(height: 15),

                // Phone Number
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.length != 10 ? "Enter a valid phone number" : null,
                ),
                SizedBox(height: 15),

                // Alternate Mobile Number
                TextFormField(
                  controller: _alternatePhoneController,
                  decoration: InputDecoration(
                    labelText: "Alternate Mobile Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 15),

                // Date of Birth
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () => _selectDate(context),
                  validator: (value) => value!.isEmpty ? "Select your date of birth" : null,
                ),
                SizedBox(height: 15),

                // Pincode
                TextFormField(
                  controller: _pincodeController,
                  decoration: InputDecoration(
                    labelText: "Pincode",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_pin),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? "Enter your pincode" : null,
                ),
                SizedBox(height: 15),

                // Longitude
                TextFormField(
                  controller: _longitudeController,
                  decoration: InputDecoration(
                    labelText: "Longitude",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.gps_fixed),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),

                // Latitude
                TextFormField(
                  controller: _latitudeController,
                  decoration: InputDecoration(
                    labelText: "Latitude",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.gps_fixed),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),

                // District
                TextFormField(
                  controller: _districtController,
                  decoration: InputDecoration(
                    labelText: "District",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter your district" : null,
                ),
                SizedBox(height: 15),

                // Country
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(
                    labelText: "Country",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.flag),
                  ),
                  validator: (value) => value!.isEmpty ? "Enter your country" : null,
                ),
                SizedBox(height: 15),

                // Ration Card Number
                TextFormField(
                  controller: _rationCardNoController,
                  decoration: InputDecoration(
                    labelText: "Ration Card Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? "Enter your ration card number" : null,
                ),
                SizedBox(height: 15),

                // Upload Ration Card
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text("Upload Ration Card"),
                    ),
                    SizedBox(width: 10),
                    _rationCardImage != null
                        ? Text("Image Selected", style: TextStyle(color: Colors.green))
                        : Text("No image selected"),
                  ],
                ),
                SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text("Register",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
