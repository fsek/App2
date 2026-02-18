import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sv.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sv')
  ];

  /// No description provided for @fGuildName.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen inom TLTH'**
  String get fGuildName;

  /// No description provided for @dGuildName.
  ///
  /// In sv, this message translates to:
  /// **'D-sektionen inom TLTH'**
  String get dGuildName;

  /// No description provided for @language.
  ///
  /// In sv, this message translates to:
  /// **'Språk'**
  String get language;

  /// No description provided for @swedish.
  ///
  /// In sv, this message translates to:
  /// **'Svenska'**
  String get swedish;

  /// No description provided for @english.
  ///
  /// In sv, this message translates to:
  /// **'Engelska'**
  String get english;

  /// No description provided for @home.
  ///
  /// In sv, this message translates to:
  /// **'Hem'**
  String get home;

  /// No description provided for @news.
  ///
  /// In sv, this message translates to:
  /// **'Nyheter'**
  String get news;

  /// No description provided for @calendar.
  ///
  /// In sv, this message translates to:
  /// **'Kalender'**
  String get calendar;

  /// No description provided for @notifications.
  ///
  /// In sv, this message translates to:
  /// **'Notiser'**
  String get notifications;

  /// No description provided for @other.
  ///
  /// In sv, this message translates to:
  /// **'Övrigt'**
  String get other;

  /// No description provided for @introduction.
  ///
  /// In sv, this message translates to:
  /// **'Nollning'**
  String get introduction;

  /// No description provided for @loginRequiredField.
  ///
  /// In sv, this message translates to:
  /// **'Obligatoriskt fält'**
  String get loginRequiredField;

  /// No description provided for @loginEmail.
  ///
  /// In sv, this message translates to:
  /// **'Email'**
  String get loginEmail;

  /// No description provided for @loginPassword.
  ///
  /// In sv, this message translates to:
  /// **'Lösenord'**
  String get loginPassword;

  /// No description provided for @loginForgotPassword.
  ///
  /// In sv, this message translates to:
  /// **'Glömt mitt lösenord'**
  String get loginForgotPassword;

  /// No description provided for @loginLogIn.
  ///
  /// In sv, this message translates to:
  /// **'Logga in'**
  String get loginLogIn;

  /// No description provided for @resetInstruction.
  ///
  /// In sv, this message translates to:
  /// **'Skriv din email för att återställa ditt lösenord'**
  String get resetInstruction;

  /// No description provided for @resetEmail.
  ///
  /// In sv, this message translates to:
  /// **'Email'**
  String get resetEmail;

  /// No description provided for @resetSubmit.
  ///
  /// In sv, this message translates to:
  /// **'Skicka'**
  String get resetSubmit;

  /// No description provided for @resetValidate.
  ///
  /// In sv, this message translates to:
  /// **'Skriv en email'**
  String get resetValidate;

  /// No description provided for @resetDone.
  ///
  /// In sv, this message translates to:
  /// **'Ditt lösenord has återställts. Ett mail har skickats med ditt nya lösenord.'**
  String get resetDone;

  /// No description provided for @eventPriority.
  ///
  /// In sv, this message translates to:
  /// **'Prioritering:'**
  String get eventPriority;

  /// No description provided for @eventOther.
  ///
  /// In sv, this message translates to:
  /// **'Övrigt'**
  String get eventOther;

  /// No description provided for @eventChooseGroup.
  ///
  /// In sv, this message translates to:
  /// **'Välj grupp:'**
  String get eventChooseGroup;

  /// No description provided for @eventOtherDifferent.
  ///
  /// In sv, this message translates to:
  /// **'Annan'**
  String get eventOtherDifferent;

  /// No description provided for @eventCustomGroupName.
  ///
  /// In sv, this message translates to:
  /// **'Skriv eget gruppnamn'**
  String get eventCustomGroupName;

  /// No description provided for @eventNotSignedUp.
  ///
  /// In sv, this message translates to:
  /// **'Du var inte anmäld'**
  String get eventNotSignedUp;

  /// No description provided for @eventNoSpot.
  ///
  /// In sv, this message translates to:
  /// **'Du fick tyvärr inte plats till eventet.'**
  String get eventNoSpot;

  /// No description provided for @eventGotSpot.
  ///
  /// In sv, this message translates to:
  /// **'Du har fått plats!'**
  String get eventGotSpot;

  /// No description provided for @eventLotterySpot.
  ///
  /// In sv, this message translates to:
  /// **'Din anmälan är mottagen.'**
  String get eventLotterySpot;

  /// No description provided for @eventSignUp.
  ///
  /// In sv, this message translates to:
  /// **'Anmälan'**
  String get eventSignUp;

  /// No description provided for @eventNbrSignUps.
  ///
  /// In sv, this message translates to:
  /// **' Antal anmälda: '**
  String get eventNbrSignUps;

  /// No description provided for @eventNbrSpots.
  ///
  /// In sv, this message translates to:
  /// **' Antal platser: '**
  String get eventNbrSpots;

  /// No description provided for @eventSignUpOpens.
  ///
  /// In sv, this message translates to:
  /// **' Anmälan öppnar: '**
  String get eventSignUpOpens;

  /// No description provided for @eventSignUpCloses.
  ///
  /// In sv, this message translates to:
  /// **' Anmälan stänger: '**
  String get eventSignUpCloses;

  /// No description provided for @eventTechnicalDifficulties.
  ///
  /// In sv, this message translates to:
  /// **' Vid tekniska problem med anmälan, kontakta '**
  String get eventTechnicalDifficulties;

  /// No description provided for @eventWebMasters.
  ///
  /// In sv, this message translates to:
  /// **'spindelmännen'**
  String get eventWebMasters;

  /// No description provided for @eventFoodPreferences.
  ///
  /// In sv, this message translates to:
  /// **'Matpreferenser:'**
  String get eventFoodPreferences;

  /// No description provided for @eventSendSignup.
  ///
  /// In sv, this message translates to:
  /// **'Skicka Anmälan'**
  String get eventSendSignup;

  /// No description provided for @eventFoodPrefInfo.
  ///
  /// In sv, this message translates to:
  /// **'Du kan ändra dessa i Inställningar > matpreferenser'**
  String get eventFoodPrefInfo;

  /// No description provided for @eventLinkToFoodPrefs.
  ///
  /// In sv, this message translates to:
  /// **'Genväg till inställningarna'**
  String get eventLinkToFoodPrefs;

  /// No description provided for @eventDesignup.
  ///
  /// In sv, this message translates to:
  /// **'Avanmäl'**
  String get eventDesignup;

  /// No description provided for @eventConfirmCancel.
  ///
  /// In sv, this message translates to:
  /// **'Är du säker på att du vill avanmäla dig?'**
  String get eventConfirmCancel;

  /// No description provided for @eventCancel.
  ///
  /// In sv, this message translates to:
  /// **'AVBRYT'**
  String get eventCancel;

  /// No description provided for @eventConfirmRemoveSignUp.
  ///
  /// In sv, this message translates to:
  /// **'AVANMÄL MIG'**
  String get eventConfirmRemoveSignUp;

  /// No description provided for @eventGroup.
  ///
  /// In sv, this message translates to:
  /// **'Grupp:'**
  String get eventGroup;

  /// No description provided for @eventPriority2.
  ///
  /// In sv, this message translates to:
  /// **'Prioritet: '**
  String get eventPriority2;

  /// No description provided for @eventTitle.
  ///
  /// In sv, this message translates to:
  /// **'Evenemang'**
  String get eventTitle;

  /// No description provided for @eventNoTitle.
  ///
  /// In sv, this message translates to:
  /// **'ingen titel'**
  String get eventNoTitle;

  /// No description provided for @eventNoDescription.
  ///
  /// In sv, this message translates to:
  /// **'ingen beskrivning'**
  String get eventNoDescription;

  /// No description provided for @eventDressCode.
  ///
  /// In sv, this message translates to:
  /// **'Klädkod: '**
  String get eventDressCode;

  /// No description provided for @eventPrice.
  ///
  /// In sv, this message translates to:
  /// **'Pris: '**
  String get eventPrice;

  /// No description provided for @eventCostsMoney.
  ///
  /// In sv, this message translates to:
  /// **'  Kostar pengar'**
  String get eventCostsMoney;

  /// No description provided for @eventFoodServed.
  ///
  /// In sv, this message translates to:
  /// **'  Mat serveras'**
  String get eventFoodServed;

  /// No description provided for @eventAlcoholServed.
  ///
  /// In sv, this message translates to:
  /// **'Alkohol serveras'**
  String get eventAlcoholServed;

  /// No description provided for @eventDrinkPackage.
  ///
  /// In sv, this message translates to:
  /// **'Vilken typ av alkhoholpaket vill du ha?'**
  String get eventDrinkPackage;

  /// No description provided for @eventYes.
  ///
  /// In sv, this message translates to:
  /// **'Ja'**
  String get eventYes;

  /// No description provided for @eventNo.
  ///
  /// In sv, this message translates to:
  /// **'Nej'**
  String get eventNo;

  /// No description provided for @eventHasSignup.
  ///
  /// In sv, this message translates to:
  /// **'  Kräver anmälan'**
  String get eventHasSignup;

  /// No description provided for @eventInCaseOfQuestions.
  ///
  /// In sv, this message translates to:
  /// **'Vid frågor om eventet, kontakta eventansvarig:'**
  String get eventInCaseOfQuestions;

  /// No description provided for @eventAlcohol.
  ///
  /// In sv, this message translates to:
  /// **'Alkohol'**
  String get eventAlcohol;

  /// No description provided for @eventAlcoholMayAppear.
  ///
  /// In sv, this message translates to:
  /// **'Alkohol kan förekomma'**
  String get eventAlcoholMayAppear;

  /// No description provided for @eventAlcoholFree.
  ///
  /// In sv, this message translates to:
  /// **'Alkoholfritt'**
  String get eventAlcoholFree;

  /// No description provided for @eventNoAlcohol.
  ///
  /// In sv, this message translates to:
  /// **'Inget'**
  String get eventNoAlcohol;

  /// No description provided for @settingsSettings.
  ///
  /// In sv, this message translates to:
  /// **'Inställningar'**
  String get settingsSettings;

  /// No description provided for @settingsSave.
  ///
  /// In sv, this message translates to:
  /// **'Spara'**
  String get settingsSave;

  /// No description provided for @settingsProgramme.
  ///
  /// In sv, this message translates to:
  /// **'Program'**
  String get settingsProgramme;

  /// No description provided for @settingsStartYear.
  ///
  /// In sv, this message translates to:
  /// **'Startår'**
  String get settingsStartYear;

  /// No description provided for @settingsFirstName.
  ///
  /// In sv, this message translates to:
  /// **'Förnamn'**
  String get settingsFirstName;

  /// No description provided for @settingsLastName.
  ///
  /// In sv, this message translates to:
  /// **'Efternamn'**
  String get settingsLastName;

  /// No description provided for @settingsParagraph.
  ///
  /// In sv, this message translates to:
  /// **'Nedstående fält används endast för\nsektionsval, bilbokning samt arbete i Hilbert Café.\nKan ses av styrelse, administratörer samt ansvariga för val, bokning eller caféet'**
  String get settingsParagraph;

  /// No description provided for @settingsPhoneNumber.
  ///
  /// In sv, this message translates to:
  /// **'Telefonnummer'**
  String get settingsPhoneNumber;

  /// No description provided for @settingsShowPhoneNumber.
  ///
  /// In sv, this message translates to:
  /// **'Visa tel. för gruppmedlemmar'**
  String get settingsShowPhoneNumber;

  /// No description provided for @settingsFoodPrefs.
  ///
  /// In sv, this message translates to:
  /// **'Matpreferenser'**
  String get settingsFoodPrefs;

  /// No description provided for @settingsOther.
  ///
  /// In sv, this message translates to:
  /// **'Annat'**
  String get settingsOther;

  /// No description provided for @settingsFoodPrefsPrivacy.
  ///
  /// In sv, this message translates to:
  /// **'Matpreferenser kan endast ses av de som arrangerar\nevenmang som du anmält dig till.'**
  String get settingsFoodPrefsPrivacy;

  /// No description provided for @settingsNotificationsSignUp.
  ///
  /// In sv, this message translates to:
  /// **'Notiser för eventanmälan'**
  String get settingsNotificationsSignUp;

  /// No description provided for @settingsNotificationsMessage.
  ///
  /// In sv, this message translates to:
  /// **'Notiser för meddelande'**
  String get settingsNotificationsMessage;

  /// No description provided for @settingsNotificationsSignUpClosing.
  ///
  /// In sv, this message translates to:
  /// **'Notiser före eventanmälan stänger'**
  String get settingsNotificationsSignUpClosing;

  /// No description provided for @settingsNotificationsSignUpOpening.
  ///
  /// In sv, this message translates to:
  /// **'Notiser när eventanmälan öppnar'**
  String get settingsNotificationsSignUpOpening;

  /// No description provided for @settingsMemberSince.
  ///
  /// In sv, this message translates to:
  /// **'Medlem sedan'**
  String get settingsMemberSince;

  /// No description provided for @settingsOtherFoodPrefs.
  ///
  /// In sv, this message translates to:
  /// **'Andra matpreferenser/allergier'**
  String get settingsOtherFoodPrefs;

  /// No description provided for @settingsSaving.
  ///
  /// In sv, this message translates to:
  /// **'Sparar'**
  String get settingsSaving;

  /// No description provided for @settingsWarning.
  ///
  /// In sv, this message translates to:
  /// **'Varning'**
  String get settingsWarning;

  /// No description provided for @settingsWarningText.
  ///
  /// In sv, this message translates to:
  /// **'Ändringarna kunde inte sparas ):\nKolla din täckning och de obligatiska fälten.'**
  String get settingsWarningText;

  /// No description provided for @settingsUnsaved.
  ///
  /// In sv, this message translates to:
  /// **'Osparade ändringar'**
  String get settingsUnsaved;

  /// No description provided for @settingsUnsavedText.
  ///
  /// In sv, this message translates to:
  /// **'Du har osparade ändringar.\nVill du spara eller slänga dessa?'**
  String get settingsUnsavedText;

  /// No description provided for @settingsDiscard.
  ///
  /// In sv, this message translates to:
  /// **'Släng'**
  String get settingsDiscard;

  /// No description provided for @themeSettingsTitle.
  ///
  /// In sv, this message translates to:
  /// **'Tema'**
  String get themeSettingsTitle;

  /// No description provided for @themeSettingsHelp.
  ///
  /// In sv, this message translates to:
  /// **'Har du hittat en färgkombination som är osmaklig eller svår att tyda i någon av temana? Kontakta spindlarna på kontaktsidan och beskriv vad som ser fel ut och hur du kom dit.'**
  String get themeSettingsHelp;

  /// No description provided for @themeSettingsTheme1.
  ///
  /// In sv, this message translates to:
  /// **'F-Orange (Original)'**
  String get themeSettingsTheme1;

  /// No description provided for @themeSettingsTheme2.
  ///
  /// In sv, this message translates to:
  /// **'F-Orange (Mörk)'**
  String get themeSettingsTheme2;

  /// No description provided for @themeSettingsTheme3.
  ///
  /// In sv, this message translates to:
  /// **'n-Grönt'**
  String get themeSettingsTheme3;

  /// No description provided for @themeSettingsTheme4.
  ///
  /// In sv, this message translates to:
  /// **'pi-Grått (Experimentell)'**
  String get themeSettingsTheme4;

  /// No description provided for @themeSettingsTheme5.
  ///
  /// In sv, this message translates to:
  /// **'O-Brunt (Experimentell)'**
  String get themeSettingsTheme5;

  /// No description provided for @themeSettingsTheme6.
  ///
  /// In sv, this message translates to:
  /// **'Rosa (absolut inte någon sektion) (Experimentell)'**
  String get themeSettingsTheme6;

  /// No description provided for @themeSettingsTheme7.
  ///
  /// In sv, this message translates to:
  /// **'V-Blått (Experimentell)'**
  String get themeSettingsTheme7;

  /// No description provided for @themeSettingsWarning.
  ///
  /// In sv, this message translates to:
  /// **'Varning!'**
  String get themeSettingsWarning;

  /// No description provided for @themeSettingsWarningTextF.
  ///
  /// In sv, this message translates to:
  /// **'Grafisk stabilitet KAN garanteras.'**
  String get themeSettingsWarningTextF;

  /// No description provided for @themeSettingsWarningTextFdark.
  ///
  /// In sv, this message translates to:
  /// **'Grafisk stabilitet KAN garanteras.'**
  String get themeSettingsWarningTextFdark;

  /// No description provided for @themeSettingsWarningTextN.
  ///
  /// In sv, this message translates to:
  /// **'Grafisk stabilitet KAN garanteras.'**
  String get themeSettingsWarningTextN;

  /// No description provided for @themeSettingsWarningTextPi.
  ///
  /// In sv, this message translates to:
  /// **'Grafisk stabilitet kan ej garanteras.'**
  String get themeSettingsWarningTextPi;

  /// No description provided for @themeSettingsWarningTextO.
  ///
  /// In sv, this message translates to:
  /// **'Bytte till O-sektionens tema #ickesponsrat. Grafisk stabilitet kan ej garanteras.'**
  String get themeSettingsWarningTextO;

  /// No description provided for @themeSettingsWarningTextD.
  ///
  /// In sv, this message translates to:
  /// **'Du är i färd med att byta från ett mycket fint eller i alla fall helt okej tema till ett baserat på den oheliga färgen råsa. Hilbert älg har blivit ledsen, men är alltid redo att välkomna dig tillbaka till den ljusa sidan. Grafisk stabilitet kan ej garanteras.'**
  String get themeSettingsWarningTextD;

  /// No description provided for @themeSettingsWarningTextV.
  ///
  /// In sv, this message translates to:
  /// **'Bytte till ett tema baserat på V-sektionens färger (ej officiellt). Grafisk stabilitet kan ej garanteras.'**
  String get themeSettingsWarningTextV;

  /// No description provided for @vegetarian.
  ///
  /// In sv, this message translates to:
  /// **'Vegetarian'**
  String get vegetarian;

  /// No description provided for @vegan.
  ///
  /// In sv, this message translates to:
  /// **'Vegan'**
  String get vegan;

  /// No description provided for @pescetarian.
  ///
  /// In sv, this message translates to:
  /// **'Pescetarian'**
  String get pescetarian;

  /// No description provided for @milk.
  ///
  /// In sv, this message translates to:
  /// **'Mjölkallergi'**
  String get milk;

  /// No description provided for @gluten.
  ///
  /// In sv, this message translates to:
  /// **'Gluten'**
  String get gluten;

  /// No description provided for @physics.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Fysik'**
  String get physics;

  /// No description provided for @mathematics.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Matematik'**
  String get mathematics;

  /// No description provided for @nano.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Nanovetenskap'**
  String get nano;

  /// No description provided for @unknown.
  ///
  /// In sv, this message translates to:
  /// **'Oklart'**
  String get unknown;

  /// No description provided for @songbookSearch.
  ///
  /// In sv, this message translates to:
  /// **'Sök'**
  String get songbookSearch;

  /// No description provided for @songbookSongbook.
  ///
  /// In sv, this message translates to:
  /// **'Sångbok'**
  String get songbookSongbook;

  /// No description provided for @songbookNoMatches.
  ///
  /// In sv, this message translates to:
  /// **'Finns inga matchningar :^('**
  String get songbookNoMatches;

  /// No description provided for @songbookMelody.
  ///
  /// In sv, this message translates to:
  /// **'Melodi'**
  String get songbookMelody;

  /// No description provided for @songbookAuthor.
  ///
  /// In sv, this message translates to:
  /// **'Författare'**
  String get songbookAuthor;

  /// No description provided for @otherSongbook.
  ///
  /// In sv, this message translates to:
  /// **'Sångbok'**
  String get otherSongbook;

  /// No description provided for @otherGallery.
  ///
  /// In sv, this message translates to:
  /// **'Bildgalleri'**
  String get otherGallery;

  /// No description provided for @otherCafe.
  ///
  /// In sv, this message translates to:
  /// **'Hilbert Café'**
  String get otherCafe;

  /// No description provided for @otherAboutGuild.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen'**
  String get otherAboutGuild;

  /// No description provided for @otherFap.
  ///
  /// In sv, this message translates to:
  /// **'F-appen'**
  String get otherFap;

  /// No description provided for @otherAccount.
  ///
  /// In sv, this message translates to:
  /// **'Konto'**
  String get otherAccount;

  /// No description provided for @otherLanguage.
  ///
  /// In sv, this message translates to:
  /// **'Språk'**
  String get otherLanguage;

  /// No description provided for @otherTheme.
  ///
  /// In sv, this message translates to:
  /// **'Tema'**
  String get otherTheme;

  /// No description provided for @otherContact.
  ///
  /// In sv, this message translates to:
  /// **'Kontakt'**
  String get otherContact;

  /// No description provided for @otherAnon.
  ///
  /// In sv, this message translates to:
  /// **'Anonym kontaktsida'**
  String get otherAnon;

  /// No description provided for @otherAbout.
  ///
  /// In sv, this message translates to:
  /// **'Om'**
  String get otherAbout;

  /// No description provided for @otherSettings.
  ///
  /// In sv, this message translates to:
  /// **'Inställningar'**
  String get otherSettings;

  /// No description provided for @otherLogOut.
  ///
  /// In sv, this message translates to:
  /// **'Logga ut'**
  String get otherLogOut;

  /// No description provided for @otherLogOutConfirm.
  ///
  /// In sv, this message translates to:
  /// **'Är du säker på att du vill logga ut?'**
  String get otherLogOutConfirm;

  /// No description provided for @otherCancel.
  ///
  /// In sv, this message translates to:
  /// **'Avbryt'**
  String get otherCancel;

  /// No description provided for @notificationsSent.
  ///
  /// In sv, this message translates to:
  /// **'Skickades '**
  String get notificationsSent;

  /// No description provided for @notificationsNone.
  ///
  /// In sv, this message translates to:
  /// **'Inga notiser tillgängliga'**
  String get notificationsNone;

  /// No description provided for @contactContact.
  ///
  /// In sv, this message translates to:
  /// **'Kontakt'**
  String get contactContact;

  /// No description provided for @contactPerson.
  ///
  /// In sv, this message translates to:
  /// **'Kontakt till postinnehavare'**
  String get contactPerson;

  /// No description provided for @contactDescription.
  ///
  /// In sv, this message translates to:
  /// **'Beskrivning'**
  String get contactDescription;

  /// No description provided for @contactInfo.
  ///
  /// In sv, this message translates to:
  /// **'Kontaktinformation'**
  String get contactInfo;

  /// No description provided for @contactHeldBy.
  ///
  /// In sv, this message translates to:
  /// **'Posten innehavs av: '**
  String get contactHeldBy;

  /// No description provided for @contactMessage.
  ///
  /// In sv, this message translates to:
  /// **'Meddelande'**
  String get contactMessage;

  /// No description provided for @contactWriteMessage.
  ///
  /// In sv, this message translates to:
  /// **'Skriv ditt meddelande här'**
  String get contactWriteMessage;

  /// No description provided for @contactSend.
  ///
  /// In sv, this message translates to:
  /// **'Skicka'**
  String get contactSend;

  /// No description provided for @contactHasBeenSent.
  ///
  /// In sv, this message translates to:
  /// **'Ditt meddelande har skickas! :D'**
  String get contactHasBeenSent;

  /// No description provided for @contactHasNotBeenSent.
  ///
  /// In sv, this message translates to:
  /// **'Ditt meddelande kunde inte skickas ):\nKolla om du har täckning och försök igen.'**
  String get contactHasNotBeenSent;

  /// No description provided for @contactEmpty.
  ///
  /// In sv, this message translates to:
  /// **'Ditt meddelande är tomt. Inget har skickats.'**
  String get contactEmpty;

  /// No description provided for @albumMoreInfo.
  ///
  /// In sv, this message translates to:
  /// **'Mer info'**
  String get albumMoreInfo;

  /// No description provided for @albumPhotographers.
  ///
  /// In sv, this message translates to:
  /// **'Fotografer: '**
  String get albumPhotographers;

  /// No description provided for @albumNoPhotographers.
  ///
  /// In sv, this message translates to:
  /// **'Inga fotografer'**
  String get albumNoPhotographers;

  /// No description provided for @albumSelect.
  ///
  /// In sv, this message translates to:
  /// **'Markera'**
  String get albumSelect;

  /// No description provided for @albumCancel.
  ///
  /// In sv, this message translates to:
  /// **'Avbryt'**
  String get albumCancel;

  /// No description provided for @albumSelectAll.
  ///
  /// In sv, this message translates to:
  /// **'Markera alla'**
  String get albumSelectAll;

  /// No description provided for @albumDeselectAll.
  ///
  /// In sv, this message translates to:
  /// **'Avmarkera alla'**
  String get albumDeselectAll;

  /// No description provided for @albumImageSelected.
  ///
  /// In sv, this message translates to:
  /// **'bild markerad'**
  String get albumImageSelected;

  /// No description provided for @albumImagesSelected.
  ///
  /// In sv, this message translates to:
  /// **'bilder markerade'**
  String get albumImagesSelected;

  /// No description provided for @galleryTitle.
  ///
  /// In sv, this message translates to:
  /// **'Bildgalleri'**
  String get galleryTitle;

  /// No description provided for @galleryOf.
  ///
  /// In sv, this message translates to:
  /// **'av'**
  String get galleryOf;

  /// No description provided for @galleryImageDownloaded.
  ///
  /// In sv, this message translates to:
  /// **'Bild sparad'**
  String get galleryImageDownloaded;

  /// No description provided for @galleryImagesDownloaded.
  ///
  /// In sv, this message translates to:
  /// **'Bilder sparade'**
  String get galleryImagesDownloaded;

  /// No description provided for @galleryImageDownloadError.
  ///
  /// In sv, this message translates to:
  /// **'Ett fel uppstod vid nedladdning'**
  String get galleryImageDownloadError;

  /// No description provided for @homeNoNews.
  ///
  /// In sv, this message translates to:
  /// **'Inga nyheter tillgänliga'**
  String get homeNoNews;

  /// No description provided for @homeTitleUntranslated.
  ///
  /// In sv, this message translates to:
  /// **'Det finns ingen översättning tillgänglig för detta inlägget\n:('**
  String get homeTitleUntranslated;

  /// No description provided for @newsNotAvailableOne.
  ///
  /// In sv, this message translates to:
  /// **'Detta inlägget är inte tillgängligt på svenska. Överväg att kontakta '**
  String get newsNotAvailableOne;

  /// No description provided for @newsNotAvailableTwo.
  ///
  /// In sv, this message translates to:
  /// **' som skapade detta inlägget och påminn dem att översätta :) '**
  String get newsNotAvailableTwo;

  /// No description provided for @groupWriteProtected.
  ///
  /// In sv, this message translates to:
  /// **'Chatten är skrivskyddad'**
  String get groupWriteProtected;

  /// No description provided for @groupWhatToDo.
  ///
  /// In sv, this message translates to:
  /// **'Vad vill du göra med meddelandet?'**
  String get groupWhatToDo;

  /// No description provided for @groupEdit.
  ///
  /// In sv, this message translates to:
  /// **'Redigera'**
  String get groupEdit;

  /// No description provided for @groupSave.
  ///
  /// In sv, this message translates to:
  /// **'Spara'**
  String get groupSave;

  /// No description provided for @groupRemove.
  ///
  /// In sv, this message translates to:
  /// **'Ta bort'**
  String get groupRemove;

  /// No description provided for @messagesMessages.
  ///
  /// In sv, this message translates to:
  /// **'Meddelanden'**
  String get messagesMessages;

  /// No description provided for @nolleguide.
  ///
  /// In sv, this message translates to:
  /// **'NOLLEGUIDEN'**
  String get nolleguide;

  /// No description provided for @nolleguideWeAtFsek.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen'**
  String get nolleguideWeAtFsek;

  /// No description provided for @nolleguideEtiquette.
  ///
  /// In sv, this message translates to:
  /// **'Allt du behöver veta'**
  String get nolleguideEtiquette;

  /// No description provided for @nolleguideWordlist.
  ///
  /// In sv, this message translates to:
  /// **'Ordlista'**
  String get nolleguideWordlist;

  /// No description provided for @introductionLocked.
  ///
  /// In sv, this message translates to:
  /// **'Låst'**
  String get introductionLocked;

  /// No description provided for @introductionInterrupt.
  ///
  /// In sv, this message translates to:
  /// **'Avbryt/\nTa bort'**
  String get introductionInterrupt;

  /// No description provided for @introductionApprove.
  ///
  /// In sv, this message translates to:
  /// **'Godkänn'**
  String get introductionApprove;

  /// No description provided for @introductionError.
  ///
  /// In sv, this message translates to:
  /// **'Oj, nåt gick fel. Försök igen senare.'**
  String get introductionError;

  /// No description provided for @introductionPoints.
  ///
  /// In sv, this message translates to:
  /// **'Poäng?'**
  String get introductionPoints;

  /// No description provided for @introductionInterrupt2.
  ///
  /// In sv, this message translates to:
  /// **'Abryt'**
  String get introductionInterrupt2;

  /// No description provided for @introductionDestroyMission.
  ///
  /// In sv, this message translates to:
  /// **'Säkert på att du vill förinta uppdraget?'**
  String get introductionDestroyMission;

  /// No description provided for @introductionInterrupt3.
  ///
  /// In sv, this message translates to:
  /// **'AVBRYT'**
  String get introductionInterrupt3;

  /// No description provided for @introductionDestroy.
  ///
  /// In sv, this message translates to:
  /// **'FÖRINTA'**
  String get introductionDestroy;

  /// No description provided for @introductionMissions.
  ///
  /// In sv, this message translates to:
  /// **'UPPDRAG'**
  String get introductionMissions;

  /// No description provided for @introductionMyGroup.
  ///
  /// In sv, this message translates to:
  /// **'MIN GRUPP'**
  String get introductionMyGroup;

  /// No description provided for @introductionAdventureMissions.
  ///
  /// In sv, this message translates to:
  /// **'Äventyrsuppdrag'**
  String get introductionAdventureMissions;

  /// No description provided for @introductionGuildChants.
  ///
  /// In sv, this message translates to:
  /// **'Sektionsramsor'**
  String get introductionGuildChants;

  /// No description provided for @introductionSearch.
  ///
  /// In sv, this message translates to:
  /// **'Sök'**
  String get introductionSearch;

  /// No description provided for @introductionNoMatches.
  ///
  /// In sv, this message translates to:
  /// **'Finns inga matchningar :^('**
  String get introductionNoMatches;

  /// No description provided for @introductionEntireSongBook.
  ///
  /// In sv, this message translates to:
  /// **'Hela Sångboken'**
  String get introductionEntireSongBook;

  /// No description provided for @introductionCompletedMissions.
  ///
  /// In sv, this message translates to:
  /// **'avklarade uppdrag'**
  String get introductionCompletedMissions;

  /// No description provided for @introductionPlacement.
  ///
  /// In sv, this message translates to:
  /// **'Placering'**
  String get introductionPlacement;

  /// No description provided for @introductionGroupName.
  ///
  /// In sv, this message translates to:
  /// **'Gruppnamn'**
  String get introductionGroupName;

  /// No description provided for @introductionPoints2.
  ///
  /// In sv, this message translates to:
  /// **'Poäng'**
  String get introductionPoints2;

  /// No description provided for @introductionMaxPoints.
  ///
  /// In sv, this message translates to:
  /// **'Maxpoäng'**
  String get introductionMaxPoints;

  /// No description provided for @introductionCompleted.
  ///
  /// In sv, this message translates to:
  /// **'Avklarat'**
  String get introductionCompleted;

  /// No description provided for @introductionPendingApproval.
  ///
  /// In sv, this message translates to:
  /// **'Väntar på godkännande'**
  String get introductionPendingApproval;

  /// No description provided for @introductionNotCompleted.
  ///
  /// In sv, this message translates to:
  /// **'Ej avklarat'**
  String get introductionNotCompleted;

  /// No description provided for @introductionWeek.
  ///
  /// In sv, this message translates to:
  /// **'Vecka'**
  String get introductionWeek;

  /// No description provided for @introductionMap.
  ///
  /// In sv, this message translates to:
  /// **'Karta över LTH'**
  String get introductionMap;

  /// No description provided for @introductionMapClose.
  ///
  /// In sv, this message translates to:
  /// **'Stäng'**
  String get introductionMapClose;

  /// No description provided for @cafeShiftSignup.
  ///
  /// In sv, this message translates to:
  /// **'Du är nu uppskriven på passet!'**
  String get cafeShiftSignup;

  /// No description provided for @cafeShiftSignupText.
  ///
  /// In sv, this message translates to:
  /// **'Tack för att du vill jobba i caféet! Kom ihåg att avanmäla dig om du får förhinder.'**
  String get cafeShiftSignupText;

  /// No description provided for @cafeShiftFail.
  ///
  /// In sv, this message translates to:
  /// **'Något gick fel!'**
  String get cafeShiftFail;

  /// No description provided for @cafeShiftFailSignupText.
  ///
  /// In sv, this message translates to:
  /// **'Du kanske redan är anmäld till ett pass vid samma tid'**
  String get cafeShiftFailSignupText;

  /// No description provided for @cafeShiftSuccessUnsign.
  ///
  /// In sv, this message translates to:
  /// **'Du är nu avanmäld från passet!'**
  String get cafeShiftSuccessUnsign;

  /// No description provided for @cafeShiftSuccessUnsignText.
  ///
  /// In sv, this message translates to:
  /// **'Tipsa en kompis om att anmäla sig på passet istället!'**
  String get cafeShiftSuccessUnsignText;

  /// No description provided for @cafeShiftFailUnsignText.
  ///
  /// In sv, this message translates to:
  /// **'Det gick inte att avanmäla dig från passet.'**
  String get cafeShiftFailUnsignText;

  /// No description provided for @cafeShiftCafeShift.
  ///
  /// In sv, this message translates to:
  /// **'Cafépass'**
  String get cafeShiftCafeShift;

  /// No description provided for @cafeShiftSignedUp.
  ///
  /// In sv, this message translates to:
  /// **'Du är anmäld '**
  String get cafeShiftSignedUp;

  /// No description provided for @cafeShiftRemoveSignup.
  ///
  /// In sv, this message translates to:
  /// **'Avanmäl mig :(('**
  String get cafeShiftRemoveSignup;

  /// No description provided for @cafeShiftSignup2.
  ///
  /// In sv, this message translates to:
  /// **'Anmälan '**
  String get cafeShiftSignup2;

  /// No description provided for @cafeShiftIsSignedUp.
  ///
  /// In sv, this message translates to:
  /// **'är anmäld'**
  String get cafeShiftIsSignedUp;

  /// No description provided for @cafeShiftSignMeUp.
  ///
  /// In sv, this message translates to:
  /// **'Anmäl mig :))'**
  String get cafeShiftSignMeUp;

  /// No description provided for @cafeShiftForShift.
  ///
  /// In sv, this message translates to:
  /// **'till pass'**
  String get cafeShiftForShift;

  /// No description provided for @cafeShiftClock.
  ///
  /// In sv, this message translates to:
  /// **' kl '**
  String get cafeShiftClock;

  /// No description provided for @cafeShiftShift.
  ///
  /// In sv, this message translates to:
  /// **' Ledigt pass'**
  String get cafeShiftShift;

  /// No description provided for @mannersEtiquette.
  ///
  /// In sv, this message translates to:
  /// **'STUDENTLIVET'**
  String get mannersEtiquette;

  /// No description provided for @aboutGuildTitle.
  ///
  /// In sv, this message translates to:
  /// **'Om F-sektionen'**
  String get aboutGuildTitle;

  /// No description provided for @aboutGuildGuild.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen'**
  String get aboutGuildGuild;

  /// No description provided for @aboutGuildOne.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen inom TLTH är en ideell förening för studenter som läser något av civilingenjörsprogrammen '**
  String get aboutGuildOne;

  /// No description provided for @aboutGuildTwo.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Fysik, Teknisk Matematik eller Teknisk Nanovetenskap och har till ändamål att främja kamratskap '**
  String get aboutGuildTwo;

  /// No description provided for @aboutGuildThree.
  ///
  /// In sv, this message translates to:
  /// **'bland medlemmarna och tillvarata medlemmarnas gemensamma intressen.'**
  String get aboutGuildThree;

  /// No description provided for @aboutGuildFour.
  ///
  /// In sv, this message translates to:
  /// **'Sektionen är belägen i Mattehuset och här hittar du bland annat uppehållsrum, mikrovågsugnar och gött häng. '**
  String get aboutGuildFour;

  /// No description provided for @aboutGuildFive.
  ///
  /// In sv, this message translates to:
  /// **'I Mattehuset finns även Hilbert Café som vi driver, och här kan du bland annat köpa gott kaffe, baguetter och sallader.'**
  String get aboutGuildFive;

  /// No description provided for @aboutGuildSix.
  ///
  /// In sv, this message translates to:
  /// **'F-sektionen har en mängd olika utskott, som var och ett leds av en utskottsordförande.'**
  String get aboutGuildSix;

  /// No description provided for @aboutGuildSeven.
  ///
  /// In sv, this message translates to:
  /// **'De flesta utskottsordföranden sitter med i sektionens nämnd, som är sektionens operativa del. '**
  String get aboutGuildSeven;

  /// No description provided for @aboutGuildEight.
  ///
  /// In sv, this message translates to:
  /// **'Styrelsen är sektionens beslutande del, och den tar beslut i frågor som rör hela sektionen centralt.'**
  String get aboutGuildEight;

  /// No description provided for @aboutGuildNine.
  ///
  /// In sv, this message translates to:
  /// **'Som medlem kan du välja att vara väldigt aktiv och engagerad, lite lagom eller kanske bara delta på '**
  String get aboutGuildNine;

  /// No description provided for @aboutGuildTen.
  ///
  /// In sv, this message translates to:
  /// **'något enstaka event. Om du har några frågor är det bara att höra av sig, se \'Kontakt\' här i appen '**
  String get aboutGuildTen;

  /// No description provided for @aboutGuildEleven.
  ///
  /// In sv, this message translates to:
  /// **'eller på vår hemsida. Annars kan du alltid svänga förbi styrelserummet som ligger i den södra delen av '**
  String get aboutGuildEleven;

  /// No description provided for @aboutGuildTwelve.
  ///
  /// In sv, this message translates to:
  /// **'Hilbertkorridoren; där hittar du nästan alltid någon sektionsaktiv. Vi hoppas att du ska trivas på sektionen!'**
  String get aboutGuildTwelve;

  /// No description provided for @fapSuper.
  ///
  /// In sv, this message translates to:
  /// **'su-perman'**
  String get fapSuper;

  /// No description provided for @fapSpider.
  ///
  /// In sv, this message translates to:
  /// **'Spindelman'**
  String get fapSpider;

  /// No description provided for @fapSpiderMaster.
  ///
  /// In sv, this message translates to:
  /// **'Spindelförman'**
  String get fapSpiderMaster;

  /// No description provided for @fapAbout.
  ///
  /// In sv, this message translates to:
  /// **'Om F-appen'**
  String get fapAbout;

  /// No description provided for @fapFap.
  ///
  /// In sv, this message translates to:
  /// **'F-appen'**
  String get fapFap;

  /// No description provided for @fapVersion.
  ///
  /// In sv, this message translates to:
  /// **'Version: ja'**
  String get fapVersion;

  /// No description provided for @fapPower.
  ///
  /// In sv, this message translates to:
  /// **'Powered by kaffe, su-permanstårar och Flutter'**
  String get fapPower;

  /// No description provided for @fapConstructed.
  ///
  /// In sv, this message translates to:
  /// **'Knackad av F-sektionens su-per och spindelmän:'**
  String get fapConstructed;

  /// No description provided for @fapInspired.
  ///
  /// In sv, this message translates to:
  /// **'Vad inspirerade nätet under '**
  String get fapInspired;

  /// No description provided for @fapDev.
  ///
  /// In sv, this message translates to:
  /// **'utvecklingen'**
  String get fapDev;

  /// No description provided for @guildMeetingTitle.
  ///
  /// In sv, this message translates to:
  /// **'Om sektionsmötet'**
  String get guildMeetingTitle;

  /// No description provided for @guildMeetingCurr.
  ///
  /// In sv, this message translates to:
  /// **'Höstterminsmötet 2024'**
  String get guildMeetingCurr;

  /// No description provided for @guildMeetingTime.
  ///
  /// In sv, this message translates to:
  /// **'Mötet kommer äga rum den 18 till 20 november.'**
  String get guildMeetingTime;

  /// No description provided for @guildMeetingNominateOne.
  ///
  /// In sv, this message translates to:
  /// **'Kandidera och nominera kan du göra via'**
  String get guildMeetingNominateOne;

  /// No description provided for @guildMeetingNominateTwo.
  ///
  /// In sv, this message translates to:
  /// **'valsidan.'**
  String get guildMeetingNominateTwo;

  /// No description provided for @guildMeetingSendMotionOne.
  ///
  /// In sv, this message translates to:
  /// **'Motioner skickas till'**
  String get guildMeetingSendMotionOne;

  /// No description provided for @guildMeetingSendMotionTwo.
  ///
  /// In sv, this message translates to:
  /// **' sekreteraren'**
  String get guildMeetingSendMotionTwo;

  /// No description provided for @guildMeetingSendMotionThree.
  ///
  /// In sv, this message translates to:
  /// **'innan motionsstoppet.'**
  String get guildMeetingSendMotionThree;

  /// No description provided for @guildMeetingDeadlinesOne.
  ///
  /// In sv, this message translates to:
  /// **'Följande datum gäller inför terminsmötet:'**
  String get guildMeetingDeadlinesOne;

  /// No description provided for @guildMeetingDeadlinesTwo.
  ///
  /// In sv, this message translates to:
  /// **'Redan passerat - Valet öppnar på hemsidan.'**
  String get guildMeetingDeadlinesTwo;

  /// No description provided for @guildMeetingDeadlinesThree.
  ///
  /// In sv, this message translates to:
  /// **'Redan passerat - Motionsstopp.'**
  String get guildMeetingDeadlinesThree;

  /// No description provided for @guildMeetingDeadlinesFour.
  ///
  /// In sv, this message translates to:
  /// **'Redan passerat - Valet stänger på hemsidan för mötesvalda poster.'**
  String get guildMeetingDeadlinesFour;

  /// No description provided for @guildMeetingDeadlinesFive.
  ///
  /// In sv, this message translates to:
  /// **'11 november - Anslag av föredragningslistan.'**
  String get guildMeetingDeadlinesFive;

  /// No description provided for @guildMeetingTimePlaceOne.
  ///
  /// In sv, this message translates to:
  /// **'Följande datum och tider gäller för terminsmötet: '**
  String get guildMeetingTimePlaceOne;

  /// No description provided for @guildMeetingTimePlaceTwo.
  ///
  /// In sv, this message translates to:
  /// **'18 till 20 november - Höstterminsmöte i MA:7'**
  String get guildMeetingTimePlaceTwo;

  /// No description provided for @guildMeetingTimePlaceThree.
  ///
  /// In sv, this message translates to:
  /// **'Mötet öppnar och återupptas kl. 17.59 på samtliga datum. '**
  String get guildMeetingTimePlaceThree;

  /// No description provided for @guildMeetingETC.
  ///
  /// In sv, this message translates to:
  /// **'Har du ytterligare frågar angående mötet, kontakta '**
  String get guildMeetingETC;

  /// No description provided for @guildMeetingBoard.
  ///
  /// In sv, this message translates to:
  /// **'styrelsen'**
  String get guildMeetingBoard;

  /// No description provided for @guildMeetingSignOff.
  ///
  /// In sv, this message translates to:
  /// **'I sektionens tjänst,\nEllinor Gullman-Strand, sekreterare 2024,\nSpindel'**
  String get guildMeetingSignOff;

  /// No description provided for @guildMeetingAboutTitle.
  ///
  /// In sv, this message translates to:
  /// **'Höst- och vårterminsmöten'**
  String get guildMeetingAboutTitle;

  /// No description provided for @guildMeetingAboutOne.
  ///
  /// In sv, this message translates to:
  /// **'Motioner och propositioner'**
  String get guildMeetingAboutOne;

  /// No description provided for @guildMeetingAboutTwo.
  ///
  /// In sv, this message translates to:
  /// **'Under terminsmötet kommer diverse förslag på förändringar och användningar av sektionens pengar att avhandlas. '**
  String get guildMeetingAboutTwo;

  /// No description provided for @guildMeetingAboutThree.
  ///
  /// In sv, this message translates to:
  /// **'Dessa s.k. motioner och propositioner inkommer från sektionens gemene medlem respektive sektionens styrelse. '**
  String get guildMeetingAboutThree;

  /// No description provided for @guildMeetingAboutFour.
  ///
  /// In sv, this message translates to:
  /// **'Om du har en idé på en motion och vill ha tips eller hjälp att skriva den, kontakta'**
  String get guildMeetingAboutFour;

  /// No description provided for @guildMeetingAboutFive.
  ///
  /// In sv, this message translates to:
  /// **'eller den relevanta '**
  String get guildMeetingAboutFive;

  /// No description provided for @guildMeetingAboutSix.
  ///
  /// In sv, this message translates to:
  /// **'utskottsordföranden '**
  String get guildMeetingAboutSix;

  /// No description provided for @guildMeetingAboutSeven.
  ///
  /// In sv, this message translates to:
  /// **'beroende på vad din idé behandlar.'**
  String get guildMeetingAboutSeven;

  /// No description provided for @guildMeetingAboutEight.
  ///
  /// In sv, this message translates to:
  /// **'Färdiga motioner skickas in till '**
  String get guildMeetingAboutEight;

  /// No description provided for @guildMeetingAboutNine.
  ///
  /// In sv, this message translates to:
  /// **'sekreteraren'**
  String get guildMeetingAboutNine;

  /// No description provided for @guildMeetingAboutTen.
  ///
  /// In sv, this message translates to:
  /// **'innan motionsstoppet.'**
  String get guildMeetingAboutTen;

  /// No description provided for @guildMeetingElectionInfoOne.
  ///
  /// In sv, this message translates to:
  /// **'Engagemang och val'**
  String get guildMeetingElectionInfoOne;

  /// No description provided for @guildMeetingElectionInfoTwo.
  ///
  /// In sv, this message translates to:
  /// **'Ett sätt att engagera sig inom F-sektionen är att söka några av våra poster i anslutning till höst- eller vårterminsmötet. Kandidatur till en post sker via '**
  String get guildMeetingElectionInfoTwo;

  /// No description provided for @guildMeetingElectionInfoThree.
  ///
  /// In sv, this message translates to:
  /// **'valsidan.'**
  String get guildMeetingElectionInfoThree;

  /// No description provided for @guildMeetingElectionInfoFour.
  ///
  /// In sv, this message translates to:
  /// **'Det går också att nominera någon du anser lämplig till en specifik post men denna person måste sedan själv gå in och godta nomineringen. '**
  String get guildMeetingElectionInfoFour;

  /// No description provided for @guildMeetingElectionInfoFive.
  ///
  /// In sv, this message translates to:
  /// **'Större poster väljes under mötet och resterande poster väljes i efterhand av styrelsen. För mer information om engagemang och val, se Policy för val.'**
  String get guildMeetingElectionInfoFive;

  /// No description provided for @guildMeetingElectionInfoSix.
  ///
  /// In sv, this message translates to:
  /// **'Poster som väljs under sektionsmötet (större poster)'**
  String get guildMeetingElectionInfoSix;

  /// No description provided for @guildMeetingElectionInfoSeven.
  ///
  /// In sv, this message translates to:
  /// **'Söker du en post som väljes under sektionsmötet kommer du bli kallad för intervju av valberedningen. Valberedningen kommer sedan nominera den kandidat som de tycker är bäst lämpad för posten. '**
  String get guildMeetingElectionInfoSeven;

  /// No description provided for @guildMeetingElectionInfoEight.
  ///
  /// In sv, this message translates to:
  /// **'Den som inte blir nominerad av valberedningen kan fortfarande motkandidera under mötet. Alla kandididater till en post på sektionsmötet anslås på en plansch '**
  String get guildMeetingElectionInfoEight;

  /// No description provided for @guildMeetingElectionInfoNine.
  ///
  /// In sv, this message translates to:
  /// **'där de presenteras med bild och text. Du kan alltid kandidera till en post under mötet trots att du inte kandiderat i förväg.'**
  String get guildMeetingElectionInfoNine;

  /// No description provided for @guildMeetingBoardElectionOne.
  ///
  /// In sv, this message translates to:
  /// **'Val förrättade av styrelsen'**
  String get guildMeetingBoardElectionOne;

  /// No description provided for @guildMeetingBoardElectionTwo.
  ///
  /// In sv, this message translates to:
  /// **'Söker du en post som inte väljs under sektionsmötet kommer du kallas på intervju efter sektionsmötet. '**
  String get guildMeetingBoardElectionTwo;

  /// No description provided for @guildMeetingBoardElectionThree.
  ///
  /// In sv, this message translates to:
  /// **'Denna intervju hålls av en nomineringsgrupp ofta bestående av nya och gamla utskottsordföranden, eventuella förmän och eventuellt en valberedningsledamot. '**
  String get guildMeetingBoardElectionThree;

  /// No description provided for @guildMeetingBoardElectionFour.
  ///
  /// In sv, this message translates to:
  /// **'Nomineringsgruppen nominerar därefter ett rekommenderat antal personer till den aktuella posten. Det är sedan styrelsen som väljer in funktionärerna.'**
  String get guildMeetingBoardElectionFour;

  /// No description provided for @otherDocuments.
  ///
  /// In sv, this message translates to:
  /// **'Övriga mötesdokument'**
  String get otherDocuments;

  /// No description provided for @noOtherDocuments.
  ///
  /// In sv, this message translates to:
  /// **'Det finns inga övriga mötesdokument'**
  String get noOtherDocuments;

  /// No description provided for @otherTitleMissing.
  ///
  /// In sv, this message translates to:
  /// **'Titel saknas'**
  String get otherTitleMissing;

  /// No description provided for @noProposition.
  ///
  /// In sv, this message translates to:
  /// **'Det finns inga propositioner för detta möte på hemsidan.'**
  String get noProposition;

  /// No description provided for @noCandidacyPoster.
  ///
  /// In sv, this message translates to:
  /// **'Det finns ingen kandidaturplanch för detta möte ännu.'**
  String get noCandidacyPoster;

  /// No description provided for @guildMeetingButtonAbout.
  ///
  /// In sv, this message translates to:
  /// **'Om sektionsmötet'**
  String get guildMeetingButtonAbout;

  /// No description provided for @guildMeetingButtonBefore.
  ///
  /// In sv, this message translates to:
  /// **'Inför sektionsmötet'**
  String get guildMeetingButtonBefore;

  /// No description provided for @guildMeetingButtonMotions.
  ///
  /// In sv, this message translates to:
  /// **'Motioner'**
  String get guildMeetingButtonMotions;

  /// No description provided for @guildMeetingButtonProposition.
  ///
  /// In sv, this message translates to:
  /// **'Propositioner'**
  String get guildMeetingButtonProposition;

  /// No description provided for @guildMeetingButtonPoster.
  ///
  /// In sv, this message translates to:
  /// **'Kandidaturplansch'**
  String get guildMeetingButtonPoster;

  /// No description provided for @guildMeetingButtonOther.
  ///
  /// In sv, this message translates to:
  /// **'Övriga dokument'**
  String get guildMeetingButtonOther;

  /// No description provided for @noMotions.
  ///
  /// In sv, this message translates to:
  /// **'Det finns inga motioner för detta möte på hemsidan.'**
  String get noMotions;

  /// No description provided for @propositionsPageTitle.
  ///
  /// In sv, this message translates to:
  /// **'Propositioner'**
  String get propositionsPageTitle;

  /// No description provided for @motionsPageTitle.
  ///
  /// In sv, this message translates to:
  /// **'Motioner'**
  String get motionsPageTitle;

  /// No description provided for @readMotion.
  ///
  /// In sv, this message translates to:
  /// **'Läs motion'**
  String get readMotion;

  /// No description provided for @readMotionAnswer.
  ///
  /// In sv, this message translates to:
  /// **'Läs motionssvar'**
  String get readMotionAnswer;

  /// No description provided for @readProposition.
  ///
  /// In sv, this message translates to:
  /// **'Läs proposition'**
  String get readProposition;

  /// No description provided for @emergencyContacts.
  ///
  /// In sv, this message translates to:
  /// **'Nödkontaktnummer'**
  String get emergencyContacts;

  /// No description provided for @emergencyNumOne.
  ///
  /// In sv, this message translates to:
  /// **'112'**
  String get emergencyNumOne;

  /// No description provided for @emergencyTitleOne.
  ///
  /// In sv, this message translates to:
  /// **' - SOS alarm'**
  String get emergencyTitleOne;

  /// No description provided for @emergencyContentOne.
  ///
  /// In sv, this message translates to:
  /// **'I nödsituationer, kontakta alltid 112. Med detta nummer når du polis, ambulans, brandkår etc.'**
  String get emergencyContentOne;

  /// No description provided for @emergencyNumTwo.
  ///
  /// In sv, this message translates to:
  /// **'046 17 41 00'**
  String get emergencyNumTwo;

  /// No description provided for @emergencyTitleTwo.
  ///
  /// In sv, this message translates to:
  /// **' - Psykiatrisk akutmottagning (Lund)'**
  String get emergencyTitleTwo;

  /// No description provided for @emergencyContentTwo.
  ///
  /// In sv, this message translates to:
  /// **'Ring detta nummer vid behov av akut psykiatrisk vård i Lund. Mottagningen har öppet dygnet runt.'**
  String get emergencyContentTwo;

  /// No description provided for @emergencyNumThree.
  ///
  /// In sv, this message translates to:
  /// **'90101'**
  String get emergencyNumThree;

  /// No description provided for @emergencyTitleThree.
  ///
  /// In sv, this message translates to:
  /// **' - Mind Självmordslinjen'**
  String get emergencyTitleThree;

  /// No description provided for @emergencyContentThree.
  ///
  /// In sv, this message translates to:
  /// **'Självmordslinjen är till för dig som har tankar på att ta ditt liv eller har en närstående med sådana tankar. De har öppet dygnet runt, varje dag. Vid akut självmordsrisk bör du ringa 112.'**
  String get emergencyContentThree;

  /// No description provided for @emergencyNumFour.
  ///
  /// In sv, this message translates to:
  /// **'20 700'**
  String get emergencyNumFour;

  /// No description provided for @emergencyTitleFour.
  ///
  /// In sv, this message translates to:
  /// **' - Universitetets nödnummer'**
  String get emergencyTitleFour;

  /// No description provided for @emergencyContentFour.
  ///
  /// In sv, this message translates to:
  /// **'Om du behöver komma i kontakt med en säkerhetsvakt eller universitetets räddningstjänst. Detta är ett 24-timmars servicenummer där du kan få hjälp i situationer och rapportera händelser som observationer, inbrott, förlorat passerkort, hot eller våld.'**
  String get emergencyContentFour;

  /// No description provided for @emergencyNumFive.
  ///
  /// In sv, this message translates to:
  /// **'08-702 16 80'**
  String get emergencyNumFive;

  /// No description provided for @emergencyTitleFive.
  ///
  /// In sv, this message translates to:
  /// **' - Jourhavande medmänniska'**
  String get emergencyTitleFive;

  /// No description provided for @emergencyContentFive.
  ///
  /// In sv, this message translates to:
  /// **'Om du behöver någon att prata med, ring Jourhavande medmänniskor för mänsklig support under natten mellan kl 21-06.'**
  String get emergencyContentFive;

  /// No description provided for @emergencyNumSix.
  ///
  /// In sv, this message translates to:
  /// **'1177'**
  String get emergencyNumSix;

  /// No description provided for @emergencyTitleSix.
  ///
  /// In sv, this message translates to:
  /// **' - Sjukvårdsrådgivning'**
  String get emergencyTitleSix;

  /// No description provided for @emergencyContentSix.
  ///
  /// In sv, this message translates to:
  /// **'Ifall du har frågor eller behöver rådgivning inom sjukdom, skador och hälsa.'**
  String get emergencyContentSix;

  /// No description provided for @emergencyNumSeven.
  ///
  /// In sv, this message translates to:
  /// **'113 13'**
  String get emergencyNumSeven;

  /// No description provided for @emergencyTitleSeven.
  ///
  /// In sv, this message translates to:
  /// **' - Krisinformation'**
  String get emergencyTitleSeven;

  /// No description provided for @emergencyContentSeven.
  ///
  /// In sv, this message translates to:
  /// **'Sveriges nationella informationsnummer. Dit kan du ringa om du vill få information vid allvarliga olyckor och kriser i samhället.'**
  String get emergencyContentSeven;

  /// No description provided for @emergencyTitleEight.
  ///
  /// In sv, this message translates to:
  /// **'Föset'**
  String get emergencyTitleEight;

  /// No description provided for @emergencyContentEight.
  ///
  /// In sv, this message translates to:
  /// **'Om du snabbt behöver komma i kontakt med någon av oss i föset så kan du ringa oss på följande nummer. \n\nÖverfös Victor\n076195025 \n\nCofös Tova\n0709578852 \n\nCofös Frida\n0723666302 \n\nCofös Alma\n0706364253 \n\nCofös Ale\n0761314477 \n\nCofös Hannes\n0703393493 \n\nCofös Erik\n0723320921 \n\nYtterligare kontaktinformation finns att hitta i Nolleguiden'**
  String get emergencyContentEight;

  /// No description provided for @game.
  ///
  /// In sv, this message translates to:
  /// **'Moose game'**
  String get game;

  /// No description provided for @gameDescription.
  ///
  /// In sv, this message translates to:
  /// **'Kommer snart!'**
  String get gameDescription;

  /// No description provided for @weekQuests.
  ///
  /// In sv, this message translates to:
  /// **'Vecka'**
  String get weekQuests;

  /// No description provided for @kladguideTopTitle.
  ///
  /// In sv, this message translates to:
  /// **'En guide till klädkoder inom studentlivet'**
  String get kladguideTopTitle;

  /// No description provided for @kladGuideProcessionFeature.
  ///
  /// In sv, this message translates to:
  /// **'I samarbete med medaljkommittén'**
  String get kladGuideProcessionFeature;

  /// No description provided for @kladGuideIntro.
  ///
  /// In sv, this message translates to:
  /// **'I studentlivet kan du komma att stöta på olika klädkoder. Det är frivilligt att följa dem, men för den nyfikne är här en guide med tips från medaljkommittén om hur de olika koderna kan tolkas.'**
  String get kladGuideIntro;

  /// No description provided for @kladGuideWhiteTieFullDress.
  ///
  /// In sv, this message translates to:
  /// **'\nHögtidsdräkt'**
  String get kladGuideWhiteTieFullDress;

  /// No description provided for @tailcoat.
  ///
  /// In sv, this message translates to:
  /// **'Frack'**
  String get tailcoat;

  /// No description provided for @tailcoatContent.
  ///
  /// In sv, this message translates to:
  /// **'Fracken är en traditionell festklädsel med följande delar:\n• Byxor: Svarta med sidenrevärer, i samma tyg som fracken. De ska bäras med hängslen för att sitta korrekt.\n• Frackskjorta: En vit skjorta speciellt utformad för frack, med plats för manschettknappar och löstagbara bröstknappar, som köps separat.\n• Frackväst: Vit och designad specifikt för frack.\n• Fluga: Vit.\n• Skor: Svarta lackskor.'**
  String get tailcoatContent;

  /// No description provided for @fulldress.
  ///
  /// In sv, this message translates to:
  /// **'Långklänning'**
  String get fulldress;

  /// No description provided for @fulldressContent.
  ///
  /// In sv, this message translates to:
  /// **'Långklänningen/balklänningen är en elegant klädsel för festliga tillfällen.\n• Längd: Klänningen ska nå ner till golvet.\n• Material och Stil: Bör vara av ett fint tyg och ha en festlig modell.\n• Ärmar: Kan vara ärmlös. Om handskar bärs, ska de helst vara långa nog att täcka armbågarna.'**
  String get fulldressContent;

  /// No description provided for @accessories.
  ///
  /// In sv, this message translates to:
  /// **'Accessoarer'**
  String get accessories;

  /// No description provided for @accessoriesContent.
  ///
  /// In sv, this message translates to:
  /// **'Det är kutym att bära medaljer och ordensband vid dessa tillfällen. Till högtidsdräkt bärs studentmössans vita modell.'**
  String get accessoriesContent;

  /// No description provided for @formal.
  ///
  /// In sv, this message translates to:
  /// **'Mörk Kostym'**
  String get formal;

  /// No description provided for @dressSkirt.
  ///
  /// In sv, this message translates to:
  /// **'Klänning/Kjol'**
  String get dressSkirt;

  /// No description provided for @dressSkirtContent.
  ///
  /// In sv, this message translates to:
  /// **'För den som bär klänning eller kjol, bör plagget vara av ett finare tyg, såsom siden eller sammet, och nå ner till eller täcka knäna. Mörka toner rekommenderas för att matcha den formella stilen.'**
  String get dressSkirtContent;

  /// No description provided for @suit.
  ///
  /// In sv, this message translates to:
  /// **'Kostym'**
  String get suit;

  /// No description provided for @suitContent.
  ///
  /// In sv, this message translates to:
  /// **'En mörk kostym är formell och ska bestå av kavaj, byxor och eventuell väst i samma tyg och färg. Svart är ett utmärkt val.\n• Skjorta: En ljus skjorta, gärna vit, är att föredra.\n• Skor och Skärp: Skorna ska vara svarta. Om du använder skärp, ska det också vara svart.\n• Accessoarer: Slips eller fluga är obligatoriskt till kavajen.'**
  String get suitContent;

  /// No description provided for @smartCasual.
  ///
  /// In sv, this message translates to:
  /// **'Udda Kavaj'**
  String get smartCasual;

  /// No description provided for @smartCasualIntro.
  ///
  /// In sv, this message translates to:
  /// **'Klädkoden \"udda kavaj\" innebär främst att kavajen inte ska matcha med underdelen.\n\n• Stil: Håll klädseln uppklädd men inte lika formell som mörk kostym. Välj finare plagg än vardagskläder, exempelvis en snyggare byxa/kjol och en valfri överdel, eller varför inte en enklare klänning. Undvik jeans.'**
  String get smartCasualIntro;

  /// No description provided for @smartCasualContent.
  ///
  /// In sv, this message translates to:
  /// **'• Kavaj: Kavajen kan vara en blazer eller en kavaj från en kostym, men den ska inte matcha byxorna eller kjolen.\n• Överdel: Skjorta eller topp kan vara i valfri färg och stil.\n• Underdelen: Bör vara i ett annat tyg och färg än en eventuell kavaj.\n• Accessoarer: Slips eller fluga är valfritt.'**
  String get smartCasualContent;

  /// No description provided for @ovveThematically.
  ///
  /// In sv, this message translates to:
  /// **'Ovve+Temaenligt'**
  String get ovveThematically;

  /// No description provided for @ovveContent.
  ///
  /// In sv, this message translates to:
  /// **'En klädkod man inte finner utanför Teknologvärlden! På F-sektionen är det högst vanligt förekommande med teknologmössan i rätt färg till Ovve.'**
  String get ovveContent;

  /// No description provided for @ovveThematicallyContent.
  ///
  /// In sv, this message translates to:
  /// **'Ytterligare en klädkod inom teknologvärlden. Denna är vanligt förekommande på slasquer/fulsittningar och urskiljer sig från Ovve genom att bjuda in till tema! Här kan man gå på från allt mellan 0 till 10000% på en temaenlig outfit.'**
  String get ovveThematicallyContent;

  /// No description provided for @technologistCap.
  ///
  /// In sv, this message translates to:
  /// **'Teknologmössan'**
  String get technologistCap;

  /// No description provided for @whiteAndBlue.
  ///
  /// In sv, this message translates to:
  /// **'Vit och blå'**
  String get whiteAndBlue;

  /// No description provided for @technologistCapContent.
  ///
  /// In sv, this message translates to:
  /// **'Teknologmössan finns i två varianter, den vita sommarmodellen samt den blåa vintermodellen. \n\nVinterskyddet bärs från 4 oktober till och med mösspåtagningen den 30 april. Ett undantag till detta är att vintermodellen aldrig bärs till högtidsdräkt, då bärs istället den vita sommarmodellen oavsett tid på året.'**
  String get technologistCapContent;

  /// No description provided for @tassel.
  ///
  /// In sv, this message translates to:
  /// **'Tofsen'**
  String get tassel;

  /// No description provided for @tasselIntro.
  ///
  /// In sv, this message translates to:
  /// **'I tofsen kan det hänga olika saker som samlats på under ens år som teknolog, men de mest betydelsefulla är spegaten. Spegaten matchar de år inom ett program man läst eller läser.'**
  String get tasselIntro;

  /// No description provided for @tasselColors.
  ///
  /// In sv, this message translates to:
  /// **'Spegaten för teknisk fysik är orange, för teknisk matematik orange/silver och för teknisk nanovetenskap orange/grön.'**
  String get tasselColors;

  /// No description provided for @medalsAndBadges.
  ///
  /// In sv, this message translates to:
  /// **'Medaljer och ordenstecken'**
  String get medalsAndBadges;

  /// No description provided for @medalsAndBadgesIntro.
  ///
  /// In sv, this message translates to:
  /// **'Medaljer bärs olika på frack/kostym respektive klänning. På frack eller kostym kan medaljerna placeras under bröstfickan, gärna i prydliga rader. Bär man klänning fäster man oftast sina medaljer på ordensbandet.'**
  String get medalsAndBadgesIntro;

  /// No description provided for @medalsAndBadgesEnd.
  ///
  /// In sv, this message translates to:
  /// **'Vid bal eller särskilda tillställningar där medaljer delas ut, kan den aktuella medaljen bäras på frackslaget alternativt på klänningens vänstra sida. Ordensband bärs över höger axel, och för frackbärare skall bandet bäras UNDER frackvästen.'**
  String get medalsAndBadgesEnd;

  /// No description provided for @kladguideModels.
  ///
  /// In sv, this message translates to:
  /// **'Medverkande: Christopher Doggett, Agnes Göransson, Tova Franvin, Emilia Nilsson.\nFotograf: Blendona Ibrahimi'**
  String get kladguideModels;

  /// No description provided for @festivitiesCommittee.
  ///
  /// In sv, this message translates to:
  /// **'Sexmästeriet'**
  String get festivitiesCommittee;

  /// No description provided for @guilds.
  ///
  /// In sv, this message translates to:
  /// **'sektioner'**
  String get guilds;

  /// No description provided for @ministryOfCulture.
  ///
  /// In sv, this message translates to:
  /// **'Kulturministeriet'**
  String get ministryOfCulture;

  /// No description provided for @organization.
  ///
  /// In sv, this message translates to:
  /// **'organisation'**
  String get organization;

  /// No description provided for @theManagement.
  ///
  /// In sv, this message translates to:
  /// **'Ledningen'**
  String get theManagement;

  /// No description provided for @others.
  ///
  /// In sv, this message translates to:
  /// **'övrigt'**
  String get others;

  /// No description provided for @nations.
  ///
  /// In sv, this message translates to:
  /// **'nationer'**
  String get nations;

  /// No description provided for @educationalCouncil.
  ///
  /// In sv, this message translates to:
  /// **'Studierådet'**
  String get educationalCouncil;

  /// No description provided for @organizationTree.
  ///
  /// In sv, this message translates to:
  /// **'organisationsträd'**
  String get organizationTree;

  /// No description provided for @theAccountingDepartment.
  ///
  /// In sv, this message translates to:
  /// **'Bokförlaget'**
  String get theAccountingDepartment;

  /// No description provided for @hilbertCafe.
  ///
  /// In sv, this message translates to:
  /// **'Cafémästeriet'**
  String get hilbertCafe;

  /// No description provided for @corporateRelations.
  ///
  /// In sv, this message translates to:
  /// **'Näringslivsutskottet'**
  String get corporateRelations;

  /// No description provided for @facilitiesCommittee.
  ///
  /// In sv, this message translates to:
  /// **'Prylmästeriet'**
  String get facilitiesCommittee;

  /// No description provided for @theConscience.
  ///
  /// In sv, this message translates to:
  /// **'Samvetet'**
  String get theConscience;

  /// No description provided for @ministryOfTruth.
  ///
  /// In sv, this message translates to:
  /// **'Sanningsministeriet'**
  String get ministryOfTruth;

  /// No description provided for @theProcession.
  ///
  /// In sv, this message translates to:
  /// **'Medaljkommittén'**
  String get theProcession;

  /// No description provided for @introductionCommittee.
  ///
  /// In sv, this message translates to:
  /// **'Föset'**
  String get introductionCommittee;

  /// No description provided for @spexInLund.
  ///
  /// In sv, this message translates to:
  /// **'spex i Lund'**
  String get spexInLund;

  /// No description provided for @spexContent.
  ///
  /// In sv, this message translates to:
  /// **'I Lund finns ungefär tio olika studentspex, och varje spex sätter upp föreställningar mellan en till tre gånger per år. Många av dessa spex håller till i AF-borgen, medan mindre nationsspex ofta använder nationens egna lokaler.\n\nAtt vara engagerad i ett spex innebär att du kan delta i många olika aktiviteter, såsom att bygga scenografi, sy kostymer, sminka, spela instrument eller sjunga. Endast en liten del av spex-ensemblen står på scenen, vilket innebär att det finns mycket att göra även för dig som inte vill vara i rampljuset. Repetitioner pågår vanligtvis i 3-5 veckor under terminen, och beroende på spexets storlek framförs sedan ett antal föreställningar för både Lunds studenter och allmänheten.\n\nDe fyra största spexen i Lund, som alla håller sina föreställningar i stora salen i AF-borgen, är Jesper, Toddy, Boel och Lundaspexarna. Jesper är teknologspexet och riktar sig främst till teknologstudenter, Toddy är motsvarande för läkarstudenter, Boel har enbart kvinnor på scen, och Lundaspexarna har enbart män på scen.'**
  String get spexContent;

  /// No description provided for @spexImageText.
  ///
  /// In sv, this message translates to:
  /// **'Bilder från Jesperspexets hyllade föreställning \"Marie Curie\", som spelades under våren 2024.'**
  String get spexImageText;

  /// No description provided for @spexCredits.
  ///
  /// In sv, this message translates to:
  /// **'Text: Johan Furuhjelm, Bild: Per Lindström'**
  String get spexCredits;

  /// No description provided for @supportFunctions.
  ///
  /// In sv, this message translates to:
  /// **'Stödfunktioner'**
  String get supportFunctions;

  /// No description provided for @supportIntro.
  ///
  /// In sv, this message translates to:
  /// **'Hejsan nollan!\n\nSom ny student på LTH är det lätt att känna sig förvirrad eller bara frågvis. Som tur är finns det gott om folk som har stenkoll på precis det du behöver veta, eller som är där för dig om du behöver prata. På F-sektionen är vi dedikerade till att främja en inkluderande och stödjande miljö för alla studenter.\n\nVi prioriterar våra medlemmars psykosociala välbefinnande och har en nolltoleranspolicy mot alla former av diskriminering eller trakasserier. Om du någonsin känner dig hotad, illa till mods eller illa behandlad, kom ihåg att du har tillgång till olika resurser inom och utanför vår organisation.'**
  String get supportIntro;

  /// No description provided for @supportImportantContacts.
  ///
  /// In sv, this message translates to:
  /// **'Hjälp och viktiga kontakter'**
  String get supportImportantContacts;

  /// No description provided for @supportImportantContactsContent.
  ///
  /// In sv, this message translates to:
  /// **'Via telefon-ikonen i appen hittar du en lista på viktiga nödnummer för akuta situationer; bland annat till sjukvård, polis, brandkår, universitetet, psykiatrisk akutmottagning, självmordslinjen, och nummer till Föset.'**
  String get supportImportantContactsContent;

  /// No description provided for @supportEmergency.
  ///
  /// In sv, this message translates to:
  /// **'Vid livsfara, våld eller hot om våld, ring alltid 112!'**
  String get supportEmergency;

  /// No description provided for @schoolCareerCousellor.
  ///
  /// In sv, this message translates to:
  /// **'Studie och karriärvägledning'**
  String get schoolCareerCousellor;

  /// No description provided for @schoolCareerCousellorContent.
  ///
  /// In sv, this message translates to:
  /// **'Om du har frågor som gäller din utbildning kan du vända dig till din studievägledare. De sitter mitt i E-huset högst upp på våning 5. Du hittar dem även i Hilbert café varje torsdag kl 9-11 under läsveckorna. Ta tillfället i akt att säga hej eller ställa frågor!'**
  String get schoolCareerCousellorContent;

  /// No description provided for @careerCounsellorOne.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Fysik\nJoakim Cao'**
  String get careerCounsellorOne;

  /// No description provided for @careerCounsellorOneNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 72 89'**
  String get careerCounsellorOneNumber;

  /// No description provided for @careerCounsellorOneEmail.
  ///
  /// In sv, this message translates to:
  /// **'joakim.cao@lth.lu.se'**
  String get careerCounsellorOneEmail;

  /// No description provided for @careerCounsellorTwo.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Nanovetenskap\nMaria Sörensson'**
  String get careerCounsellorTwo;

  /// No description provided for @careerCounsellorTwoNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 08 54'**
  String get careerCounsellorTwoNumber;

  /// No description provided for @careerCounsellorTwoEmail.
  ///
  /// In sv, this message translates to:
  /// **'maria.sorensson@lth.lu.se'**
  String get careerCounsellorTwoEmail;

  /// No description provided for @careerCounsellorThree.
  ///
  /// In sv, this message translates to:
  /// **'Teknisk Matematik\nKarin Cherfils-Karlsson'**
  String get careerCounsellorThree;

  /// No description provided for @careerCounsellorThreeNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 37 36'**
  String get careerCounsellorThreeNumber;

  /// No description provided for @careerCounsellorThreeEmail.
  ///
  /// In sv, this message translates to:
  /// **'karin.cherfils-karlsson@lth.lu.se'**
  String get careerCounsellorThreeEmail;

  /// No description provided for @internationalCoordinators.
  ///
  /// In sv, this message translates to:
  /// **'Internationell koordinator'**
  String get internationalCoordinators;

  /// No description provided for @internationalCoordinatorsContent.
  ///
  /// In sv, this message translates to:
  /// **'Kontakter för internationella studenter kan hittas på Studentwebben LTH:'**
  String get internationalCoordinatorsContent;

  /// No description provided for @internationalCoordinatorsWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.student.lth.se/english/contact/international-coordinators/'**
  String get internationalCoordinatorsWebsite;

  /// No description provided for @counsellor.
  ///
  /// In sv, this message translates to:
  /// **'Kurator'**
  String get counsellor;

  /// No description provided for @counsellorContent.
  ///
  /// In sv, this message translates to:
  /// **'Om man har personliga bekymmer, har hamnat i någon form av kris eller bara vill prata med någon kan man vända sig till studiekuratorn för F, n och π. Du bokar ett möte via mail, och du hittar hennes kontor mitt i E-huset högst upp på våning 5. Hon är utbildad socionom, och har naturligtvis tystnadsplikt.'**
  String get counsellorContent;

  /// No description provided for @counsellorOne.
  ///
  /// In sv, this message translates to:
  /// **'Studiekurator F, N och π\nEmma Hammarlund'**
  String get counsellorOne;

  /// No description provided for @counsellorOneNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 72 47'**
  String get counsellorOneNumber;

  /// No description provided for @counsellorOneEmail.
  ///
  /// In sv, this message translates to:
  /// **'emma.hammarlund@lth.lu.se'**
  String get counsellorOneEmail;

  /// No description provided for @studentHealthCenter.
  ///
  /// In sv, this message translates to:
  /// **'Studenthälsan'**
  String get studentHealthCenter;

  /// No description provided for @studentHealthCenterContent.
  ///
  /// In sv, this message translates to:
  /// **'Här arbetar bland annat kuratorer, sjuksköterskor, psykologer och psykiatriker. Hit kan alla studenter vid Lunds Universitet vända sig. Alla besök ska tidsbokas och besöken är gratis. Studenthälsan fungerar som ett komplement till vårdcentralen, och personalen har naturligtvis tystnadsplikt.'**
  String get studentHealthCenterContent;

  /// No description provided for @studentHealthCenterNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 43 77'**
  String get studentHealthCenterNumber;

  /// No description provided for @studentHealthCenterAdress.
  ///
  /// In sv, this message translates to:
  /// **'Sandgatan 3, Lund'**
  String get studentHealthCenterAdress;

  /// No description provided for @studentHealthCenterWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.lu.se/student/studenthaelsan'**
  String get studentHealthCenterWebsite;

  /// No description provided for @libuAndSafetyRespresentatives.
  ///
  /// In sv, this message translates to:
  /// **'LiBU och psyko-sociala skyddsombud'**
  String get libuAndSafetyRespresentatives;

  /// No description provided for @libuAndSafetyRespresentativesContent.
  ///
  /// In sv, this message translates to:
  /// **'Libu är ett utskott inom F-sektionen som fokuserar på jämlikhetsrelaterade ämnen, inklusive diskriminering, välbefinnande och likabehandling. Utskottet är tillgänglig för alla studenter, och du kan kontakta dem om du känner dig illa eller orättvist behandlad.\n\nDe ansvariga för utskottet är Signe Nord (Samvetsmästare) och Malte Callsén (Likabehandlingsordförande). Signe och Malte är våra psykosociala skyddsombud som finns här för att hjälpa dig att navigera bland de tillgängliga resurserna och ge stöd för ditt välbefinnande.\n\nDet är viktigt att notera att skyddsombuden har tystnadsplikt, vilket garanterar din integritet. Du kan kontakta dem privat via Facebook eller e-post, eller på något annat sätt som känns bekvämt för dig.'**
  String get libuAndSafetyRespresentativesContent;

  /// No description provided for @libuEmail.
  ///
  /// In sv, this message translates to:
  /// **'likabehandlingsutskottet@fsektionen.se'**
  String get libuEmail;

  /// No description provided for @presidentOfStudentEqualityComittee.
  ///
  /// In sv, this message translates to:
  /// **'Malte: '**
  String get presidentOfStudentEqualityComittee;

  /// No description provided for @presidentOfStudentEqualityComitteeEmail.
  ///
  /// In sv, this message translates to:
  /// **'libo@fsektionen.se'**
  String get presidentOfStudentEqualityComitteeEmail;

  /// No description provided for @masterOfConscience.
  ///
  /// In sv, this message translates to:
  /// **'Signe: '**
  String get masterOfConscience;

  /// No description provided for @masterOfConscienceEmail.
  ///
  /// In sv, this message translates to:
  /// **'samvetsmastare@fsektionen.se'**
  String get masterOfConscienceEmail;

  /// No description provided for @guildAnonContact.
  ///
  /// In sv, this message translates to:
  /// **'Sektionens anonyma kontaktformulär'**
  String get guildAnonContact;

  /// No description provided for @guildAnonContactPage.
  ///
  /// In sv, this message translates to:
  /// **'https://docs.google.com/forms/d/e/1FAIpQLSdZdPl14DkdlZCKS3jzO59-FvVi2ug9nYer1jhYgERanbwHoQ/viewform'**
  String get guildAnonContactPage;

  /// No description provided for @supportThereIsHelp.
  ///
  /// In sv, this message translates to:
  /// **'Hjälp finns att få!'**
  String get supportThereIsHelp;

  /// No description provided for @supportThereIsHelpInfoOne.
  ///
  /// In sv, this message translates to:
  /// **'Om du någon gång upplever att du känner dig orättvist behandlad i dina studier eller på andra arrangemang som du besöker under din studietid så har Teknologkåren ett anonymt formulär för att ge feedback och kritik genom. Formuläret nås på:'**
  String get supportThereIsHelpInfoOne;

  /// No description provided for @supportThereIsHelpInfoTwo.
  ///
  /// In sv, this message translates to:
  /// **'På Teknologkåren finns också studiesocialt ansvarig (SA) som på heltid arbetar med LTH:s likabehandlingsarbete och studenters välbefinnande. Om du har blivit orättvist behandlad under din tid på LTH kan du vända dig till SA för att få hjälp. SA finns som stöd för alla civilingenjörsstudenter och har tystnadsplikt.'**
  String get supportThereIsHelpInfoTwo;

  /// No description provided for @complainPage.
  ///
  /// In sv, this message translates to:
  /// **'https://www.tlth.se/klaga'**
  String get complainPage;

  /// No description provided for @supportThereIsHelpNumber.
  ///
  /// In sv, this message translates to:
  /// **'070 418 79 25'**
  String get supportThereIsHelpNumber;

  /// No description provided for @supportThereIsHelpEmail.
  ///
  /// In sv, this message translates to:
  /// **'sa@tlth.se'**
  String get supportThereIsHelpEmail;

  /// No description provided for @supportSelection.
  ///
  /// In sv, this message translates to:
  /// **'Ett urval stödfunktioner för Lundastudenter'**
  String get supportSelection;

  /// No description provided for @umoInfo.
  ///
  /// In sv, this message translates to:
  /// **'For people up to 23 years old. Works with issues such as sex and relationships as well as anxiety management and counselling. Booking by phone or via their online reception.'**
  String get umoInfo;

  /// No description provided for @umoNumber.
  ///
  /// In sv, this message translates to:
  /// **'0770 25 25 00'**
  String get umoNumber;

  /// No description provided for @psychotherapyClinic.
  ///
  /// In sv, this message translates to:
  /// **'Psykoterapimottagningen på LU'**
  String get psychotherapyClinic;

  /// No description provided for @psychotherapyClinicInfo.
  ///
  /// In sv, this message translates to:
  /// **'Blivande psykologer vid LU erbjuder psykoterapi till rabatterat pris som en del av psykologutbildningen. Boka tid via mail eller telefon.'**
  String get psychotherapyClinicInfo;

  /// No description provided for @psychotherapyClinicNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 222 91 24'**
  String get psychotherapyClinicNumber;

  /// No description provided for @psychotherapyClinicEmail.
  ///
  /// In sv, this message translates to:
  /// **'psykoterapimottagningen@psy.lu.se'**
  String get psychotherapyClinicEmail;

  /// No description provided for @healthCenter.
  ///
  /// In sv, this message translates to:
  /// **'Vårdcentral'**
  String get healthCenter;

  /// No description provided for @healthCenterInfo.
  ///
  /// In sv, this message translates to:
  /// **'Din vårdcentral kan också erbjuda samtalsstöd, hjälp vid ångest och oro eller depression. Ring din vårdcentral och förklara din situation så guidar de dig vidare. Vet du inte vilken din vårdcentral är? Du kan alltid ringa till någon som är nära dig och lista dig där, då blir det din vårdcentral.'**
  String get healthCenterInfo;

  /// No description provided for @youngAdultsInLund.
  ///
  /// In sv, this message translates to:
  /// **'Unga vuxna Lund'**
  String get youngAdultsInLund;

  /// No description provided for @youngAdultsInLundInfo.
  ///
  /// In sv, this message translates to:
  /// **'Erbjuder stöd och hjälp till dig mellan 16 och 29 år. Det kan handla om personliga problem, relationer eller frågor kring fysisk och psykisk hälsa. Nås på telefon eller kan kontaktas via 1177.'**
  String get youngAdultsInLundInfo;

  /// No description provided for @youngAdultsInLundNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 359 80 93'**
  String get youngAdultsInLundNumber;

  /// No description provided for @studentPriests.
  ///
  /// In sv, this message translates to:
  /// **'Studentprästerna'**
  String get studentPriests;

  /// No description provided for @studentPriestsInfo.
  ///
  /// In sv, this message translates to:
  /// **'Erbjuder samtal om stort och smått, oavsett tro eller livsåskådning. Har tystnadsplikt.'**
  String get studentPriestsInfo;

  /// No description provided for @studentPriestsNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 359 80 93'**
  String get studentPriestsNumber;

  /// No description provided for @studentPriestsEmail.
  ///
  /// In sv, this message translates to:
  /// **'studentpresterna.lund@svenskakyrkan.se'**
  String get studentPriestsEmail;

  /// No description provided for @girlAndTransgenderHotlineLund.
  ///
  /// In sv, this message translates to:
  /// **'Tjej- och transjouren i Lund'**
  String get girlAndTransgenderHotlineLund;

  /// No description provided for @girlAndTransgenderHotlineLundInfo.
  ///
  /// In sv, this message translates to:
  /// **'Stöttar dig via chatt, telefon eller mail. Du kan vända dig hit om du har varit utsatt för våld eller har frågor kring sex, relationer, psykisk ohälsa, kropp och mycket mer.'**
  String get girlAndTransgenderHotlineLundInfo;

  /// No description provided for @girlAndTransgenderHotlineLundWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.tjejochtransjourenilund.se'**
  String get girlAndTransgenderHotlineLundWebsite;

  /// No description provided for @kvinnojourenLund.
  ///
  /// In sv, this message translates to:
  /// **'Kvinnojouren Lund'**
  String get kvinnojourenLund;

  /// No description provided for @kvinnojourenLundInfo.
  ///
  /// In sv, this message translates to:
  /// **'Kvinnojouren Lund erbjuder stöd till män, kvinnor och transpersoner som är eller har blivit utsatta för våld i en nära relation. Alla samtal är anonyma.'**
  String get kvinnojourenLundInfo;

  /// No description provided for @kvinnojourenLundNumber.
  ///
  /// In sv, this message translates to:
  /// **'020 21 29 60'**
  String get kvinnojourenLundNumber;

  /// No description provided for @kvinnojourenLundEmail.
  ///
  /// In sv, this message translates to:
  /// **'stod@kvinnojourenlund.se'**
  String get kvinnojourenLundEmail;

  /// No description provided for @kvinnojourenlundWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.kvinnojourenlund.se'**
  String get kvinnojourenlundWebsite;

  /// No description provided for @mansjouren.
  ///
  /// In sv, this message translates to:
  /// **'Mansjouren Lund'**
  String get mansjouren;

  /// No description provided for @mansjourenInfo.
  ///
  /// In sv, this message translates to:
  /// **'Erbjuder samtalsstöd via telefon, genom enskilda möten eller i grupp, till män som behöver prata med någon.'**
  String get mansjourenInfo;

  /// No description provided for @mansjourenNumber.
  ///
  /// In sv, this message translates to:
  /// **'08 30 30 20'**
  String get mansjourenNumber;

  /// No description provided for @mansjourenWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.mansjouren.se'**
  String get mansjourenWebsite;

  /// No description provided for @adultPsychEmergencyClinic.
  ///
  /// In sv, this message translates to:
  /// **'Akutmottagning vuxenpsykiatri'**
  String get adultPsychEmergencyClinic;

  /// No description provided for @adultPsychEmergencyClinicInfo.
  ///
  /// In sv, this message translates to:
  /// **'Vid akuta psykiatriska besvär.'**
  String get adultPsychEmergencyClinicInfo;

  /// No description provided for @adultPsychEmergencyClinicNumber.
  ///
  /// In sv, this message translates to:
  /// **'046 17 41 00'**
  String get adultPsychEmergencyClinicNumber;

  /// No description provided for @mindSuicidehotlite.
  ///
  /// In sv, this message translates to:
  /// **'Mind självmordslinjen'**
  String get mindSuicidehotlite;

  /// No description provided for @mindSuicidehotliteInfo.
  ///
  /// In sv, this message translates to:
  /// **'Självmordslinjen är till för dig som har tankar på att ta ditt liv eller har en närstående med sådana tankar. De har öppet dygnet runt, varje dag. Vid akut självmordsrisk bör du ringa 112.'**
  String get mindSuicidehotliteInfo;

  /// No description provided for @mindSuicidehotliteNumber.
  ///
  /// In sv, this message translates to:
  /// **'90 101'**
  String get mindSuicidehotliteNumber;

  /// No description provided for @onCallPerson.
  ///
  /// In sv, this message translates to:
  /// **'Jourhavande medmänniska'**
  String get onCallPerson;

  /// No description provided for @onCallPersonInfo.
  ///
  /// In sv, this message translates to:
  /// **'Anonyma samtal om stort och smått. Telefontid kvälls- och nattetid på följande nummer.'**
  String get onCallPersonInfo;

  /// No description provided for @onCallPersonNumber.
  ///
  /// In sv, this message translates to:
  /// **'08-702 16 80'**
  String get onCallPersonNumber;

  /// No description provided for @onCallPriest.
  ///
  /// In sv, this message translates to:
  /// **'Jourhavande präst'**
  String get onCallPriest;

  /// No description provided for @onCallPriestInfo.
  ///
  /// In sv, this message translates to:
  /// **'Samtals- och krisstöd. Du når dem på telefon via 112 samt kvällsöppen chatt. Har tystnadsplikt.'**
  String get onCallPriestInfo;

  /// No description provided for @mariaClinic.
  ///
  /// In sv, this message translates to:
  /// **'Mottagning Maria'**
  String get mariaClinic;

  /// No description provided for @mariaClinicInfo.
  ///
  /// In sv, this message translates to:
  /// **'För dig under 25 år som har problem med alkohol och andra droger.'**
  String get mariaClinicInfo;

  /// No description provided for @mariaClinicNumber.
  ///
  /// In sv, this message translates to:
  /// **'040 33 71 70'**
  String get mariaClinicNumber;

  /// No description provided for @skaneVardWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://vard.skane.se/'**
  String get skaneVardWebsite;

  /// No description provided for @triangleAddictionClinic.
  ///
  /// In sv, this message translates to:
  /// **'Triangeln beroendemottagning'**
  String get triangleAddictionClinic;

  /// No description provided for @triangleAddictionClinicInfo.
  ///
  /// In sv, this message translates to:
  /// **'Specialiserade på behov av kortare stödinsatser för alkoholproblem och för dig som inte tidigare sökt specialistvård.'**
  String get triangleAddictionClinicInfo;

  /// No description provided for @triangleAddictionClinicNumber.
  ///
  /// In sv, this message translates to:
  /// **'040 33 15 86'**
  String get triangleAddictionClinicNumber;

  /// No description provided for @thePolice.
  ///
  /// In sv, this message translates to:
  /// **'Polisen'**
  String get thePolice;

  /// No description provided for @thePoliceInfo.
  ///
  /// In sv, this message translates to:
  /// **'Arbetar förebyggande genom projektet Trygg krog i syfte att förekomma brottslighet som exempelvis sexuella trakasserier i krogmiljö. Ger information och hjälp om hur det går till när man anmäler att någon utsatt en för sexuella trakasserier. Kontaktas på 114 14 vid akut hjälp.'**
  String get thePoliceInfo;

  /// No description provided for @contact.
  ///
  /// In sv, this message translates to:
  /// **'Kontaktas på'**
  String get contact;

  /// No description provided for @forUrgentHelp.
  ///
  /// In sv, this message translates to:
  /// **'vid akut hjälp.'**
  String get forUrgentHelp;

  /// No description provided for @hereForYou.
  ///
  /// In sv, this message translates to:
  /// **'Vi finns här för dig!'**
  String get hereForYou;

  /// No description provided for @hereForYouInfo.
  ///
  /// In sv, this message translates to:
  /// **'Förutom de personer vi har presenterat för dig ovan kan du naturligtvis vända dig till oss i Föset eller dina faddrar.\n\nOm du eller någon annan har blivit illa behandlad eller känt sig obekväm under en nollningsaktivitet, säg då till. Berätta för en fadder eller någon i Föset. Vi tar din upplevelse på största allvar och ska se till att du kan känna dig trygg i alla nollningssituationer. Nollningen ska vara en säker och trygg plats för alla.'**
  String get hereForYouInfo;

  /// No description provided for @hereForYouReachUs.
  ///
  /// In sv, this message translates to:
  /// **'Våra nummer hittar du om du klickar på telefon-ikonen som finns i appen. Du kan även nå oss via mail:'**
  String get hereForYouReachUs;

  /// No description provided for @hereForYouTakeCare.
  ///
  /// In sv, this message translates to:
  /// **'Ta hand om dig! <3'**
  String get hereForYouTakeCare;

  /// No description provided for @overfosEmail.
  ///
  /// In sv, this message translates to:
  /// **'overfos@fsektionen.se'**
  String get overfosEmail;

  /// No description provided for @fosetEmail.
  ///
  /// In sv, this message translates to:
  /// **'foset@fsektionen.se'**
  String get fosetEmail;

  /// No description provided for @nationsInfo.
  ///
  /// In sv, this message translates to:
  /// **'I Lund finns något som kallas Nationer. De är på samma sätt som sektioner föreningar drivna av studenter vid universitetet men till skillnad från sektioner är nationerna inte bundna till en utbildning och står inte under en kår. Många nationer grundades på 1600-talet, den allra senaste grundades 1928. I Lund finns det 13 nationer och man väljer fritt vilken nation man vill gå med i. Nationerna anordnar fester, pubar, lunch och middagsrestaurang och många andra aktiviteter. När man inte har novischförtur längre på AF Bostäder måste man vara medlem i Studentlund och därigenom en Nation för att få bo på AFB. Läs mer på:'**
  String get nationsInfo;

  /// No description provided for @nationsWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://www.studentlund.se'**
  String get nationsWebsite;

  /// No description provided for @guildsInfo.
  ///
  /// In sv, this message translates to:
  /// **'Lunds Universitet, LU, består av flera olika fakulteter bland vilka Lunds tekniska högskola, LTH, är störst. Till varje fakultet hör en kår och för oss på LTH är det Teknologkåren som förkortas TLTH. Teknologkåren är uppdelad i elva så kallade sektioner där varje sektion innefattar ett eller flera utbildningsprogram. Alla sektioner på LTH drivs som ideella föreningar med hjälp av de studenter som studerar på utbildningarna sektionen omfattar. F-sektionen, som du tillhör, innefattar utbildningarna Teknisk Fysik (F), Teknisk Matematik (π) och Teknisk Nanovetenskap (n). Det är din sektion som anordnar din nollning. Det är även den som har hand om alla programspecifika frågor, oavsett om de gäller studier, näringslivskontakt, fritidsaktiviteter eller annat roligt du kan tänka dig att hitta på under din tid på F-sektionen. Under nollningen är det lättast att känna igen andra sektioner på dess overaller då färgen på overallen är samma som sin sektionsfärg. Sektionerna inom TLTH räknas traditionellt upp i kronologisk ordning enligt: F E M V A K D DOKT Ing W I.'**
  String get guildsInfo;

  /// No description provided for @utskottWebsite.
  ///
  /// In sv, this message translates to:
  /// **'https://fsektionen.se/utskott'**
  String get utskottWebsite;

  /// No description provided for @missions.
  ///
  /// In sv, this message translates to:
  /// **'UPPDRAG'**
  String get missions;

  /// No description provided for @unlimited.
  ///
  /// In sv, this message translates to:
  /// **'Oändligt'**
  String get unlimited;

  /// No description provided for @eventNoSignup.
  ///
  /// In sv, this message translates to:
  /// **'Ingen anmälan behövs'**
  String get eventNoSignup;

  /// No description provided for @eventHasLottery.
  ///
  /// In sv, this message translates to:
  /// **'Platser lottas'**
  String get eventHasLottery;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'sv'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sv':
      return AppLocalizationsSv();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
