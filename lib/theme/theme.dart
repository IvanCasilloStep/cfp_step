import 'package:flutter/material.dart';


class TemaStep {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
        colorScheme: const ColorScheme(
          primary: AppColors.mintGreen, // Colore primario
          primaryContainer: AppColors.darkCyan, // Variante del colore primario
          secondary: AppColors.darkCyan, // Colore secondario (puoi sostituire con un altro colore se necessario)
          secondaryContainer: AppColors.darkCyan, // Variante del colore secondario
          surface: AppColors.lightMintGreen, // Colore della superficie (ad es. background di AppBar e Card)
          background: AppColors.whiteSmoke, // Colore di sfondo
          error: AppColors.red, // Colore per gli errori
          onPrimary: AppColors.white, // Colore del testo quando è posizionato sul colore primario
          onSecondary: AppColors.darkCyan, // Colore del testo quando è posizionato sul colore secondario
          onSurface: AppColors.darkCyan, // Colore del testo quando è posizionato sulla superficie
          onBackground: AppColors.black, // Colore del testo quando è posizionato sullo sfondo
          onError: AppColors.darkCyan, // Colore del testo quando è posizionato sull'errore
          brightness: Brightness.light, // Luminosità del tema (light o dark)
        ),
        // textTheme: GoogleFonts.interTightTextTheme(),
        buttonTheme: theme.buttonTheme.copyWith(
          minWidth: 50,
          buttonColor: AppColors.darkCyan,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white, // Colore del testo
              backgroundColor: AppColors.mintGreen),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.darkCyan, side: const BorderSide(color: AppColors.darkCyan)),
        ),

        segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return AppColors.lightMint;
                }
                return AppColors.white;
              },
            ),
            textStyle: const MaterialStatePropertyAll<TextStyle?>(TextStyle(color: AppColors.black)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(iconColor: AppColors.darkCyan, foregroundColor: AppColors.darkCyan)),
        datePickerTheme: const DatePickerThemeData(backgroundColor: AppColors.white),
        timePickerTheme: const TimePickerThemeData(
            backgroundColor: AppColors.white,
            hourMinuteTextStyle: TextStyle(fontSize: 45),
            dayPeriodTextColor: AppColors.mintGreen,
            dialBackgroundColor: AppColors.lightMint,
            dialHandColor: AppColors.darkCyan),
        tabBarTheme: const TabBarTheme(indicatorColor: AppColors.darkCyan, labelColor: AppColors.darkCyan),
        cardTheme: const CardTheme(color: AppColors.white),
        scaffoldBackgroundColor: AppColors.whiteSmoke);
  }
}

