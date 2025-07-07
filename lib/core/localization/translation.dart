import 'package:get/get_navigation/src/root/internacionalization.dart';

class MyTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {


      //onBoarding page
      //first slide
      "10":"اختر منتاجتك",
      "11":"لدينا اكثر من 100 الف منتج، اختر  \n منتجك من خلال  \n تطبيقنا.",
      // second slide
      "12":"دفع سهل و مأمن",
      "13":"تفقد سهل وطرق دفع سهلة،  \n موثوقة بزبائننا \n من كل انحاء العالم.",
      // theered slide
      "14":"تتبع طلبك ",
      "15":"نستخدم افضل تتبع ممكن ل \n متابعة طلبك ومعرفة مكانه \n سيصل منتجك خلال لحظات.",




      // Choose language
      "1":"اختر اللغة",
      //login page
      "2":"اهلا بعودتك",
      "3":"سجل الدخول بواسطة الايميل وكلمة السر او استمر باستخدام السوشال ميديا",
      "4":"ادخل بريدك الالكتروني",
      "5":"ادخل كلمة السر",
      "6":"تسجيل الدخول",
      "7":"نسيت كلمة المرور",
      "8":"ليس لدي حساب ؟",
      "9":" انشاء حساب ",
      // SignUp page
      "16":"أدخل اسم المستخدم",
      "17":"ادخل رقم هاتفك",
      "18":"انشاء  حساب بواسطة الايميل وكلمة السر او استمر بواسطة السوشال ميديا",
      "20":"تسجيل  دخول",
      "19":"هل لديك حساب  مسبقا",
      //forget password page
      "21":"تحقق من البريد الألكتروني",
      "22":"تحقق",
      "24":"الرجاء ادخال بريدك االكتروني للحصول على رمز التحقق",
      // verification page
      "23":"تحقق من الرمز",
      "25":"الرجاء ادخال رمز التحقق الذي تم ارساله الى ",
      "72":"ارسال الرمز مجددا",
      //reset password page
      "26":"كلمة سر جديدة",
      "27":"رجاء ادخل كلمة السر الجديدة",
      "28":"حفظ",
      "29":"اعد ادخال كلمة السر الجديدة",

      //check email page
      "30":"تم إنشاء الحساب بنجاح",
      //succes Sign up page
      "31":"العودة لتسجيل الدخول",
      "32":"رائع",
      "33":"يمكنك الذهاب والتسجيل باستخدام بريدك الالكتروني",

      //validate
      "34":"اسم مستخدم غير صحيح",
      "35":"بريد الكتروني غير صحيح",
      "36":"رقم هاتف ليس صحيحا",
      "37":"لايمكن ان يكون اقل من",
      "38":"لابمكن ان يكون اكبر من",
      "39":"لايمكن ان يكون فارغا",


      //alert Exit function
      "40":"انتباه",
      "41":"هل انت متأكد \n بانك تريد الخروج",
      "42":"نعم",
      "43":"لا",


      //signup and phone exists
      "44":"تحذير",
      "45":"الريد الالكتروني او رقم الهاتف مسجل مسبقا",
      //verfiycode not correct
      "46":"رمز التحقق ليس صحيحا",
      //login email or password not correct
      "47":"البريد الالكتروني او كملة السر غير صحيحة",
      //Email is Not Exists
      "48":"البريد الالكتروني غير موجود",
      //password not match
      "49":"كلمة المرور غير متطابقة",
      "50":"أعد المحاولة",


      //Home Page

      "51":"استكسف المنتجات",
      "52":"عروض الصيف",
      "53":"خصم 20 % ",
      "54":"الاقسام",
      "55":" منتجات مخصصة لك :",
      "56":"عرض : ",
      "77":"أفضل المبيعات : ",


//Home Screen bottom app bar
      "57":"الاعداد",
      "58":"الملف الشخصي",
      "59":"المفضلة",

      "60":"الرئيسية",
      "61":"الاشعارات",
      "62":"العروض",
      "63":"الإعدادات",


      // Product page
      "64":"اختيارات",
      "65":"قطنة",
      "66":"تغليف الدواء",
      "67":"الفاتورة",
      "68":"اظافة لعربة التسوق",
      //Home Sub categories (Home 2)
       "76":"الاقسام",



