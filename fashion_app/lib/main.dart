
import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/src/categories/controller/category_notifier.dart';
import 'package:fashion_app/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:fashion_app/src/home/controller/home_tab_notifier.dart';
import 'package:fashion_app/src/onboarding/controller/onboarding_notifier.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_controller.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:fashion_app/src/splashscreen/views/spalshscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  // initialize storage 
  await GetStorage.init();
  // Load the correct environment in flutter
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
      ChangeNotifierProvider(create: (_) => CategoryNotifier()),
      ChangeNotifierProvider(create: (_) => HomeTabNotifier()),
      ChangeNotifierProvider(create: (_) => ProductNotifier()),
      ChangeNotifierProvider(create: (_) => ColorsSizesController()),
    ],
    child: const MyApp(),
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: router,
        );
      },
      child: const SplashScreen(),
    );
  }
}



