import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/middelware/mymiddelware.dart';
import 'package:ecommerce_app/test.dart';
import 'package:ecommerce_app/view/address/add.dart';
import 'package:ecommerce_app/view/address/adddetails.dart';
import 'package:ecommerce_app/view/address/view.dart';
import 'package:ecommerce_app/view/orders/archive.dart';
import 'package:ecommerce_app/view/orders/details.dart';
import 'package:ecommerce_app/view/orders/orderstracking.dart';
import 'package:ecommerce_app/view/orders/pending.dart';
import 'package:ecommerce_app/view/orders/rejected.dart';
import 'package:ecommerce_app/view/screeen/auth/signup.dart';
import 'package:ecommerce_app/view/screeen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screeen/auth/verfiycode_siginup.dart';
import 'package:ecommerce_app/view/screeen/cart.dart';
import 'package:ecommerce_app/view/screeen/chat.dart';
import 'package:ecommerce_app/view/screeen/checkout.dart';
import 'package:ecommerce_app/view/screeen/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_app/view/screeen/forgetpassword/resetpassword.dart';
import 'package:ecommerce_app/view/screeen/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_app/view/screeen/forgetpassword/verfiycode.dart';
import 'package:ecommerce_app/view/screeen/home2.dart';
import 'package:ecommerce_app/view/screeen/homescreen.dart';
import 'package:ecommerce_app/view/screeen/items.dart';
import 'package:ecommerce_app/view/screeen/language.dart';
import 'package:ecommerce_app/view/screeen/medicalinfopage.dart';
import 'package:ecommerce_app/view/screeen/myfavorite.dart';
import 'package:ecommerce_app/view/screeen/offers.dart';
import 'package:ecommerce_app/view/screeen/onboarding.dart';
import 'package:ecommerce_app/view/screeen/productdetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../view/screeen/auth/login.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes=[
 GetPage(name:"/", page: ()=>const Language(),middlewares: [MyMiddelWare()]),
  //GetPage(name: "/", page:()=> const  Test()),//middlewares: [MyMiddelWare()]
  //Auth
  GetPage(name:AppRoute.login, page: ()=>const Login()),
GetPage(name:AppRoute.cart, page: ()=>const Cart()),
  GetPage(name:AppRoute.signUp, page: ()=>const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword()),
  GetPage(name:AppRoute.resetPassword, page: ()=>const ResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: ()=>const VerfiyCode()),
  GetPage(name:  AppRoute.successResetPassword, page: ()=>const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp , page: ()=>const SuccessSignup() ),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: ()=> const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.onBoarding, page: ()=>const OnBoarding() ),
//Home
  GetPage(name: AppRoute.homepage, page: ()=>const HomeScreen()),
  GetPage(name: AppRoute.items, page: ()=>const Items()),
  GetPage(name: AppRoute.productdetails, page: ()=> const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: ()=> const MyFavorite()),
//Hom2
  GetPage(name: AppRoute.home2, page: ()=> const Home2()),

//Address

  GetPage(name: AppRoute.addressview, page: ()=> const AddressView()),
  GetPage(name: AppRoute.addressadd, page: ()=> const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: ()=> const AddressAddDetails()),


//Checkout + Orders

  GetPage(name: AppRoute.checkout, page: ()=> const Checkout()),
  GetPage(name: AppRoute.orederspending, page: ()=> const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: ()=> const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: ()=> const OrdersArchiveView()),
  GetPage(name: AppRoute.tracking, page: ()=> const OrdersTracking()),
  GetPage(name: AppRoute.rejectedorders, page: ()=> const OrdersRejectedView()),


 //Medical info
  GetPage(name: AppRoute.mdicinfo, page: ()=> const MedicalInfoScreen()),

  //offers
  //GetPage(name: AppRoute.offers, page: ()=> const OffersView()),


];

// Map<String, Widget Function(BuildContext)> routes={
//   //Auth
//   AppRoute.login:(context)=> const Login(),
//   AppRoute.signUp:(context)=> const SignUp(),
//   AppRoute.forgetPassword:(context)=> const ForgetPassword(),
//   AppRoute.resetPassword:(context)=> const ResetPassword(),
//   AppRoute.verfiyCode:(context)=> const VerfiyCode(),
//   AppRoute.successResetPassword:(context)=> const SuccessResetPassword(),
//   AppRoute.successSignUp:(context)=> const SuccessSignup(),
//   AppRoute.verfiyCodeSignUp:(context)=> const VerfiyCodeSignUp(),
//
//   //OnBoarding
//   AppRoute.onBoarding:(context)=> const OnBoarding(),
//
// };