      //favorite
      "71":"تنبيه",
      "69":"تمت اظافة المنتج للمفضلة",
      "70":"تمت ازالة المنتج من المفظلة",
      "145":"صفحة المفظلة",

      //Cart
      "73":"تمت اظافة المنتج للسلة",
      "74":"تمت ازالة المنتج من السلة",

      "75":"هذا الدواء يتطلب وصفة طبية لايمكن ان طلبه، قم بزيارتنا في الصيدلية",
      "78":"سلتي",
      "79":"سلتك فارغة",
      "80": "يبدو أنك لم تظف أي منتج للسلة بعد ",
      "81":"لديك ",
      "82":"منتج في سلتك ",
      //Cart bottom navigation bar
      "83":"ادخل كوبون الخصم",
      "84":"تاكيد",
      "85":"رمز الكوبون : ",
      "86":"السعر ",
      "87":"الخصم ",
      "88":"التوصيل ",
      "89":"السعر الإجمالي ",
      "90":"طلب ",
      "91":"سلتك فارغة",
      "92":"لم يتم العثور على هذ الكوبون  أعد المحاولة او تاكد منه",
      "93":"تحذير ",



      //Checkout

      "94":"استكمال الدفع",
      "95":"ملاحظات طبية ",
      "96":"هل تعاني من أمراض مزمنة؟",
      "97":"هل تتناول أدوية أخرى؟",
      "98":"اشرح حالتك بدقة للصيدلي. أو ملاحظات أو نصائح من الطبيب.",
      "99":"اختر طريقة الدفع",
      "100":"الدفع عند التوصيل",
      "101":"البنك الإسلامي",
      "102":"اختر طريقة التوصيل",
      "103":"عامل التوصيل",
      "104":"استلام في الصيدلية",
      "105":"اختر عنوان التوصيل",
      "106":"اكتب هنا...",
      "107":"اتمام العملية",

      //settings
      "108":"إيقاف الإشعارات",
      "109":"الطلبات",
      "110":"أرشيف الطلبات",
      "111":"عناويني",
      "112":"من نحن",
      "113":"تواصل معنا",
      "114":"تسجيل الخروج",
      "157":"الملف الطبي",
      "158":"الطلبات المرفوضة",

      //Address
      "115":"العناوين",
      "116":"اظافة عنوان جديد",
      "117":"اظافة العنوان",
      "118":"اظافة تفاصيل العنوان",
      "119":"اسم المدينة",
      "120":"مدينة",
      "121":"اسم الشارع",
      "122":"شارع",
      "123":"اسم الموقع",
      "124":"المنزل",
      "125":"هل يوجد ملاحظات",
      "126":"ملاحظة",
      "127":"إظافة",



      //Orders

      "128":"الطلبات",
      "129":"رقم الطلب : #",
      "130":"نوع الطلب : ",
      "131":"سعر الطلب: ",
      "132":"سعر التوصيل: ",
      "133":"طريقة الدفع: ",
      "134":"حالة الطلب: ",
      "135":"السعر الإجملي: ",
      "136":"تفاصيل",
      "137":"توصيل",
      "138":"استلام في الصيدلية",
      "139":"الدفع عند الاستلام",
      "140":"البك الاسلامي",
      "141":"بانتظار الموافقة",
      "142":"الطلب في حالة التجهيز",
      "143":"الطلب في الطريق",
      "144":"مؤرشف",
      "300":"جاهز للاستلام عامل التوصيل",
      //orders Details
      "146":"تفاصيل الطلب",
      "147":"اسم المنتج",
      "149":"الكمية",
      "150":"السعر ",
      "151":"السعر الإجمالي:",
      "152":"حالة الطلب :",
      "153":"عنوان التوصيل: ",
      "195":"تتبع الطلب",
      "196":"تقييم",
      //Notification
      "155":"الإشعارات",

      //Rating

      "198":"تقييم الطلب",
      "199":"اختر عدد النجوم المراد التقييم بها",
      "200":"اظافة تعليق",
      "201":"ارسال",


      //mdeical info

