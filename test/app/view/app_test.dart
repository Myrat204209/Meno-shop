// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('App', () {
//     test('should handle authentication errors during repository operations', () async {
//       // Arrange
//       final mockCategoryRepository = MockCategoryRepository();
//       final mockSubcategoryRepository = MockSubcategoryRepository();
//       final mockProductRepository = MockProductRepository();
//       final mockBannerRepository = MockBannerRepository();
//       final mockAddressRepository = MockAddressRepository();
//       final mockCartRepository = MockCartRepository();
//       // Mock authentication error
//       when(mockCategoryRepository.fetchCategories())
//           .thenThrow(AuthenticationException('Authentication failed'));

//       // Act
//       final app = App(
//         exceptionStream: StreamController<Exception>.broadcast(),
//         categoryRepository: mockCategoryRepository,
//         subcategoryRepository: mockSubcategoryRepository,
//         productRepository: mockProductRepository,
//         bannerRepository: mockBannerRepository,
//         addressRepository: mockAddressRepository,
//         cartRepository: mockCartRepository,
//       );

//       // Assert
//       expect(
//         () => app.build(MockBuildContext()),
//         throwsA(isA<AuthenticationException>()),
//       );
//     });
//   });
// }

// class MockBuildContext extends BuildContext {}

// class AuthenticationException implements Exception {
//   const AuthenticationException(this.message);

//   final String message;
// }

// class MockCategoryRepository extends Mock implements CategoryRepository {}

// class MockSubcategoryRepository extends Mock implements SubcategoryRepository {}

// class MockProductRepository extends Mock implements ProductRepository {}

// class MockBannerRepository extends Mock implements BannerRepository {}

// class MockAddressRepository extends Mock implements AddressRepository {}

// class MockCartRepository extends Mock implements CartRepository {}