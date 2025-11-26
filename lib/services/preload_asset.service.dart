import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

Future<void> preloadAssets(BuildContext context, String imageListName) async {
  var t = AppLocalizations.of(context)!;

  List<String> orgScreenImagePaths = [
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_paper.png",
    "assets/img/nollning-24/nolleguide/wood_background.png",
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_tlth.png",
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_freja.png",
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fortdesign.png",
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_fsek_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/introduction_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/cafe_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/spex.png",
    "assets/img/nollning-24/nolleguide/organization_tree/accounting_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/truth_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/conscience_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/guilds_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/management_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/nations_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/organisation.png",
    "assets/img/nollning-24/nolleguide/organization_tree/others_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/procession_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/culture_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/festivities_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/education_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/organization_tree/corporate_sv.png",
    "assets/img/nollning-24/nolleguide/organization_tree/facilities_${t.localeName}.png",
  ];

  List<String> nolleGuideScreenPaths = [
    "assets/img/nollning-24/nolleguide/nolleguidescreen_background.png",
    "assets/img/nollning-24/nolleguide/supportfunctions_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/wordlist_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/studentvett_${t.localeName}.png",
    "assets/img/nollning-24/nolleguide/nolleguidescreen_organisation.png",
    "assets/img/nollning-24/nolleguide/dresscodes_${t.localeName}.png",
  ];

  List<String> backgroundPaths = [
    "assets/img/nollning-24/nolleguide/organization_tree/orgscreen_paper.png",
    "assets/img/nollning-24/nolleguide/nolleguide_paper.png",
    "assets/img/nollning-24/nolleguide/wood_background.png",
    "assets/img/nollning-24/nolleguide/superlong_paper_background.png",
    "assets/img/nollning-24/nolleguide/superlong_wood_background.png",
  ];

  List<String> kladguidePaths = [
    "assets/img/nollning-24/nolleguide/nolleguide_paper.png",
    "assets/img/nollning-24/nolleguide/wood_background.png",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0105.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0159.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0165.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0171.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0094.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0090.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0142.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0134.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0131.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0120.jpg",
    "assets/img/nollning-24/nolleguide/kladguide/IMG_0149.jpg",
  ];

  List<String> teknologkarenPaths = [
    "assets/img/nollning-24/nolleguide/people/KO.jpg",
    "assets/img/nollning-24/nolleguide/people/NolleAm.jpg",
    "assets/img/nollning-24/nolleguide/people/Aktsam.jpg",
    "assets/img/nollning-24/nolleguide/people/SA.jpg",
    "assets/img/nollning-24/nolleguide/people/heltidare.png",
  ];

  List<String> fosetPaths = [
    "assets/img/nollning-24/nolleguide/people/cofosAlbin.jpg",
    "assets/img/nollning-24/nolleguide/people/cofosHanne.jpg",
    "assets/img/nollning-24/nolleguide/people/cofosLian.jpg",
    "assets/img/nollning-24/nolleguide/people/cofosLinnea.jpg",
    "assets/img/nollning-24/nolleguide/people/cofosLovisa.jpg",
    "assets/img/nollning-24/nolleguide/people/cofosThea.jpg",
    "assets/img/nollning-24/nolleguide/people/overfosMattis.jpg",
    "assets/img/nollning-24/nolleguide/people/extrafos.jpg",
    "assets/img/nollning-24/nolleguide/people/faddrar.png",
    "assets/img/nollning-24/nolleguide/people/peppare.png",
  ];

  List<String> managementPaths = [
    "assets/img/nollning-24/nolleguide/people/president.jpg",
    "assets/img/nollning-24/nolleguide/people/the_board.jpg",
    "assets/img/nollning-24/nolleguide/people/the_council_of_executives.png",
  ];

  List<String> culturePaths = [
    "assets/img/nollning-24/nolleguide/people/minister_culture.jpg",
    "assets/img/nollning-24/nolleguide/people/sports_foreman.png",
    "assets/img/nollning-24/nolleguide/people/Reisemeisters.jpg",
  ];

  List<String> truthPaths = [
    "assets/img/nollning-24/nolleguide/people/truth.jpg",
    "assets/img/nollning-24/nolleguide/people/web.jpg",
    "assets/img/nollning-24/nolleguide/people/fotograf.jpeg",
  ];

  List<String> imagePaths = [];

  switch (imageListName) {
    case "orgScreenImagePaths":
      imagePaths = orgScreenImagePaths;
      break;

    case "nolleGuideScreenPaths":
      imagePaths = nolleGuideScreenPaths;
      break;

    case "kladguidePaths":
      imagePaths = kladguidePaths;
      break;

    case "fosetPaths":
      imagePaths = fosetPaths;
      break;

    case "teknologkarenPaths":
      imagePaths = teknologkarenPaths;
      break;

    case "managementPaths":
      imagePaths = managementPaths;
      break;

    case "culturePaths":
      imagePaths = culturePaths;
      break;

    case "festivitiesPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/festivities.jpg",
      ];
      break;

    case "educationPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/education.jpg",
      ];
      break;

    case "accountingPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/Treasurer.jpg",
      ];
      break;

    case "cafePaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/Cafe.jpg",
      ];
      break;

    case "corporatePaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/FNU.jpg",
        "assets/img/nollning-24/nolleguide/people/FARAD.jpg",
      ];
      break;

    case "facilitiesPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/pryl.jpg",
      ];
      break;

    case "consciencePaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/conscience.png",
        "assets/img/nollning-24/nolleguide/people/libo.jpg",
      ];
      break;

    case "truthPaths":
      imagePaths = truthPaths;
      break;

    case "processionPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/medalj.jpg",
      ];
      break;

    case "frejaPaths":
      imagePaths = [
        "assets/img/nollning-24/nolleguide/people/FREJA.jpeg",
      ];
      break;

    case "backgroundPaths":
      imagePaths = backgroundPaths;
      break;

    case "schedulePaths":
      imagePaths = ["assets/data/nollning_25/schema/schedulescreen_${t.localeName}.png"];
      break;

    case "supportPaths":
      imagePaths = backgroundPaths + ["assets/img/nollning-24/nolleguide/supp.jpg"];
  }

  for (String path in imagePaths) {
    await precacheImage(AssetImage(path), context);
  }
}
