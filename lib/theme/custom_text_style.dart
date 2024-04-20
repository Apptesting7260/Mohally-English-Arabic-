import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLarge18 => theme.textTheme.bodyLarge!.copyWith(
        fontSize: 18.fSize,
      );
  static get bodyLargeGray50001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeGray5000118 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
        fontSize: 18.fSize,
      );
  static get bodyLargeGray50001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001.withOpacity(0.7),
      );
  static get bodyLargeGray50001_2 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeGray50001_3 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeInterGray50001 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray50001,
      );
  static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeLight_1 => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeOnError => theme.textTheme.bodyLarge!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      );
  static get bodyLargeOnError_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 18.fSize,
      );
  static get bodyLargePrimary17 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
      );
  static get bodyLargeWhiteA70002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA70002,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumGray90001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyMediumGray9000115 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
        fontSize: 15.fSize,
      );
  static get bodyMediumGray90001Light => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumGray90001Light_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumGray90001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyMediumGreen40002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.green40002,
      );
  static get bodyMediumInter => theme.textTheme.bodyMedium!.inter;
  static get bodyMediumInterGray90001 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyMediumInterWhiteA70001 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 15.fSize,
      );
  static get bodyMediumJostGray90001 =>
      theme.textTheme.bodyMedium!.jost.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyMediumJostGray90001_1 =>
      theme.textTheme.bodyMedium!.jost.copyWith(
        color: appTheme.gray90001,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumPrimary13 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
      );
  static get bodyMediumPrimary_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumRed700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red700,
      );
  static get bodyMediumWhiteA70002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA70002,
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmall12_1 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900,
        fontSize: 12.fSize,
      );
  static get bodySmallGray90001 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90001,
      );
  static get bodySmallGray9000112 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90001,
        fontSize: 12.fSize,
      );
  static get bodySmallInter => theme.textTheme.bodySmall!.inter.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallInter12 => theme.textTheme.bodySmall!.inter.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallInterErrorContainer =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
      );
  static get bodySmallInterGray90001 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.gray90001,
        fontSize: 12.fSize,
      );
  static get bodySmallInterPrimary => theme.textTheme.bodySmall!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallInterWhiteA70002 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.whiteA70002,
      );
  static get bodySmallInter_1 => theme.textTheme.bodySmall!.inter;
  static get bodySmallSecondaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 11.fSize,
      );
  static get bodySmallWhiteA70002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 12.fSize,
      );
  // Display text style
  static get displaySmallGray90001 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.gray90001,
        fontSize: 36.fSize,
      );
  static get displaySmallSemiBold => theme.textTheme.displaySmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Headline text style
  static get headlineMediumJostTeal300 =>
      theme.textTheme.headlineMedium!.jost.copyWith(
        color: appTheme.teal300,
        fontSize: 26.fSize,
      );
  static get headlineMediumMedium => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 26.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumPrimary => theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get headlineMediumWhiteA70002 =>
      theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 26.fSize,
        fontWeight: FontWeight.w700,
      );
  static get headlineSmallInterErrorContainer =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallInterErrorContainerExtraBold =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallInterPrimary =>
      theme.textTheme.headlineSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );
  static get headlineSmallLeagueSpartan =>
      theme.textTheme.headlineSmall!.leagueSpartan.copyWith(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallLeagueSpartan24 =>
      theme.textTheme.headlineSmall!.leagueSpartan.copyWith(
        fontSize: 24.fSize,
      );
  static get headlineSmallLeagueSpartanSemiBold =>
      theme.textTheme.headlineSmall!.leagueSpartan.copyWith(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLargeGray50001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter;
  static get labelLargeInterPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeInterPrimarySemiBold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterSemiBold =>
      theme.textTheme.labelLarge!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterWhiteA70001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 13.fSize,
      );
  static get labelLargeInterWhiteA70002 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.whiteA70002,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeWhiteA70001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 13.fSize,
      );
  static get labelLargeWhiteA70002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeWhiteA70002_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA70002,
      );
  static get labelMediumGray90001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray90001,
      );
  static get labelMediumLeagueSpartanPrimary =>
      theme.textTheme.labelMedium!.leagueSpartan.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumLeagueSpartanPrimarySemiBold =>
      theme.textTheme.labelMedium!.leagueSpartan.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumSFProTextGray90001 =>
      theme.textTheme.labelMedium!.sFProText.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumSFProTextGray90001Bold =>
      theme.textTheme.labelMedium!.sFProText.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumSFProTextGray90001Bold_1 =>
      theme.textTheme.labelMedium!.sFProText.copyWith(
        color: appTheme.gray90001,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );
  static get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeMedium => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 23.fSize,
      );
  static get titleLargeWhiteA70002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70002,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA7000220 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 20.fSize,
      );
  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMedium16_1 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMedium16_2 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
      );
  static get titleMediumGray50001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 16.fSize,
      );
  static get titleMediumInter => theme.textTheme.titleMedium!.inter.copyWith(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumInterWhiteA70002 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.whiteA70002,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumInterWhiteA70002ExtraBold =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.whiteA70002,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimary16 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static get titleMediumPrimary16_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static get titleMediumPrimaryMedium => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimary_2 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleMediumWhiteA70002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70002,
      );
  static get titleMediumWhiteA7000216 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70002,
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA70002Bold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70002,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA70016 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 16.fSize,
      );
  static get titleMedium_1 => theme.textTheme.titleMedium!;
  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );
  static get titleSmallGray50001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
      );
  static get titleSmallInterGray50001 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray50001,
        fontSize: 15.fSize,
      );
  static get titleSmallInterPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
      );
  static get titleSmallInterPrimarySemiBold =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterWhiteA70001 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterWhiteA7000115 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 15.fSize,
      );
  static get titleSmallJostPrimary => theme.textTheme.titleSmall!.jost.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallMetropolisWhiteA70002 =>
      theme.textTheme.titleSmall!.metropolis.copyWith(
        color: appTheme.whiteA70002,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimaryBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimarySemiBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold_1 => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallWhiteA70002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA70002,
      );
}

extension on TextStyle {
  TextStyle get metropolis {
    return copyWith(
      fontFamily: 'Metropolis',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }

  TextStyle get leagueSpartan {
    return copyWith(
      fontFamily: 'League Spartan',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
}
