import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

// Telefon numarası gönderimi durumları
abstract class PhoneState {}

class PhoneInitial extends PhoneState {}

class PhoneSending extends PhoneState {}

class PhoneSentSuccess extends PhoneState {}

class PhoneSentFailure extends PhoneState {
  final String error;

  PhoneSentFailure(this.error);
}

// Telefon numarası gönderimi için Cubit
class PhoneCubit extends Cubit<PhoneState> {
  final Dio _dio = Dio();

  PhoneCubit() : super(PhoneInitial());

  // Telefon numarasını API'ye gönder
  Future<void> sendPhoneNumber(String phoneNumber) async {
    emit(PhoneSending());
    try {
      final response = await _dio.get('http://192.168.30.238:3000/api/v1/auth/sendOtp', queryParameters: {
        'phoneNumber': "993$phoneNumber",
      });

      if (response.statusCode == 200) {
        emit(PhoneSentSuccess());
      } else {
        emit(PhoneSentFailure('API çağrısı başarısız oldu.'));
      }
    } catch (e) {
      emit(PhoneSentFailure('Bir hata oluştu: $e'));
    }
  }
}
