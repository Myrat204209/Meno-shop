import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:dio/dio.dart';

class OtpPinInputForm extends StatefulWidget {
  final String phoneNumber;

  const OtpPinInputForm({super.key, required this.phoneNumber});

  @override
  _OtpPinInputFormState createState() => _OtpPinInputFormState();
}

class _OtpPinInputFormState extends State<OtpPinInputForm> {
  final Dio _dio = Dio();
  bool _isLoading = false;

  Future<void> _sendOtpToApi(String pin) async {
    setState(() {
      _isLoading = true;
    });

    // URL'yi telefon numarası ve OTP kodu ile oluşturuyoruz
    final phoneNumberWithPrefix = '993${widget.phoneNumber}';
    const url =
        'http://192.168.30.238:3000/api/v1/auth/checkOtp';

    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'phoneNumber': phoneNumberWithPrefix,
          'otpCode': pin
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      
      if (response.statusCode == 200 && response.data['response']) {
        // Doğru pin girildiğinde yapılacak işlemler
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Doğrulama başarılı!')),
        );
        // Başarılıysa, örneğin ana sayfaya yönlendirebilirsiniz
      } else {
        // Yanlış pin girildiğinde yapılacak işlemler
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Doğrulama başarısız: ${response.data['error'] ?? 'Bilinmeyen hata'}')),
        );
      }
    } on DioException catch (e) {
      // Hata durumu yönetimi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bir hata oluştu: ${e.message}')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Pinput(
            length: 5,
            onChanged: (pin) {
              // Pin değiştiğinde yapılacak işlemler burada olabilir
            },
            onCompleted: (pin) {
              _sendOtpToApi(pin);  // OTP kodunu API'ye gönder
            },
          ),
          if (_isLoading) const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
