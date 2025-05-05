import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  static const String id = '/test';
  const PhoneAuthScreen({super.key});
  @override
  PhoneAuthScreenState createState() => PhoneAuthScreenState();
}

class PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  String verificationId = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Firebase Phone Auth')),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number (+2012...)'),
              ),
              ElevatedButton(
                child: Text('Send OTP'),
                onPressed: () async {
                  await _sendOTP();
                },
              ),
              TextField(
                controller: codeController,
                decoration: InputDecoration(labelText: 'Enter OTP'),
              ),
              ElevatedButton(
                child: Text('Verify OTP'),
                onPressed: () async {
                  await _verifyCode();
                },
              ),
            ],
          ),
        ),
      );

  Future<void> _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval or instant verification
        await FirebaseAuth.instance.signInWithCredential(credential);
        _showMessage('Phone number automatically verified and user signed in.');
      },
      verificationFailed: (FirebaseAuthException e) {
        _showMessage('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        _showMessage('OTP sent. Please check your phone.');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyCode() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: codeController.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _showMessage('Phone number verified and user signed in.');
    } catch (e) {
      _showMessage('Error verifying code: $e');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}