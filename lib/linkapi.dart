
class AppLink{

  //if emulator use 10.0.2.2
  // static const String server="10.0.2.2";
  static const String server="http://192.168.130.157/ecommerce";
  //==========================Image=============================//
  static const String imageStatic = "$server/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imagesubcategories = "$imageStatic/subcategories";
//==============================test====================================//
  static const String test = "$server/test.php";


  //===========================Auth=============================//

  static const String signUp = "$server/auth/signup.php";
  static const String verfiycodesignup   = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  static const String login = "$server/auth/login.php";
  //==================ForgetPassword ==========================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verfiycodeforgetpassword = "$server/forgetpassword/verfiycode.php";
  static const String resetpassword = "$server/forgetpassword/resetpassword.php";


//=======================Home=========================//

  static const String homepage = "$server/home.php";

//=====================Sub Categories===================//
static const String subcategories = "$server/subcategories/view.php";
  //=================items========================//

  static const String items = "$server/items/items.php";
  static const String itemstest = "$server/items/items_test.php";
  static const String searchitems = "$server/items/search.php";
  //================favorite====================//

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteview = "$server/favorite/view.php";
  static const String  deletefromfavorite = "$server/favorite/deletefromfavorite.php";

// =============Cart=======================//
  static const String cartview   = "$server/cart/view.php";
  static const String cartAdd    = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

// =============Address=======================//


  static const String addressView   = "$server/address/view.php";
  static const String addressAdd    = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

//===============Coupon=======================//
  static const String checkCoupon   = "$server/coupon/checkcoupon.php";

//=============Checkout============================//
  static const String checkout = "$server/orders/checkout.php";

  //==========orders===============================//


  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String rejectedorders = "$server/orders/rejected.php";


//===========notification================//

  static const String notification = "$server/notification.php";


//===========offer================//

  static const String offers = "$server/offers.php";

  //==============chatbot================//
  static const String chatbot = "$server/chatbot.php";
  static const String geminisave = "$server/save_ai_caht.php";
  //===========Rating================//
  static const String rating = "$server/rating.php";

//==============chat================//

  static const String sendmessage = "$server/chat/send.php";
  static const String getmessage = "$server/chat/get.php";




//============Medical Info================//
  static const String medicalInfoView = "$server/mediacl_info/view.php";
  static const String medicalInfoAdd = "$server/mediacl_info/add.php";
  static const String medicalInfoUpdate = "$server/mediacl_info/edit.php";

//==========Users================//
  static String get usersview => "$server/admin/admin_users/view.php";






}
