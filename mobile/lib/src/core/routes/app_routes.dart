import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/src/features/auth/presentation/pages/forgot_password.dart';
import 'package:mobile/src/features/auth/presentation/pages/identify_student.dart';
import 'package:mobile/src/features/auth/presentation/pages/otp_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/password_reset.dart';
import 'package:mobile/src/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/add_listing_photos.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/list_detail.dart';

final routes = <GoRoute>[
  GoRoute(
    name: AppRoutes.otp,
    path: '/${AppRoutes.otp}',
    builder: (context, state) => const OTPage(),
  ),
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
    name: AppRoutes.dashboard,
    path: '/${AppRoutes.home}',
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
    name: AppRoutes.addListingMedia,
    path: '/${AppRoutes.addListingMedia}',
    builder: (context, state) => const AddListingMediaPage(),
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
  static const String otp = 'otp';
  static const String home = '';
  static const String signup = 'signup';
  static const String signin = 'signin';
  static const String passwordReset = 'password-reset';
  static const String forgotPassword = 'forgot-password';
  static const String dashboard = 'dashboard';
  static const String listingDetail = 'listing-detail';
  static const String identifyStudentIdentity = "identify-student-identity";
  static const String addListingMedia = "add-listing-media";
  static const String blogsDashboard = "blogs-dashboard";
  static const String myblogs = "my-blogs";
}
