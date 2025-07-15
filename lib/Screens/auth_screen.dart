import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'quiz_screen.dart';

class AuthScreen extends StatefulWidget {
const AuthScreen({super.key});

@override
State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
bool isSignup = true;
bool _acceptTerms = false;

final _formKey = GlobalKey<FormState>();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

final GoogleSignIn _googleSignIn = GoogleSignIn();

void _submit() {
  if (_formKey.currentState!.validate()) {
    if (isSignup && !_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept Terms and Conditions")),
      );
      return;
    }
    // TODO: Implement actual signup/login logic here

    Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
  }
}

Future<void> _handleGoogleSignIn() async {
  try {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      // Proceed with user information
      Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Google Sign-In failed: $error")),
    );
  }
}

// Dummy OTP UI: just show dialog for demo purposes
void _showOtpDialog() {
  final _phoneController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Login with OTP"),
      content: TextField(
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: "Enter phone number",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Normally you send OTP here
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("OTP sent to ${_phoneController.text} (demo)")),
            );
          },
          child: const Text("Send OTP"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ],
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF3EFDB),
    body: SingleChildScrollView(
      child: Column(
        children: [
          // Top banner
          Container(
            height: 250,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            decoration: const BoxDecoration(
              color: Color(0xFF2D4336),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              isSignup ? "Let’s\nset you up," : "Welcome\nBack!",
              style: const TextStyle(fontSize: 40, color: Color(0xFFF3EFDB)),
            ),
          ),

          const SizedBox(height: 20),

          // Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField("Email", controller: _emailController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains('@')) {
                      return "Enter a valid email";
                    }
                    return null;
                  }),
                  const SizedBox(height: 10),
                  _buildTextField("Password", obscureText: true, controller: _passwordController, validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  }),
                  if (isSignup) ...[
                    const SizedBox(height: 10),
                    _buildTextField(
                      "Confirm Password",
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Terms & Conditions
                    Row(
                      children: [
                        Checkbox(
                          activeColor: const Color(0xFF697A65),
                          value: _acceptTerms,
                          onChanged: (value) {
                            setState(() {
                              _acceptTerms = value ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I accept the Terms and Conditions",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 30),

                  // Submit button
                  _buildButton("Let’s Go !", const Color(0xFF697A65), Colors.white, _submit),

                  const SizedBox(height: 10),

                  // Login / Signup switch button
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isSignup = !isSignup;
                        _acceptTerms = false;
                        _formKey.currentState?.reset();
                        _emailController.clear();
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                      });
                    },
                    child: Text(isSignup
                        ? "Already have an account? Login"
                        : "Don't have an account? Sign Up"),
                  ),

                  const SizedBox(height: 20),

                  // Divider line
                  Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or"),
                      ),
                      Expanded(child: Divider(thickness: 1)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Google Sign-In button
                  
                  ElevatedButton.icon(
                    icon: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset('assets/images/google_logo.png'),
                        ),
                        label: const Text("Sign in with Google"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: _handleGoogleSignIn,
                        ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onTap) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    ),
    child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
  );
}

Widget _buildTextField(
  String hintText, {
  bool obscureText = false,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFE8D9A7),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
}
