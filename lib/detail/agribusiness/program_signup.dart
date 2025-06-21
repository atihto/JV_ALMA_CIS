import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';
import '../config.dart';
import '../../widgets/responsive_utils.dart';

class ProgramSignupPage extends StatefulWidget {
  const ProgramSignupPage({super.key});

  @override
  State<ProgramSignupPage> createState() => _ProgramSignupPageState();
}

class _ProgramSignupPageState extends State<ProgramSignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  String _farmType = 'Crop';
  final logger = Logger();
  bool _isLoading = false;

  Future<void> _submitSignup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final response = await http.post(
          Uri.parse('${Config.apiUrl}/program-signup'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': _nameController.text,
            'email': _emailController.text,
            'location': _locationController.text,
            'farmType': _farmType,
          }),
        );
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully registered for the program!')),
          );
          logger.i('Program signup successful for ${_nameController.text}');
          Navigator.pop(context); // Close dialog
          logger.i('Returned to Community Empowerment after signup');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to register: ${response.statusCode}')),
          );
          logger.e('Failed to register: ${response.statusCode}');
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error submitting registration')),
        );
        logger.e('Error submitting registration', error: e);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < ResponsiveUtils.mobileBreakpoint;
    return GestureDetector(
      onTap: () {
        debugPrint('ProgramSignupPage: Closing signup dialog');
        Navigator.pop(context);
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Register for Community Programs',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: const Color(0xFF003900),
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 18 : 22,
                              ),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _locationController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            labelText: 'Location (e.g., Nairobi)',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your location';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _farmType,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            labelText: 'Farm Type',
                            border: OutlineInputBorder(),
                          ),
                          items: ['Crop', 'Livestock', 'Mixed', 'Other']
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type, style: const TextStyle(color: Colors.black)),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _farmType = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: _submitSignup,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF003900),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 24 : 32,
                                      vertical: isMobile ? 12 : 16,
                                    ),
                                  ),
                                  child: const Text('Submit Registration'),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}