class AppColors {
  static const mintGreen = Color(0xff1c77b9);
  static const lightGreen = Color(0xFF7DCBAF);
  static const darkCyan = Color(0xFF0E312D);
  static const lightMintGreen = Color(0xFF1C77B9);
  static const lightMint = Color(0xFFD4EEE4);
  static const white = Colors.white;
  static const black = Colors.black;
  static const whiteSmoke = Color(0xFFE5E5E5);
  static const red = Colors.red;
  static const darkGrey = Color.fromARGB(255, 33, 33, 33);
  static const grey = Color.fromARGB(255, 130, 130, 130);
  static const shadowBlack = Color.fromARGB(96, 0, 0, 0);
  static const amber = Color(0xFFE6A545);
  static const orange = Color(0xFFFF8000);
  static const darkBlu = Color(0xFF2596BE);
  static const mauvePurple = Color(0xFFE0B0FF);
  static const sliderGreen1 = Color(0xFF1D5C4B);
  static const sliderGreen2 = Color(0xFF226A55);
  static const sliderGreen3 = Color(0xFF28785F);
  static const sliderGreen4 = Color(0xFF2D8669);
  static const sliderGreen5 = Color(0xFF329573);
}

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const double titleFontSize = 34;
  static const double superSmallTextFontSize = 12;
  static const double superSmallLargeTextFontSize = 14;
  static const double smallTextFontSize = 18;
  static const double smallTextFontSize2 = 17;
  static const double smallLargeTextFontSize = 20;
  static const double mediumTextFontSize = 24;
  static const double mediumTextFontSize2 = 25;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const EdgeInsets horizontalSmallPaddig = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsets screenMargin = EdgeInsets.all(screenMarginValue);
  static const double screenMarginValue = 8;
  static const EdgeInsets cardContainerMargin = EdgeInsets.only(left: 8, top: 8, right: 8);
  static const double appBarTitleWidth = 240;
  static const double dividerHeigth = 25;
  static const double loginIconWidth = 350;
  static const double loginCardHeigth = 550;
  static const double loginButtonWidth = 200;
  static const double longButtonWidth = 200;
  static const double mediumButtonWidth = 150;
  static const double registerButtonWidth = 200;
  static const EdgeInsets registerConfirmPasswordMargin = EdgeInsets.only(left: 10, right: 10, top: 10);
  static const EdgeInsets registerLoginButtonMargin = EdgeInsets.only(left: 10, right: 10, bottom: 10);
  static const EdgeInsets registerElevatedButtonMargin = EdgeInsets.only(left: 10, right: 10, bottom: 40);
  static const EdgeInsets loginLabelMargin = EdgeInsets.all(30);
  static const EdgeInsets buttonMargin = EdgeInsets.all(30);
  static const EdgeInsets modifyButtonMargin = EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10);
  static const EdgeInsets errorLabelMargin = EdgeInsets.all(30);
  static const EdgeInsets loginTextButtonMargin = EdgeInsets.only(
    right: 30,
    left: 32,
  );
  static const EdgeInsets loginPasswordtextFieldMargin = EdgeInsets.only(
    left: 32,
    right: 32,
    top: 15,
  );
  static const EdgeInsets createMatchCardPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 50);
  static const EdgeInsets textFieldMargin = EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10);
  static const EdgeInsets textCardInfoMargin = EdgeInsets.only(bottom: 10, left: 10, right: 10);
  static const double cardBottomTopMarginValue = 10;
  static const double fieldCardHeight = 90;
  static const EdgeInsets fieldCardMrgin = EdgeInsets.only(top: 5, bottom: 5);
  static const EdgeInsets fieldCardAddressMargin = EdgeInsets.only(top: 10, bottom: 10);
  static const double fieldCardDividerWidthFactor = 0.9;
  static const EdgeInsets loginTextFieldMargin = EdgeInsets.symmetric(horizontal: 32, vertical: 5);
  static const EdgeInsets textFieldIconMargin = EdgeInsets.all(4);
  static const double infinity = double.infinity;
  static const appBarSize = 60.0;
  static const appBarWithTabSize = 100.0;
  static const double bottomNavRadius = 15;
  static const double blurRadius = 10;
  static const EdgeInsets homeWelcomeLabelMargin = EdgeInsets.only(top: 15, left: 8);
  static const double homeCreateMatchCardHeigth = 250;
  static const EdgeInsets homeCreateMatchCardMargin = EdgeInsets.symmetric(horizontal: screenMarginValue, vertical: 15);
  static const EdgeInsets homeCreateMatchCardImageMargin = EdgeInsets.only(top: 10);
  static const double homeCreateMatchCardImageHeight = 145;
  static const double infoTabCardMinHeight = 600;
  static const double infoTabCardImageHeight = 250;
  static const EdgeInsets infoTabTextContainerMargin = EdgeInsets.all(20.0);
  static const EdgeInsets infoTabElevatedButtonsMargin = EdgeInsets.all(20.0);
  static const EdgeInsets playersTabPlayerCardMargin = EdgeInsets.all(15.0);
  static const double playersTabPlayerCardHeight = 70;
  static const EdgeInsets playersTabPlayerCardRoleMargin = EdgeInsets.only(top: 10.0);
  static const EdgeInsets playersTabPlayerCardOwnerIconMargin = EdgeInsets.only(right: 30.0);
  static const EdgeInsets playersTabPlayerCardKcikIconMargin = EdgeInsets.only(right: 35.0);
  static const double playersTabPlayerCardKcikIconMarginWidth = 24;
  static const double playersTabPlayerCardDividerWidthFactor = 0.8;
  static const EdgeInsets cardTextMargin = EdgeInsets.only(left: 10);
  static const EdgeInsets cardTitleMargin = EdgeInsets.only(left: 10, top: 15);
  static const EdgeInsets cardTitlePadding = EdgeInsets.only(left: 10);
  static const EdgeInsets iconTextMargin = EdgeInsets.only(right: 5);
  static const double iconTextIconSize = 15;
  static const EdgeInsets matchCardMargin = EdgeInsets.only(top: 5, bottom: 5);
  static const EdgeInsets matchCardLocationMargin = EdgeInsets.only(top: 10, bottom: 10);
  static const double matchCardButtonHeight = 10;
  static const double splashWidth = 350;
  static const double splashHeight = 350;
  static const double sliderSlideOpacity = 50;
  static const double sliderSlideLogoWidth = 250;
  static const double sliderSlideNextWidth = 150;
  static const double sliderSelectedOpacity = 0.9;
  static const double sliderOpacity = 0.4;
  static const double sliderDisabledOpacity = 0.2;
  static const double sliderDotDimension = 12;
  static const int sliderDuration = 600;
  static const int minScreenHeight = 720;
  static const int minScreenWidth = 370;
  static const double shimmerLongLineWidth = 215;
  static const double shimmerMediumLineWidth = 102;
  static const double shimmerSmallLineWidth = 65;
  static const double shimmerSmallScreenLongLineWidth = 150;
  static const double shimmerSmallScreenMediumLineWidth = 70;
  static const double shimmerSmallScreenSmallLineWidth = 40;
  static const EdgeInsets sliderDotMargin = EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0);
  static const double shimmerLineHeigth = 16.23;
  static const double shimmerMatchCardImageHeigth = 140;
  static const double shimmerMatchCardImageWidth = 110;
  static const EdgeInsets sliderSlideLogoMargin = EdgeInsets.only(top: 80, left: 50, right: 50, bottom: 80);
  static const EdgeInsets sliderSlideTextMargin = EdgeInsets.all(20);
  static const EdgeInsets shimmerPlayersTabMargin = EdgeInsets.only(left: 15, top: 15, bottom: 30);
  static const double circularProgressIndicatorOpacity = 0.2;
  static const EdgeInsets infoButtonMargin = EdgeInsets.only(left: 2);
  static const double infoButtonDimension = 30;
  static const double infoButtonIconDimension = 15;
  static const EdgeInsets matchCardIconMargin = EdgeInsets.all(8);
  static const EdgeInsets matchCardPrivateIconMargin = EdgeInsets.symmetric(vertical: 40, horizontal: 8);
  static const EdgeInsets matchCardOwnerIconPadding = EdgeInsets.all(4);
  static const EdgeInsets textFaIconPadding = EdgeInsets.only(bottom: 4, left: 8, right: 4, top: 4);
  static const EdgeInsets iconLogoutPadding = EdgeInsets.only(right: 10);
  static const EdgeInsets kickerLabelMarginRight = EdgeInsets.only(right: 56);
  static const double infoTabSpaceBetweenLine = 5;
  static const double sizeEuroIcon = 18;
  static const double sizeCircleOut = 70;
  static const double successfullySubscribedSizedBox = 50;
  static const int timeInputHourPadLeft = 2;
  static const int timeInputMinutePadLeft = 2;
  static const EdgeInsets noMoreMatchSizedBoxMargin = EdgeInsets.only(bottom: 20, top: 10);
  static const EdgeInsets noMoreResultsContainerMargin = EdgeInsets.only(bottom: 20, top: 10);
  static const double profileCardHeight = 140;
  static const double profileCardWidth = 110;
  static const EdgeInsets userNameContainerMargin = EdgeInsets.only(top: 10, bottom: 10);
  static const double buttonHeight = 10;
  static const EdgeInsets imageProfilePadding = EdgeInsets.only(top: 35, left: 15);
  static const double imageProfileWidth = 130;
  static const double imageProfileHeight = 125;
  static const EdgeInsets userInfoMargin = EdgeInsets.only(left: 10, top: 20);
  static const EdgeInsets userNameMargin = EdgeInsets.only(top: 10, left: 10);
  static const EdgeInsets userBirthdayMargin = EdgeInsets.only(top: 10, left: 10);
  static const EdgeInsets userRoleMargin = EdgeInsets.only(top: 10, left: 50);
  static const EdgeInsets statsCardPadding = EdgeInsets.only(right: 5, left: 5, top: 35);
  static const double containerStatsCard = 478;
  static const BorderRadius statsCardBorderRadius =
  BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20));
  static const EdgeInsets statsContainerMargin = EdgeInsets.all(25);
  static const EdgeInsets statsTextNumberPadding = EdgeInsets.only(bottom: 5);
  static const double shimmerRectangularHeight = 20;
  static const double shimmerRectangularHeight18 = 18;
  static const double shimmerRectangularHeight16 = 16;
  static const double shimmerRectangularHeight25 = 25;
  static const double shimmerRectangularHeight30 = 30;
  static const double shimmerRectangularHeight80 = 80;
  static const double shimmerRectangularHeight125 = 125;
  static const double shimmerRectangularHeight1000 = 1000;
  static const double shimmerRectangularWidth300 = 300;
  static const double shimmerRectangularWidth320 = 320;
  static const double shimmerRectangularWidth220 = 220;
  static const double shimmerRectangularWidth150 = 150;
  static const double shimmerRectangularWidth160 = 160;
  static const double shimmerRectangularWidth180 = 180;
  static const double shimmerRectangularWidth270 = 270;
  static const double shimmerRectangularWidth400 = 400;
  static const double shimmerRectangularWidth215 = 215;
  static const double shimmerRectangularWidth102 = 102;
  static const double shimmerRectangularWidth100 = 100;
  static const double shimmerRectangularWidth65 = 65;
  static const double shimmerRectangularWidth70 = 70;
  static const double shimmerRectangularWidth80 = 80;
  static const double shimmerRectangularWidth90 = 90;
  static const double shimmerRectangularWidth50 = 50;
  static const double shimmerRectangularWidth30 = 30;
  static const double shimmerHeight = 16.23;
  static const double shimmerImageHeight = 140;
  static const double shimmerImageWidth = 110;
  static const double shimmerCircularHeight = 250;
  static const double shimmerCircularWidth = 500;
  static const EdgeInsets shimmerProfilePadding = EdgeInsets.only(top: 35, left: 35);
  static const EdgeInsets shimmerProfilePadding2 = EdgeInsets.only(right: 5, left: 5, top: 35);
  static const EdgeInsets shimmerProfileMargin = EdgeInsets.only(left: 10, top: 20);
  static const EdgeInsets shimmerProfileMargin2 = EdgeInsets.only(left: 10, top: 10);
  static const double bottomMenuWidth = 75;
  static const double bottomMenuHeight = 40;
  static const double iconSize = 30;
  static const BoxConstraints oldPasswordBoxConstraint = BoxConstraints(maxWidth: 200);
  static const BoxConstraints logoutBoxConstraint = BoxConstraints(maxWidth: 200);
  static const BorderRadius shimmerCircularBorderRadius =
  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20));
  static const double outlinedChangePassButtonWidth = 64;
  static const double outlinedDellProfileButtonWidth = 64;
  static const double matchCardHeight = 140;
  static const double matchCardImageWeight = 110;
  static const int iconPadLeft = 2;
  static const int iconPadRight = 5;
  static const int iconPadRight2 = 6;
  static const EdgeInsets stateMatch = EdgeInsets.all(AppSizes.matchCardButtonHeight);
  static const EdgeInsets changeRoleDialogSecondaryRoleMargin = EdgeInsets.only(left: 10, right: 10, top: 10);
  static const BorderRadius createdByRadius = BorderRadius.all(Radius.circular(100));
  static const double iconCrownSize = 16;
  static const double backgroundRadiusError = 10;
  static const double backgroundRadiusSucces = 10;
  static const EdgeInsets errorMarginLogin = EdgeInsets.all(5);
  static const EdgeInsets longButtonMargin = EdgeInsets.symmetric(vertical: 40);
  static const double containerUnderline = 2;
  static const double containerUnderlineHeightFirstRole = 2;
  static const double containerUnderlineHeightSecondRole = 2;
  static const EdgeInsets secondRoleDropDownMenuMargin = EdgeInsets.only(left: 10, right: 10, top: 10);
  static const int minNumOfPlayer = 2;
  static const int maxNumOfPlayer = 50;
  static const int minDuration = 30;
  static const int maxDuration = 180;
  static const int minCancelTime = 2;
  static const int maxCancelTime = 48;
  static const int minMatchPrice = 0;
  static const int maxMatchPrice = 50;
  static const double createMatchDialogSizedBoxHeight = 8;
  static const int pickedTimeHourPadLeft = 2;
  static const int pickedTimeMinutePadLeft = 2;
  static const int dtMatchHourPadLeft = 2;
  static const int dtMatchMinutePadLeft = 2;
  static const int dtMatchHourPadLeftModMatch = 2;
  static const int dtMatchMinutePadLeftModMatch = 2;
  static const int pickedTimeHourPadLeftModMatch = 2;
  static const int pickedTimeMinutePadLeftModMatch = 2;
  static const int bottomMenuIndexProfile = 2;
  static const EdgeInsets containerRoleProfileMargin = EdgeInsets.only(top: 10, left: 50);
  static const EdgeInsets containerRoleProfileSmallMargin = EdgeInsets.only(top: 10, left: 18);
  static const EdgeInsets containerEditRolePadding = EdgeInsets.only(top: 10.0);
  static const double containerEditRoleHeight = 25;
  static const double containerEditRoleWidth = 25;
  static const EdgeInsets containerEditRoleMargin = EdgeInsets.all(8.0);
  static const double longLineShimmerProfileWidth = 180;
  static const double containerCardShimmerProfileHeight = 478;
  static const BorderRadius containerCardShimmerProfileBorderRad = BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  );
  static const int cardTextMaxLines = 1;
  static const int cardTitleMaxLines = 1;
  static const EdgeInsets matchStateContainerMargin = EdgeInsets.only(right: 12);

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}

