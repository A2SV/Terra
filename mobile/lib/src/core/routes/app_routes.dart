import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/src/core/error/error_pages/404_page.dart';
import 'package:mobile/src/core/error/error_pages/no_network_page.dart';
import 'package:mobile/src/core/error/error_pages/server_error_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/forgot_password.dart';
import 'package:mobile/src/features/auth/presentation/pages/forgot_password_send_mail.dart';
import 'package:mobile/src/features/auth/presentation/pages/identify_student.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_contact_info.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_photos.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/list_detail.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/listings_filters.dart';
import 'package:mobile/src/features/onboarding/presentation/pages/onboarding_screen.dart';

final routes = <GoRoute>[
  GoRoute(
    name: AppRoutes.signup,
    path: '/${AppRoutes.signup}',
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    name: AppRoutes.signin,
    path: '/${AppRoutes.signin}',
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    name: AppRoutes.passwordReset,
    path: '/${AppRoutes.passwordReset}',
    builder: (context, state) => const PasswordResetScreen(),
  ),
  GoRoute(
    name: AppRoutes.forgotPassword,
    path: '/${AppRoutes.forgotPassword}',
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    name: AppRoutes.forgotPasswordEmailSent,
    path: '/${AppRoutes.forgotPasswordEmailSent}/:email',
    builder: (context, state) {
      final email = state.pathParameters['email'];
      return ForgotPasswordSendMail(email: email!);
    },
  ),
  GoRoute(
    name: AppRoutes.dashboard,
    path: '/${AppRoutes.dashboard}',
    builder: (context, state) => const DashboardPage(),
  ),
  GoRoute(
    name: AppRoutes.listingDetail,
    path: '/${AppRoutes.listingDetail}',
    builder: (context, state) => const ListingDetail(),
  ),
  GoRoute(
    name: AppRoutes.identifyStudentIdentity,
    path: '/${AppRoutes.identifyStudentIdentity}',
    builder: (context, state) => const IdentifyStudent(),
  ),
  GoRoute(
    name: AppRoutes.addListing,
    path: '/${AppRoutes.addListing}',
    builder: (context, state) => const AddListingPage(),
  ),
  GoRoute(
    name: AppRoutes.addListingMedia,
    path: '/${AppRoutes.addListingMedia}',
    builder: (context, state) => const AddListingMediaPage(),
  ),
  GoRoute(
    name: AppRoutes.addListingContact,
    path: '/${AppRoutes.addListingContact}',
    builder: (context, state) => const AddListingContactPage(),
  ),
  GoRoute(
    name: AppRoutes.listingFilters,
    path: '/${AppRoutes.addListingMedia}',
    builder: (context, state) => const ListingsFilters(),
  ),
  GoRoute(
    name: AppRoutes.onboarding,
    path: '/${AppRoutes.onboarding}',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    name: AppRoutes.serverError,
    path: '/${AppRoutes.serverError}',
    builder: (context, state) => const ServerErrorPage(),
  ),
  GoRoute(
    name: AppRoutes.noNetwork,
    path: '/${AppRoutes.noNetwork}',
    builder: (context, state) => const NetworkErrorPage(),
  ),
  GoRoute(
    name: AppRoutes.notFound,
    path: '/${AppRoutes.notFound}',
    builder: (context, state) => const Page404(),
  ),

  // GoRoute(
  //   name: AppRoutes.editblogScreen,
  //   path: '/${EditBlogScreen.routeName}',
  //   builder: (context, state) {
  //     Blog blog = state.extra as Blog;
  //     return EditBlogScreen(
  //       blog: blog,
  //     );
  //   },
  // ),
  // GoRoute(
  //   name: AppRoutes.blogDetails,
  //   path: '/${BlogDetails.routeName}/:id',
  //   builder: (context, state) {
  //     final id = state.pathParameters['id']!;
  //     return BlogDetails(id: int.parse(id));
  //   },
  // ),
];

//* Custom transition page
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

//* Default page builder
Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
        Widget child) =>
    (BuildContext context, GoRouterState state) {
      return buildPageWithDefaultTransition<T>(
        context: context,
        state: state,
        child: child,
      );
    };

class AppRoutes {
  // static const String otp = 'otp';
  static const String home = '';
  static const String signup = 'signup';
  static const String onboarding = 'onboarding';
  static const String signin = 'signin';
  static const String notFound = 'notFound';
  static const String serverError = 'serverError';
  static const String noNetwork = 'noNetwork';
  static const String passwordReset = 'password-reset';
  static const String forgotPassword = 'forgot-password';
  static const String forgotPasswordEmailSent = 'forgot-password-email-sent';
  static const String dashboard = 'dashboard';
  static const String listingDetail = 'listing-detail';
  static const String listingFilters = 'listing-filters';
  static const String identifyStudentIdentity = "identify-student-identity";
  static const String addListingMedia = "add-listing-media";
  static const String addListingContact = "add-listing-contact";
  static const addListing = 'add_listing';
}
