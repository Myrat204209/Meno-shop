import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

/// A base failure for the cart repository failures
abstract class BannerFailure with EquatableMixin implements Exception {
  const BannerFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object> get props => [error];
}

class GetBannerListFailure extends BannerFailure {
  const GetBannerListFailure(super.error);
}

class BannerRepository {
  const BannerRepository({
    required BannerClient bannerClient,
  }) : _bannerClient = bannerClient;

  final BannerClient _bannerClient;

  Future<List<BannerItem>?> getBanners() async {
    try {
      return await _bannerClient.getBanners();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetBannerListFailure(error), stackTrace);
    }
  }
}