class AppCostant {
  //static final rome = tz.getLocation('Europe/Rome');
  static const int splashScreenDuratio = 2500; //milliseconds
  static const animationDuration = Duration(milliseconds: 100);
  static const requestTimeout = Duration(seconds: 30);
  static BoxDecoration cardContainerDecoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // colore dell'ombra
        spreadRadius: 2, // diffusione dell'ombra
        blurRadius: 3, // sfocatura dell'ombra
        offset: const Offset(0, 3), // posizione dell'ombra (orizzontale, verticale)
      ),
    ],
  );
  static const OutlineInputBorder textFieldBorder =
  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25)));
  static const Widget textFieldSpacer5 = SizedBox(width: 5);
  static const Widget textFieldSpacer = SizedBox(width: 10);
  static const Widget textFieldSpacer2 = SizedBox(width: 20);
  static const Widget textFieldSpacer8 = SizedBox(width: 80);
  static const Widget spacer = Expanded(child: SizedBox());
  static const Widget spacer20 = SizedBox(height: 20);
  static const Widget spacer30 = SizedBox(height: 30);
  static const Widget spacer40 = SizedBox(height: 40);
  static const Widget spacer80 = SizedBox(height: 80);
  static const Widget spacer50 = SizedBox(height: 50);
  static const Widget sliderNavigationButtonSpacer = SizedBox(width: 20);
  static const Widget spacer13 = SizedBox(height: 13);
  static const Widget spacer15 = SizedBox(height: 15);
  static const Widget spacer10 = SizedBox(height: 10);
  static const Widget spacer5 = SizedBox(height: 5);
  static const Widget spacerWidth5 = SizedBox(width: 5);
  static const Widget spacer200 = SizedBox(height: 200);
  static const double dividerHeight = 20;
  static const double dividerThickness = 1;
  static const int page = 1;
  static const int currentPage = 1;
  static const int currentEndedMatchPage = 1;
  static const int currentPageReservedMatch = 1;
  static const int limiter = 10;
  static const int limiterAllMatch = 8;
  static const int limiterEndMatch = 8;
  static const int limiterReservedMatch = 8;
  static const int totalPlayers = 10;
  static const int cancelTime = 2;
  static const double price = 7.0;
  static const int duration = 60;
  static const int decimalDigits = 2;
  static const int matchCreatorMaxLines = 1;
  static const int defaultTabControllerLenght = 2;
  static const int defaultTabControllerLenghtMatchScreen = 3;
  static const int lengthLimitingTextInputFormatter = 2;
  static const int lengthLimitingTextInputFormatterPrice = 5;
  static const int lengthLimitingTextInputFormatterDuration = 3;
  static const int lengthLimitingTextInputFormatterCodeMatch = 6;
  static const int tryParseNegativeNumTotPlayers = -1;
  static const int tryParsePositiveNumTotPlayers = 10;
  static const int tryParseNegativeNumDuration = -1;
  static const int tryParsePositiveNumDuration = 60;
  static const int tryParseNegativeNumCancTime = -1;
  static const int tryParsePositiveNumCancTime = 2;
  static const double tryParseNegativePrice = -1;
  static const double tryParsePositivePrice = 7.0;
  static const BoxConstraints passwordBoxConstraint = BoxConstraints(maxWidth: 260);
  static const int numberOfSlide = 3;
  static const int zero = 0;
  static const int one = 1;
  static const int two = 2;
  static const double viewportFraction = 1.0;
  static const int delayDuration = 2500;
  static const double romeLat = 41.89193;
  static const double romeLong = 12.51133;
  static const int delayDialogsDuration = 2000;
  static const int passwordMinLenght = 8;
  static const double matchPrice = 10;
  static const int toastErrorDuration = 5;
  static const int toastSuccesDuration = 5;
  static const BoxConstraints logoutBoxConstraints = BoxConstraints(maxWidth: 320);
  static const BoxConstraints firstRoleBoxConstraints = BoxConstraints(maxWidth: 300);
  static const BoxConstraints secondRoleBoxConstraints = BoxConstraints(maxWidth: 300);
  static const BoxConstraints secondRoleInfoBoxConstraints = BoxConstraints(maxWidth: 320);
  static const int daysOfTheYear = 365;
  static const int dayTomorrow = 1;
  static const int dateTimeSubtract = -1;
  static const double zeroDot = 0.0;
  static const int nearMatchLat = 10;
  static const int nearMatchLng = 2;
  static const int openMapLat = 1;
  static const int openMapLng = 0;
  static const int matchCodeLenght = 6;
}