      "160":"تعديل البيانات",
      "161":"العمر",
      "162":"ادخل عمرك",
      "163": "الرجاء ادخال  العمر",
      "164":"الرجاء ادخال رقم صحيح",
      "165":"الطول",
      "166":"الطول بالسنتيمتر",
      "167": "الرجاء ادخال الطول",
      "168":"الوزن",
      "169":"الوزن بالكيلو غرام",
      "170": "الجاء ادحال الوزن",
      "171":"الجنس",
      "172":"ذكر",
      "173":"امراءة",
      "174":"الجراء اختيار الجنس",
      "175":"فصيلة لدم",
      "176":"رجاء اختر فصييلة دمك",
      "177":"",
      "178":"امراض مزمنة",
      "179":"ادخل الامراض المزمنة ان وجدت",
      "180":"الحساسيات",
      "181":"الحساسيات ان وجدت",
      "182":"الادوية الحالية",
      "183":"ان وجدت",
      "184":"ملاحظات اظافية",
      "185":"حفظ المعلومات",
      "186":"سنة",
      "187":"cm",
      "188":"kg",
      "189":"غير محدد",
      "190":"",
      "191":"",
      "192":"",

    },
    "en":{
      // Choose language
      "1":"Choose language",
      //login page
      "2":"Welcome Back",
      "3":"Sign In With Your Email And Password Or Continue  With Social Media",
      "4":"Enter your Email",
      "5":"Enter your Password",
      "6":"Sign In",
      "7":"Forget Password",
      "8":"Don't have account ?",
      "9":" Sign Up",
      // SignUp page
      "16":"Enter Your Username",
      "17":"Enter Your Phone",
      "18":"Sign Up With Your Email And Password Or Continue  With Social Media",
      "20":"Sign In",
      "19":"Do you have an account",
      //forget password page
      "21":"Check Email",
      "22":"Check",
      "24":"please Enter Email Address To Receive A verification Code",
      // verification page
      "23":"Check Code",
      "25":"Please Enter The  Verification Code That Sent To ",
      //reset password page
      "26":"New Password",
      "27":"Please Enter New Password",
      "28":"Save ",
      "29":"Re Enter Your Password",

      //check email page
      "30":"Success SignUp",
      //succes Sign up page
      "31":"Go To LogIn",
      "32":"Good",
      "33":"Now You Can Go And LogIn With Your Email",

      //validate
      "34":"Not Valid Username",
      "35":"Not Valid Email",
      "36":"Not Valid Phone Number",
      "37":"Can't Be Less than",
      "38":"Can't Be Larger than",
      "39":"Can't be Empty",


      //alert Exit function
      "40":"attention",
      "41":"Are you Sure \n  you want to close the App",
      "42":"Yes",
      "43":"No",

      //signup and phone exists
      "44":"Warning",
      "45":"Phone Number Or Email Already Exists",
      //verfiycode not correct
      "46":"Verfiy Code Not Correct",
      //resend verfiy code
      "72":"Resend Verfiy Code",
      //login email or password not correct
      "47":"Email OR Password Not Correct",
      //Email is Not Exists
      "48":"Email is Not Exists",
      //password not match
      "49":"Password Not Match",
      "50":"Try Again",




      //Home Page

      "51":"Find Product",
      "52":"Summer Surprise",
      "53":"Discount 20 % ",
      "54":"Common Categories",
      "55":"Product For You",
      "56":"Offer",
      "77":"Best Selling Products",
      //Home Sub categories (Home 2)
      "76":"Sub Categories",
      //Home Screen bottom app bar
      "57":"Settings",
      "58":"Profile",
      "59":"Favorite",

      "60":"Home",
      "61":"Notification",
      "62":"Offers",
      "63":"Settings",


      // Product page
      "64":"Optional",
      "65":"cotton",
      "66":"wrapping",
      "67":"invoice",
      "68":"Go To Cart",


      //favorite
      "71":"Notification",
      "69":"Done Adding The Product To Favorite",
      "70":"Done Deleting The Product From  Favorite",
      "145":"My Favorites",

      //Cart
      "73":"Done Adding The Product To Cart",
      "74":"Done Deleting The Product From Cart",

      "75":"This medicine requires a prescription. We cannot order it For You. Please Visit us at the pharmacy.",
      "78":"My Cart",
      "79":"Your Cart is Empty",
      "80": "Looks like you haven't added\nanything to your cart yet",
      "81":"You Have",
      "82":"Items In Your list",
      //Cart bottom navigation bar
      "83":"Enter Coupon Code",
      "84":"Apply",
      "85":"Coupon Code : ",
      "86":"Price",
      "87":"Discount",
      "88":"Shipping",
      "89":"Total Price",
      "90":"Order",
      "91":"Your Cart Is Empty",
      "92":"Coupon Not Found",
      "93":"Warning",


      //Checkout

      "94":"Check Out",
      "95":"Medical Notes",
      "96":"Do you suffer from chronic diseases?",
      "97":"Do you take other medications?",
      "98":"Explain your condition carefully to the pharmacist. Or Notes or advice from the doctor",
      "99":"Choose Payment Method",
      "100":"Cash On Delivery",
       "101":"Islamic Bank",
       "102":"Choose Delivery Method",
       "103":"Delivery",
       "104":"Local",
      "105":"Choose Shipping Address",
      "106":"Type Here...",
      "107":"Check Out",


      //settings
      "108":"Disable Notifications",
      "109":"Orders",
      "110":"Archived Orders",
      "111":"Address",
      "112":"About Us",
      "113":"Contact Us",
      "114":"Logout",
      "157" : "Medical Info",
      "158":"Rejected Orders",

      //Address
      "115":"Address",
      "116":"Add New Address",
      "117":"Add Address",
      "118":"Add Details Address",
      "119":"Your City",
      "120":"City",
      "121":"Your Street",
      "122":"Street",
      "123":"Your location name",
      "124":"Name",
      "125":"any Note",
      "126":"note",
      "127":"Add",


      //Orders

      "128":"Orders",
      "129":"Order Number : #",
      "130":"Order Type: ",
      "131":"Order Price: ",
      "132":"Delivery Price: ",
      "133":"Payment Method: ",
      "134":"Order Status: ",
      "135":"Total Price: ",
      "136":"Details",
      "137":"Delivery",
      "138":"Local",
      "139":"Cash On Delivery",
      "140":"Islamic Bank",
      "141":"Pending Approval",
      "142":"The Order is Being Prepared",
      "143":"On The Way",
      "300":"Ready To Pickup By Delivery Man",
      "144":"Archive",
      "156":"Since",
      ""

      //orders Details
      "146":"Order Details",
      "147":"Product Name",
      "149":"Quantity ",
      "150":"Price ",
      "151":"Total Price: ",
      "152":"Order Status: ",
      "153":"Shipping Address: ",
      "195":"Tracking",
      "196":"Rating",
      //Notification
      "155":"Notifications",



      //mdeical info

      "160":"Edit Information",
      "161":"Age",
      "162":"Enter your age",
      "163": "Please enter your age",
      "164":"Please enter a valid number",
      "165":"Height",
      "166":"Height in cm",
      "167": "Please enter your height",
      "168":"Weight",
      "169":"Weight in kg",
      "170": "Please enter your weight",
      "171":"Gender",
      "172":"Male",
      "173":"Female",
      "174":"Please select your gender",
      "175":"Blood Type",
      "176":"Please select your blood type",
      "177":"",
      "178":"Chronic Diseases",
      "179":"Chronic diseases (if any)",
      "180":"Allergies",
      "181":"Allergies (if any)",
      "182":"Current Medications",
      "183":"Current medications (if any)",
      "184":"Additional Notes",
      "185":"Save Information",
      "186":"years",
      "187":"cm",
      "188":"kg",
      "189":"Not specified",
      "190":"",
      "191":"",
      "192":"",

      //Rating

      "198":"Order Rating",
      "199":"Choose Star Numbers",
      "200":"Add Comment",
      "201":"Send",


      //onBoarding text  page
      // first slide
      "10":"Choose Product",
      "11":"Wee have an 100K+ of Products, Choose \n your product From Our \n Application.",
      // second slide
      "12":"Esay & Safe Payment",
      "13":"Esay Checkout & Safe Payment \n method, Trusted By our Customers \n from all over the world.",
      // theered slide
      "14":"Track Your Order",
      "15":"Best tracke has Been Used For \n Track Your Order. You'll Know Where \n your product is at the moment.",


    },

  };

}