import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/auth/base_auth_user_provider.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;

    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }

    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SIGNInWidget.routeName,
          path: SIGNInWidget.routePath,
          builder: (context, params) => SIGNInWidget(),
        ),
        FFRoute(
          name: DetalleCoctelWidget.routeName,
          path: DetalleCoctelWidget.routePath,
          builder: (context, params) => DetalleCoctelWidget(
            idReceta: params.getParam('idReceta', ParamType.int),
          ),
        ),
        FFRoute(
          name: NicknamePageWidget.routeName,
          path: NicknamePageWidget.routePath,
          builder: (context, params) => NicknamePageWidget(),
        ),
        FFRoute(
          name: PasoScreenWidget.routeName,
          path: PasoScreenWidget.routePath,
          builder: (context, params) => PasoScreenWidget(
            recetaId: params.getParam('recetaId', ParamType.int),
            pasosNumActual: params.getParam('pasosNumActual', ParamType.int),
            totalPasos: params.getParam('totalPasos', ParamType.int),
          ),
        ),
        FFRoute(
          name: SuccessPageWidget.routeName,
          path: SuccessPageWidget.routePath,
          builder: (context, params) => SuccessPageWidget(),
        ),
        FFRoute(
          name: CrearCoctelWidget.routeName,
          path: CrearCoctelWidget.routePath,
          builder: (context, params) => CrearCoctelWidget(),
        ),
        FFRoute(
          name: AnyadirIngredienteWidget.routeName,
          path: AnyadirIngredienteWidget.routePath,
          builder: (context, params) => AnyadirIngredienteWidget(
            idReceta: params.getParam('idReceta', ParamType.int),
          ),
        ),
        FFRoute(
          name: AnyadirPasosWidget.routeName,
          path: AnyadirPasosWidget.routePath,
          builder: (context, params) => AnyadirPasosWidget(
            idReceta: params.getParam('idReceta', ParamType.int),
          ),
        ),
        FFRoute(
          name: ListaDeCoctelesWidget.routeName,
          path: ListaDeCoctelesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'listaDeCocteles')
              : ListaDeCoctelesWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Home') : HomeWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: GestionRecetaPageWidget.routeName,
          path: GestionRecetaPageWidget.routePath,
          builder: (context, params) => GestionRecetaPageWidget(
            recetaiD: params.getParam('recetaiD', ParamType.int),
          ),
        ),
        FFRoute(
          name: EditarCoctelWidget.routeName,
          path: EditarCoctelWidget.routePath,
          builder: (context, params) => EditarCoctelWidget(
            idReceta: params.getParam('idReceta', ParamType.int),
          ),
        ),
        FFRoute(
          name: CategoriaWidget.routeName,
          path: CategoriaWidget.routePath,
          builder: (context, params) => CategoriaWidget(
            tipoCat: params.getParam('tipoCat', ParamType.String),
          ),
        ),
        FFRoute(
          name: EditIngredientsWidget.routeName,
          path: EditIngredientsWidget.routePath,
          builder: (context, params) => EditIngredientsWidget(
            recetaId: params.getParam('recetaId', ParamType.int),
          ),
        ),
        FFRoute(
          name: EditPasosWidget.routeName,
          path: EditPasosWidget.routePath,
          builder: (context, params) => EditPasosWidget(
            recetaId: params.getParam('recetaId', ParamType.int),
          ),
        ),
        FFRoute(
          name: CollectionPageWidget.routeName,
          path: CollectionPageWidget.routePath,
          builder: (context, params) => CollectionPageWidget(
            idCollection: params.getParam('idCollection', ParamType.int),
          ),
        ),
        FFRoute(
          name: CrearColeccionWidget.routeName,
          path: CrearColeccionWidget.routePath,
          builder: (context, params) => CrearColeccionWidget(),
        ),
        FFRoute(
          name: AnyadirRecACollWidget.routeName,
          path: AnyadirRecACollWidget.routePath,
          builder: (context, params) => AnyadirRecACollWidget(
            idCol: params.getParam('idCol', ParamType.int),
          ),
        ),
        FFRoute(
          name: ListaDeColeccionesWidget.routeName,
          path: ListaDeColeccionesWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'listaDeColecciones')
              : ListaDeColeccionesWidget(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);

  TransitionInfo get transitionInfo =>
      extraMap.containsKey(kTransitionInfoKey)
          ? extraMap[kTransitionInfoKey] as TransitionInfo
          : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));

  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;

  bool get hasFutures => state.allParams.entries.any(isAsyncParam);

  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];

    if (param is! String) {
      return param;
    }

    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);

          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);

          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;

          if (!transitionInfo.hasTransition) {
            return MaterialPage(
              key: state.pageKey,
              name: state.name,
              child: child,
            );
          }

          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: child,
            transitionDuration: transitionInfo.duration,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final curve = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              );

              return FadeTransition(
                opacity: curve,
                child: child,
              );
            },
          );
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.duration = const Duration(milliseconds: 300),
  });

  final bool hasTransition;
  final Duration duration;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