class AppStrings {
  static const kickerz = "KICKERZ";
  static const pageSize = 20;
  static const notAvailable = -1;
  static const home = "Home";
  static const profile = "Profilo";
  static const matches = "Partite";
  static const currentMatches = "Attive";
  static const reservedMatches = "Prenotate";
  static const endedMatches = "Concluse";
  static const info = "Informazioni";
  static const players = "Giocatori";
  static const email = "Email";
  static const yes = "Si";
  static const no = "No";
  static const modify = "Modifica";
  static const postpone = "Rinvia";
  static const password = "Password";
  static const forgotPassword = "Hai dimenticato la password?";
  static const logout = "Logout";
  static const login = "Accedi";
  static const welcome = "Benvenuto su Kickerz!";
  static const bookMatch = "Organizza la tua partita";
  static const createMatch = "Crea la tua partita!";
  static const createMatch2 = "Crea Partita";
  static const nearbyMatch = "Partite nelle vicinanze";
  static const organizedMatches = "Organizzate";
  static const stat = "Statistiche";
  static const personalData = "Dati personali";
  static const changePass = "Cambia password";
  static const logOutMess = "Sei sicuro di voler eseguire il logout?";
  static const successLogout = "Logout effettuato";
  static const creator = "Organizzatore: ";
  static const date = "Data: ";
  static const date2 = "Data";
  static const time = "Orario: ";
  static const time2 = "Orario";
  static const hours = "ore";
  static const duration = "Durata";
  static const durationWithColon = "Durata: ";
  static const cancelTime = "Cancellazione";
  static const price = "Prezzo a persona";
  static const pricepp = "Prezzo PP";
  static const euro = "€ ";
  static const minutes = "minuti";
  static const privateMatch = "Partita Privata";
  static const join = "Partecipa";
  static const registeredPlayers = "Partecipanti: ";
  static const joined = "Esci";
  static const delete = "Elimina";
  static const expiration = "Cancellazione: ";
  static const playAgain = "Rigioca";
  static const matchState = "Stato partita";
  static const inMakingState = "In preparazione";
  static const inMakingStateDescription = "Campo non ancora prenotato";
  static const bookedState = "Prenotato";
  static const bookedStateDescription = "Campo già prenotato";
  static const successfullySubscribed = "Iscritto con successo";
  static const inGameState = "In Corso";
  static const endedState = "Conclusa";
  static const postponedState = "Rinviata";
  static const cancelledState = "Annullata";
  static const confirmDeleteMatch = "Vuoi davvero eliminare questa partita?";
  static const postponeAlert = "Attenzione, rinviando la partita tutti i partecipanti verranno rimossi";
  static const passwordInfo =
      "La password deve essere lunga almeno 8 caratteri e contenere una lettera maiuscola, una lettera minuscola e una numero";
  static const bookFieldWarning = "L'applicazione non si occupa della prenotazione del campo!";
  static const cancelTimeExplanation =
      "*Per cancellazione si intende il termine minimo in ore dopo il quale non è più possibile cancellare la partita.";
  static const minSuffix = " min";
  static const hourSuffix = " h";
  static const register = "Registrati";
  static const alreadyRegister = "Sei già registrato? Loggati qui!";
  static const createMatchDialogText = "Creare la partita?";
  static const modifyMatchDialogText = "Modificare la partita?";
  static const confirmUnsubscribeDialogText = "Uscire dalla partita?";
  static const confirmKickDialogText = "Vuoi davvero espellere questo giocatore?";
  static const succesfullyEditMatch = "Partita aggiornata con successo";
  static const exitedMatch = "Sei uscito dalla partita";
  static const kickedPlayer = "Giocatore espulso con successo";
  static const name = "Nome";
  static const surname = "Cognome";
  static const username = "Username";
  static const birthDate = "Compleanno";
  static const sliderWelcome = "Organizza le tue partite senza stress con Kickerz!";
  static const sliderMatch = "Crea o partecipa a gruppi partite pubblici e privati";
  static const next = "Avanti";
  static const sliderNearMatches = "Trova campi e strutture vicine a te";
  static const confirmPassword = "Conferma Password";
  static const oldPassword = 'Vecchia Password';
  static const newPassword = 'Nuova Password';
  static const confirm = 'Conferma';
  static const cancel = 'Annulla';
  static const successDeleteProfile = 'Utente eliminato';
  static const successCreateMatch = "Partita creata con successo!";
  static const successRegister = "Registrato con successo!";
  static const noMoreMatch = "Lista match terminata! 😢";
  static const deleteProfile = "Elimina profilo";
  static const irreversibleAction = "Questa azione sarà irreversibile";
  static const hiddenPassword = '•••••••••••';
  static const token = 'token';
  static const exceptionWithColon = 'Exception: ';
  static const warning = 'Attenzione';
  static const successChangePassword = "Password cambiata con successo";
  static const errorQuitInCancelTime = "Non puoi uscire da una partita in cancellazione";
  static const errorMinimumCharacterPassword = "Minimo 8 caratteri";
  static const errorUppercasePassword = "Almeno una maiuscola";
  static const errorLowercasePassword = "Almeno una minuscola";
  static const errorNumberPassword = "Almeno un numero";
  static const errorNewPassword = "Password uguale alla vecchia";
  static const errorConfirmPassword = "Le password non coincidono";
  static const errorRequiredField = "Campo obbligatorio";
  static const errorNoData = "Nessun dato disponibile";
  static const errorNoInternet = "Nessuna connessione a internet";
  static const errorTimeout = "Impossibile raggiungere il server";
  static const noInternetDialogTitle = "Nessuna connessione";
  static const noInternetDialogBody = "Non è stato possibile connettersi a internet... Premi il tasto per riprovare";
  static const noInternetDialogButtonText = "Riconnettiti";
  static const timeoutDialogTitle = "Impossibile raggiungere il server";
  static const timeoutDialogBody =
      "Non è stato possibile connettersi al server... Riprova più tardi o premi il tasto per riprovare";
  static const erroNoNearbyMatch = "Nessuna partita nelle vicinanze";
  static const errorNoMatch = "Nessuna partita...";
  static const errorInsertEmail = 'Inserisci la tua email';
  static const errorInsertPassword = 'Inserisci la tua Password';
  static const errorDifferentPassword = "Le password non coincidono";
  static const errorInvalidEmail = "Email non valida";
  static const errorInvalidPlayersNumber = "Min: ${AppSizes.minNumOfPlayer} Max: ${AppSizes.maxNumOfPlayer}";
  static const errorInvalidMatchDuration = "Min: ${AppSizes.minDuration} Max: ${AppSizes.maxDuration}";
  static const errorInvalidCancelTime = "Min: ${AppSizes.minCancelTime} Max: ${AppSizes.maxCancelTime}";
  static const errorInvalidPrice = "Min: ${AppSizes.minMatchPrice} Max: ${AppSizes.maxMatchPrice}";
  static const errorInvalidDate = "Data inserita non valida";
  static const errorMultimatch = "Partecipi già ad un match in questa fascia oraria...";
  static const errorCancelTimeUnregister = "È troppo tardi per uscire da questa partita!";
  static const errorFormatCoordinates = 'Invalid coordinate format';
  static const genericError = "Ops! C'è stato un problema, riprova più tardi";
  static const locationTitle = "Permessi posizione";
  static const locationBody1 = "Quest'app necessita dei permessi di posizione per mostrarti i campi più vicini a te!";
  static const locationBody2 = "Se non dovessi accettarli ti mostreremo i risultati come se fossi a Roma...";
  static const locationButton = "OK";
  static const locationDenied = "Non è stato dato accesso ai permessi di posizione";
  static const emptyString = "";
  static const italianLocale = "it_IT";
  static const itLocale = "it";
  static const tryParseNegativeNumTotPlayers = "-1";
  static const tryParsePositiveNumTotPlayers = "10";
  static const tryParseNegativeNumDuration = "-1";
  static const tryParsePositiveNumDuration = "60";
  static const tryParseNegativeNumCancTime = "-1";
  static const tryParsePositiveNumCancTime = "2";
  static const dot = ".";
  static const comma = ",";
  static const slash = '/';
  static const zero = '0';
  static const eliminatedMatch = "Partita eliminata con successo!";
  static const playerRolePt = "PT";
  static const playerRolePtFull = "Portiere";
  static const playerRoleDf = "DF";
  static const playerRoleDfFull = "Difensore";
  static const playerRoleCc = "CC";
  static const playerRoleCcFull = "Centrocampista";
  static const playerRoleAt = "AT";
  static const playerRoleAtFull = "Attaccante";
  static const playerRoleJolly = "Jolly";
  static const errorWithColon = "Errore: ";
  static const changeRole = "Cambia ruolo";
  static const primaryRole = "Ruolo Primario";
  static const secondaryRole = "Ruolo Secondario";
  static const change = "Cambia";
  static const start = "Iniziamo";
  static const backToLogin = "Torna alla Login";
  static const enter = "Entra";
  static const jollyExplain = "Con jolly si da la disponibilità a giocare qualsiasi ruolo";
  static String shareCodeStringBuilder(code) {
    return '$code beccati questo codice💪🏻\n'
        'Partecipa alla mia partita su KICKERZ!\n'
        'Puoi entrare per favoreh?\n';
  }

