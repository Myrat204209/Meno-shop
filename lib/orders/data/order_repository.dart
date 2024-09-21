import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

abstract class OrderFailure with EquatableMixin implements Exception {
  const OrderFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetOrderListFailure extends OrderFailure {
  const GetOrderListFailure(super.error);
}

class CreateOrderListFailure extends OrderFailure {
  const CreateOrderListFailure(super.error);
}

class OrderRepository {
  const OrderRepository({
    required OrderClient orderClient,
  }) : _orderClient = orderClient;

  final OrderClient _orderClient;

  Future<dynamic> createOrder(OrderItem body) async {
    try {
      return await _orderClient.submitOrder(body);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(CreateOrderListFailure(error), stackTrace);
    }
  }

  Future<dynamic> getOrders() async {
    try {
      // return await _orderClient();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetOrderListFailure(error), stackTrace);
    }
  }
}