  static const successfullySharedMatch = "Partita condivisa con successo";
  static const findMatch = "Trova Partita";
  static const errorMatchCodeLenght = "Richiesti 6 caratteri";
  static const codePrivateMatch = "Codice Partita";
  static const infoCancelTime =
      "Per tempo di cancellazione si intende il numero di ore prima dell'inizio della partita in cui non è più possibile modificarla o eliminarla. Quando una partita entra in cancellazione:\nSe la partita è ancora in 'In Preparazione' viene annullata.\nSe la partita è in 'Prenotato' viene posta in 'In Corso'.\nIn casi di eventi imprevisti durante la cancellazione è sempre possibile rinviare la partita";
}

class ExceptionStrings {
  static const invalidToken = "Invalid Token";
  static const multimatchException = "Multimatch";
  static const cancelTimeException = "already past the cancel time.";
  static const mapException = "Error opening map application!";
  static const generalException = "Internal Server Error!";
}

class AppAssetsImage {
  static const fieldPlaceholderURL = "images/field_placeholder.jpg";
  static const kickerzWhiteLabel = "images/kickerz_white_label.png";
  static const kickerzLabel = "images/kickerz_label.png";
  static const kickerzLabelCutted = "images/kickerz_label_cutted.png";
  static const player = "images/player.png";
  static const splash = "images/splash_logo.png";
  static const filigrana = "images/filigrana.png";
  static const welcomeSlider = "images/slider_welcome.png";
  static const matchSlider = "images/slider_match.png";
  static const nearMatchesSlider = "images/slider_near_matches.png";
  static const defaultPlayer = "images/profile_image/default-player.png";
  static const atPlayer = "images/profile_image/player-AT.png";
  static const ccPlayer = "images/profile_image/player-CC.png";
  static const dfPlayer = "images/profile_image/player-DF.png";
  static const ptPlayer = "images/profile_image/player-PT.png";
}

class AppFonts {
  static const String dockerOne = "docker_one";
}

class AppRegExp {
  static const String onlyLettersString = '[a-zA-Z ]';
  static RegExp onlyLetters = RegExp(onlyLettersString);
  static const String noSpacesString = r'\s';
  static RegExp noSpaces = RegExp(noSpacesString);
  static RegExp haveUppercaseLetter = RegExp(r'[A-Z]');
  static RegExp haveLowercaseLetter = RegExp(r'[a-z]');
  static RegExp haveNumber = RegExp(r'\d');
  static RegExp validEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}

class MatchStateCode {
  static const int inMakingState = 0;
  static const int bookedState = 1;
  static const int inGameState = 2;
  static const int endedState = 3;
  static const int cancelledState = -1;
  static const int postponedState = -2;
}
