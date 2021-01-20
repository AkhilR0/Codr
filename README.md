# Codr

Codr is a professional social media application, catered specifically to those in the software engineering industry.

### How did we make it?
We used the flutter SDK to create this app, it deploys for both android and ios. This was made for 2020-21 FBLA Mobile Application Development.
### Copyright
All trademarks, intellectual properties and copyrights are of their respective owners, we do not claim ownership to any of them.

## How to install
Go to build/app/outputs and select which one you would like to run on your device and download it.

## iOS Install
This guide provides a step-by-step walkthrough of releasing a
Flutter app to the [App Store][appstore] and [TestFlight][].


## Preliminaries

Before beginning the process of releasing your app,
ensure that it meets
Apple's [App Review Guidelines][appreview].

In order to publish your app to the App Store,
you must first enroll in the
[Apple Developer Program][devprogram].
You can read more about the various
membership options in Apple's
[Choosing a Membership][devprogram_membership] guide.

## Register your app on App Store Connect

Manage your app's life cycle on
[App Store Connect][appstoreconnect] (formerly iTunes Connect).
You define your app name and description, add screenshots,
set pricing, and manage releases to the App Store and TestFlight.

Registering your app involves two steps: registering a unique
Bundle ID, and creating an application record on App Store Connect.

For a detailed overview of App Store Connect, see the
[App Store Connect][appstoreconnect_guide] guide.

### Register a Bundle ID

Every iOS application is associated with a Bundle ID,
a unique identifier registered with Apple.
To register a Bundle ID for your app, follow these steps:

1. Open the [App IDs][devportal_appids] page of your developer account.
1. Click **+** to create a new Bundle ID.
1. Enter an app name, select **Explicit App ID**, and enter an ID.
1. Select the services your app uses, then click **Continue**.
1. On the next page, confirm the details and click **Register**
   to register your Bundle ID.

### Create an application record on App Store Connect

Register your app on App Store Connect:

1. Open [App Store Connect][appstoreconnect_login] in your browser.
1. On the App Store Connect landing page, click **My Apps**.
1. Click **+** in the top-left corner of the My Apps page,
   then select **New App**.
1. Fill in your app details in the form that appears.
   In the Platforms section, ensure that iOS is checked.
   Since Flutter does not currently support tvOS,
   leave that checkbox unchecked. Click **Create**.
1. Navigate to the application details for your app and select
   **App Information** from the sidebar.
1. In the General Information section, select the Bundle ID
   you registered in the preceding step.

For a detailed overview,
see [Add an app to your account][appstoreconnect_guide_register].

## Review Xcode project settings

This step covers reviewing the most important settings
in the Xcode workspace.
For detailed procedures and descriptions, see
[Prepare for app distribution][distributionguide_config].

Navigate to your target's settings in Xcode:

1. In Xcode, open `Runner.xcworkspace` in your app's `ios` folder.
1. To view your app's settings, select the **Runner** project in the Xcode
   project navigator. Then, in the main view sidebar, select the **Runner**
   target.
1. Select the **General** tab.

Verify the most important settings.

In the **Identity** section:

`Display Name`
: The display name of your app.

`Bundle Identifier`
: The App ID you registered on App Store Connect.

In the **Signing & Capabilities** section:

`Automatically manage signing`
: Whether Xcode should automatically manage app signing
  and provisioning.  This is set `true` by default, which should
  be sufficient for most apps. For more complex scenarios,
  see the [Code Signing Guide][codesigning_guide].

`Team`
: Select the team associated with your registered Apple Developer
  account. If required, select **Add Account...**,
  then update this setting.

In the **Build Settings** section:

`iOS Deployment Target`
: The minimum iOS version that your app supports.
  Flutter supports iOS 8.0 and later. If your app includes
  Objective-C or Swift code that makes use of APIs that
  were unavailable in iOS 8, update this setting appropriately.

The **General** tab of your project settings should resemble
the following:

![Xcode Project Settings](/images/releaseguide/xcode_settings.png){:width="100%"}

For a detailed overview of app signing, see
[Create, export, and delete signing certificates][appsigning].

## Updating the app's deployment version
If you changed `Deployment Target` in your Xcode project,
open `ios/Flutter/AppframeworkInfo.plist` in your Flutter app
and update the `MinimumOSVersion` value to match.

## Updating the app's version number

The default version number of the app is `1.0.0`.
To update it, navigate to the `pubspec.yaml` file
and update the following line:

`version: 1.0.0+1`

The version number is three numbers separated by dots,
such as `1.0.0` in the example above, followed by an optional
build number such as `1` in the example above, separated by a `+`.

Both the version and the build number may be overridden in Flutter's
build by specifying `--build-name` and `--build-number`,
respectively.

In iOS, `build-name` uses `CFBundleShortVersionString`
while `build-number` uses `CFBundleVersion`.
Read more about iOS versioning at [Core Foundation Keys][]
on the Apple Developer's site.

## Add an app icon

When a new Flutter app is created, a placeholder icon set is created.
This step covers replacing these placeholder icons with your
app's icons:

1. Review the [iOS App Icon][appicon] guidelines.
1. In the Xcode project navigator, select `Assets.xcassets` in the
   `Runner` folder. Update the placeholder icons with your own app icons.
1. Verify the icon has been replaced by running your app using
   `flutter run`.

## Create a build archive

This step covers creating a build archive and uploading
your build to App Store Connect.

During development, you've been building, debugging, and testing
with _debug_ builds. When you're ready to ship your app to users
on the App Store or TestFlight, you need to prepare a _release_ build.
At this point, you might consider [obfuscating your Dart code][]
to make it more difficult to reverse engineer. Obfuscating
your code involves adding a couple flags to your build command.

On the command line, follow these steps in your application directory:

1. Run `flutter build ios` to create a release build
   (`flutter build` defaults to `--release`).
1. To ensure that Xcode refreshes the release mode configuration,
   close and re-open your Xcode workspace.
   For Xcode 8.3 and later, this step is not required.

In Xcode, configure the app version and build:

1. In Xcode, open `Runner.xcworkspace` in your app's `ios` folder.
1. Select **Product > Scheme > Runner**.
1. Select **Product > Destination > Any iOS Device**.
1. Select **Runner** in the Xcode project navigator, then select the
   **Runner** target in the settings view sidebar.
1. In the Identity section, update the **Version** to the user-facing
   version number you wish to publish.
1. In the Identity section, update the **Build** identifier to a unique
   build number used to track this build on App Store Connect.
   Each upload requires a unique build number.

Finally, create a build archive and upload it to App Store Connect:

<ol markdown="1">
<li markdown="1">

Select **Product > Archive** to produce a build archive.

{{site.alert.note}}
  On Flutter version 1.24.0-6.0 and later you can create an
  archive by instead running `flutter build ipa`.
  Then open `build/ios/archive/MyApp.xcarchive` in Xcode to
  validate and distribute your app.
  See `flutter build ipa -h` for available flags.
{{site.alert.end}}

</li>
<li markdown="1">

In the sidebar of the Xcode Organizer window, select your iOS app,
then select the build archive you just produced.

</li>
<li markdown="1">

Click the **Validate App** button. If any issues are reported,
address them and produce another build. You can reuse the same
build ID until you upload an archive.

</li>
<li markdown="1">

After the archive has been successfully validated, click
**Distribute App**. You can follow the status of your build in the
Activities tab of your app's details page on
[App Store Connect][appstoreconnect_login].

{{site.alert.note}}
  When you export your app at the end of **Distribute App**,
  Xcode will create a directory containing
  an IPA of your app and an `ExportOptions.plist` file.
  On Flutter version 1.24.0-6.0 and later you can
  create new IPAs with the same options without launching
  Xcode by running
  `flutter build ipa --export-options-plist=path/to/ExportOptions.plist`.
  See `xcodebuild -h` for details about the keys in this property list.
{{site.alert.end}}

</li>
</ol>

You should receive an email within 30 minutes notifying you that
your build has been validated and is available to release to testers
on TestFlight. At this point you can choose whether to release
on TestFlight, or go ahead and release your app to the App Store.

For more details, see
[Upload an app to App Store Connect][distributionguide_upload].

## Release your app on TestFlight

[TestFlight][] allows developers to push their apps
to internal and external testers. This optional step
covers releasing your build on TestFlight.

1. Navigate to the TestFlight tab of your app's application
   details page on [App Store Connect][appstoreconnect_login].
1. Select **Internal Testing** in the sidebar.
1. Select the build to publish to testers, then click **Save**.
1. Add the email addresses of any internal testers.
   You can add additional internal users in the **Users and Roles**
   page of App Store Connect,
   available from the dropdown menu at the top of the page.

For more details, see [Distribute an app using TestFlight]
[distributionguide_testflight].

## Release your app to the App Store

When you're ready to release your app to the world,
follow these steps to submit your app for review and
release to the App Store:

1. Select **Pricing and Availability** from the sidebar of your app's
   application details page on
   [App Store Connect][appstoreconnect_login] and complete the
   required information.
1. Select the status from the sidebar. If this is the first
   release of this app, its status is
   **1.0 Prepare for Submission**. Complete all required fields.
1. Click **Submit for Review**.

Apple notifies you when their app review process is complete.
Your app is released according to the instructions you
specified in the **Version Release** section.

For more details, see
[Distribute an app through the App Store][distributionguide_submit].

## Troubleshooting

The [Distribute your app][distributionguide] guide provides a
detailed overview of the process of releasing an app to the App Store.


[appicon]: https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/app-icon/
[appreview]: https://developer.apple.com/app-store/review/
[appsigning]: https://help.apple.com/xcode/mac/current/#/dev154b28f09
[appstore]: https://developer.apple.com/app-store/submissions/
[appstoreconnect]: https://developer.apple.com/support/app-store-connect/
[appstoreconnect_guide]: https://developer.apple.com/support/app-store-connect/
[appstoreconnect_guide_register]: https://help.apple.com/app-store-connect/#/dev2cd126805
[appstoreconnect_login]: https://appstoreconnect.apple.com/
[codesigning_guide]: https://developer.apple.com/library/content/documentation/Security/Conceptual/CodeSigningGuide/Introduction/Introduction.html
[Core Foundation Keys]: https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
[devportal_appids]: https://developer.apple.com/account/ios/identifier/bundle
[devprogram]: https://developer.apple.com/programs/
[devprogram_membership]: https://developer.apple.com/support/compare-memberships/
[distributionguide]: https://help.apple.com/xcode/mac/current/#/dev8b4250b57
[distributionguide_config]: https://help.apple.com/xcode/mac/current/#/dev91fe7130a
[distributionguide_submit]: https://help.apple.com/xcode/mac/current/#/dev067853c94
[distributionguide_testflight]: https://help.apple.com/xcode/mac/current/#/dev2539d985f
[distributionguide_upload]: https://help.apple.com/xcode/mac/current/#/dev442d7f2ca
[obfuscating your Dart code]: /docs/deployment/obfuscate
[TestFlight]: https://developer.apple.com/testflight/

## Android Install
When you're ready to prepare a _release_ version of your app,
for example to [publish to the Google Play Store][play],
this page can help. Before publishing,
you might want to put some finishing touches on your app.
This page covers the following topics:

* [Adding a launcher icon](#adding-a-launcher-icon)
* [Signing the app](#signing-the-app)
* [Shrinking your code with R8](#shrinking-your-code-with-r8)
* [Reviewing the app manifest](#reviewing-the-app-manifest)
* [Reviewing the build configuration](#reviewing-the-build-configuration)
* [Building the app for release](#building-the-app-for-release)
* [Publishing to the Google Play Store](#publishing-to-the-google-play-store)
* [Updating the app's version number](#updating-the-apps-version-number)
* [Android release FAQ](#android-release-faq)

## Adding a launcher icon

When a new Flutter app is created, it has a default launcher icon.
To customize this icon, you might want to check out the
[flutter_launcher_icons][] package.

Alternatively, you can do it manually using the following steps:

1. Review the [Material Design product
   icons][launchericons] guidelines for icon design.

1. In the `<app dir>/android/app/src/main/res/` directory,
   place your icon files in folders named using
   [configuration qualifiers][].
   The default `mipmap-` folders demonstrate the correct
   naming convention.

1. In `AndroidManifest.xml`, update the
   [`application`][applicationtag] tag's `android:icon`
   attribute to reference icons from the previous
   step (for example,
   `<application android:icon="@mipmap/ic_launcher" ...`).

1. To verify that the icon has been replaced,
   run your app and inspect the app icon in the Launcher.

## Signing the app

To publish on the Play Store, you need to give your app a digital
signature. Use the following instructions to sign your app.

### Create a keystore

If you have an existing keystore, skip to the next step.
If not, create one by running the following at the command line:

On Mac/Linux, use the following command:

```terminal
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

On Windows, use the following command:

```terminal
keytool -genkey -v -keystore c:\Users\USER_NAME\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

This command stores the `key.jks` file in your home
directory. If you want to store it elsewhere, change
the argument you pass to the `-keystore` parameter.
**However, keep the `keystore` file private;
don't check it into public source control!**

{{site.alert.note}}
* The `keytool` command might not be in your path&mdash;it's
  part of Java, which is installed as part of
  Android Studio.  For the concrete path,
  run `flutter doctor -v` and locate the path printed after
  'Java binary at:'. Then use that fully qualified path
  replacing `java` (at the end) with `keytool`.
  If your path includes space-separated names,
  such as `Program Files`, use platform-appropriate
  notation for the names. For example, on Mac/Linux
  use `Program\ Files`, and on Windows use
  `"Program Files"`.

* The `-storetype JKS` tag is only required for Java 9
  or newer. As of the Java 9 release,
  the keystore type defaults to PKS12.
{{site.alert.end}}

### Reference the keystore from the app

Create a file named `<app dir>/android/key.properties`
that contains a reference to your keystore:

```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=<location of the key store file, such as /Users/<user name>/key.jks>
```

{{site.alert.warning}}
  Keep the `key.properties` file private;
  don't check it into public source control.
{{site.alert.end}}

### Configure signing in gradle

Configure signing for your app by editing the
`<app dir>/android/app/build.gradle` file.

<ol markdown="1">
<li markdown="1"> Add code before `android` block:

```
   android {
      ...
   }
```

   With the keystore information from your properties file:

```
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }

   android {
         ...
   }
```

   Load the `key.properties` file into the `keystoreProperties` object.

</li>

<li markdown="1"> Add code before `buildTypes` block:

```
   buildTypes {
       release {
           // TODO: Add your own signing config for the release build.
           // Signing with the debug keys for now,
           // so `flutter run --release` works.
           signingConfig signingConfigs.debug
       }
   }
```

   With the signing configuration info:

```
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }
```

   Configure the `signingConfigs` block in your module's `build.gradle` file.

</li>
</ol>

Release builds of your app will now be signed automatically.

{{site.alert.note}}
  You may need to run `flutter clean` after changing the gradle file.
  This prevents cached builds from affecting the signing process.
{{site.alert.end}}

For more information on signing your app, see
[Sign your app][] on developer.android.com.

## Shrinking your code with R8

[R8][] is the new code shrinker from Google, and it's enabled by default
when you build a release APK or AAB. To disable R8, pass the `--no-shrink`
flag to `flutter build apk` or `flutter build appbundle`.

{{site.alert.note}}
  Obfuscation and minification can considerably extend compile time
  of the Android application.
{{site.alert.end}}

## Reviewing the app manifest

Review the default [App Manifest][manifest] file,
`AndroidManifest.xml`,
located in `<app dir>/android/app/src/main` and verify that the values
are correct, especially the following:

`application`
: Edit the `android:label` in the
  [`application`][applicationtag] tag to reflect
  the final name of the app.

`uses-permission`
: Add the `android.permission.INTERNET`
  [permission][permissiontag] if your application code needs Internet
  access. The standard template does not include this tag but allows
  Internet access during development to enable communication between
  Flutter tools and a running app.

## Reviewing the build configuration

Review the default [Gradle build file][gradlebuild] file,
`build.gradle`, located in `<app dir>/android/app` and
verify the values are correct, especially the following
values in the `defaultConfig` block:

`applicationId`
: Specify the final, unique (Application Id)[appid]

`versionCode` & `versionName`
: Specify the internal app version number,
  and the version number display string. You can do this by setting
  the `version` property in the pubspec.yaml file. Consult the version
  information guidance in the [versions documentation][versions].

`minSdkVersion`, `compilesdkVersion`, & `targetSdkVersion`
: Specify the minimum API level,
  the API level on which the app was compiled,
  and the maximum API level on which the app is designed to run.
  Consult the API level section in the [versions documentation][versions]
  for details.
`buildToolsVersion`
: Specify the version of Android SDK Build Tools that your app uses.
  Alternatively, you can use the [Android Gradle Plugin] in Android Studio,
  which will automatically import the minimum required Build Tools for your app
  without the need for this property.

## Building the app for release

You have two possible release formats when publishing to
the Play Store.

* App bundle (preferred)
* APK

{{site.alert.note}}
  The Google Play Store prefers the app bundle format.
  For more information, see [Android App Bundle][bundle] and
  [About Android App Bundles][bundle2].
{{site.alert.end}}

{{site.alert.warning}}
  Recently, the Flutter team has received [several reports][crash-issue]
  from developers indicating they are experiencing app
  crashes on certain devices on Android 6.0. If you are targeting
  Android 6.0, use the following steps:

  * If you build an App Bundle
    Edit `android/gradle.properties` and add the flag:
    `android.bundle.enableUncompressedNativeLibs=false`.

  * If you build an APK
    Make sure `android/app/src/AndroidManifest.xml`
    doesn't set `android:extractNativeLibs=false`
    in the `<application>` tag.

  For more information, see the [public issue][crash-issue].
{{site.alert.end}}

### Build an app bundle

This section describes how to build a release app bundle.
If you completed the signing steps,
the app bundle will be signed.
At this point, you might consider [obfuscating your Dart code][]
to make it more difficult to reverse engineer. Obfuscating
your code involves adding a couple flags to your build command,
and maintaining additional files to de-obfuscate stack traces.

From the command line:

1. Enter `cd <app dir>`<br>
   (Replace `<app dir>` with your application's directory.)
1. Run `flutter build appbundle`<br>
   (Running `flutter build` defaults to a release build.)

The release bundle for your app is created at
`<app dir>/build/app/outputs/bundle/release/app.aab`.

By default, the app bundle contains your Dart code and the Flutter
runtime compiled for [armeabi-v7a][] (ARM 32-bit), [arm64-v8a][]
(ARM 64-bit), and [x86-64][] (x86 64-bit).

### Test the app bundle

An app bundle can be tested in multiple ways&mdash;this section
describes two.

#### Offline using the bundle tool

1. If you haven't done so already, download `bundletool` from the
   [GitHub repository][].
1. [Generate a set of APKs][apk-set] from your app bundle.
1. [Deploy the APKs][apk-deploy] to connected devices.

#### Online using Google Play

1. Upload your bundle to Google Play to test it.
   You can use the internal test track,
   or the alpha or beta channels to test the bundle before
   releasing it in production.
2. Follow [these steps to upload your bundle][upload-bundle]
   to the Play Store.

### Build an APK

Although app bundles are preferred over APKs, there are stores
that don't yet support app bundles. In this case, build a release
APK for each target ABI (Application Binary Interface).

If you completed the signing steps,
the APK will be signed.
At this point, you might consider [obfuscating your Dart code][]
to make it more difficult to reverse engineer. Obfuscating
your code involves adding a couple flags to your build command.

From the command line:

1. Enter `cd <app dir>`<br>
   (Replace `<app dir>` with your application's directory.)
1. Run `flutter build apk --split-per-abi`<br>
   (The `flutter build` command defaults to `--release`.)

This command results in three APK files:

* `<app dir>/build/app/outputs/apk/release/app-armeabi-v7a-release.apk`
* `<app dir>/build/app/outputs/apk/release/app-arm64-v8a-release.apk`
* `<app dir>/build/app/outputs/apk/release/app-x86_64-release.apk`

Removing the `--split-per-abi` flag results in a fat APK that contains
your code compiled for _all_ the target ABIs. Such APKs are larger in
size than their split counterparts, causing the user to download
native binaries that are not applicable to their device's architecture.

### Install an APK on a device

Follow these steps to install the APK on a connected Android device.

From the command line:

1. Connect your Android device to your computer with a USB cable.
1. Enter `cd <app dir>` where `<app dir>` is your application directory.
1. Run `flutter install`.

## Publishing to the Google Play Store

For detailed instructions on publishing your app to the Google Play Store,
see the [Google Play launch][play] documentation.

## Updating the app's version number

The default version number of the app is `1.0.0`.
To update it, navigate to the `pubspec.yaml` file
and update the following line:

`version: 1.0.0+1`

The version number is three numbers separated by dots,
such as `1.0.0` in the example above, followed by an optional
build number such as `1` in the example above, separated by a `+`.

Both the version and the build number may be overridden in Flutter's
build by specifying `--build-name` and `--build-number`, respectively.

In Android, `build-name` is used as `versionName` while
`build-number` used as `versionCode`. For more information,
see [Version your app][] in the Android documentation.

After updating the version number in the pubspec file,
run `flutter pub get` from the top of the project, or
use the **Pub get** button in your IDE. This updates
the `versionName` and `versionCode` in the `local.properties` file,
which are later updated in the `build.gradle` file when you
rebuild the Flutter app.

## Android release FAQ

Here are some commonly asked questions about deployment for
Android apps.

### When should I build app bundles versus APKs?

The Google Play Store recommends that you deploy app bundles
over APKs because they allow a more efficient delivery of the
application to your users. However, if you’re distributing
your application by means other than the Play Store,
an APK may be your only option.

### What is a fat APK?

A [fat APK][] is a single APK that contains binaries for multiple
ABIs embedded within it. This has the benefit that the single APK
runs on multiple architectures and thus has wider compatibility,
but it has the drawback that its file size is much larger,
causing users to download and store more bytes when installing
your application. When building APKs instead of app bundles,
it is strongly recommended to build split APKs,
as described in [build an APK](#build-an-apk) using the
`--split-per-abi` flag.

### What are the supported target architectures?

When building your application in release mode,
Flutter apps can be compiled for [armeabi-v7a][] (ARM 32-bit),
[arm64-v8a][] (ARM 64-bit), and [x86-64][] (x86 64-bit).
Flutter does not currently support building for x86 Android
(See [Issue 9253][]).

### How do I sign the app bundle created by `flutter build appbundle`?

See [Signing the app](#signing-the-app).

### How do I build a release from within Android Studio?

In Android Studio, open the existing `android/`
folder under your app’s folder. Then,
select **build.gradle (Module: app)** in the project panel:

{% asset 'deployment/android/gradle-script-menu.png' width="100%" alt='screenshot of gradle build script menu' %}

Next, select the build variant. Click **Build > Select Build Variant**
in the main menu. Select any of the variants in the **Build Variants**
panel (debug is the default):

{% asset 'deployment/android/build-variant-menu.png' width="100%" alt='screenshot of build variant menu' %}

The resulting app bundle or APK files are located in
`build/app/outputs` within your app's folder.

{% comment %}
### Are there any special considerations with add-to-app?
{% endcomment %}

[apk-deploy]: {{site.android-dev}}/studio/command-line/bundletool#deploy_with_bundletool
[apk-set]: {{site.android-dev}}/studio/command-line/bundletool#generate_apks
[appid]: {{site.android-dev}}/studio/build/application-id
[applicationtag]: {{site.android-dev}}/guide/topics/manifest/application-element
[arm64-v8a]: {{site.android-dev}}/ndk/guides/abis#arm64-v8a
[armeabi-v7a]: {{site.android-dev}}/ndk/guides/abis#v7a
[bundle]: {{site.android-dev}}/platform/technology/app-bundle
[bundle2]: {{site.android-dev}}/guide/app-bundle
[configuration qualifiers]: {{site.android-dev}}/guide/topics/resources/providing-resources#AlternativeResources
[crash-issue]: https://issuetracker.google.com/issues/147096055
[fat APK]: https://en.wikipedia.org/wiki/Fat_binary
[Flutter wiki]: {{site.github}}/flutter/flutter/wiki
[flutter_launcher_icons]: {{site.pub}}/packages/flutter_launcher_icons
[GitHub repository]: {{site.github}}/google/bundletool/releases/latest
[gradlebuild]: {{site.android-dev}}/studio/build/#module-level
[Issue 9253]: {{site.github}}/flutter/flutter/issues/9253
[Issue 18494]: {{site.github}}/flutter/flutter/issues/18494
[launchericons]: {{site.material}}/design/iconography/
[manifest]: {{site.android-dev}}/guide/topics/manifest/manifest-intro
[manifesttag]: {{site.android-dev}}/guide/topics/manifest/manifest-element
[obfuscating your Dart code]: /docs/deployment/obfuscate
[permissiontag]: {{site.android-dev}}/guide/topics/manifest/uses-permission-element
[play]: {{site.android-dev}}/distribute/googleplay/start
[plugin]: {{site.android-dev}}/studio/releases/gradle-plugin
[R8]: {{site.android-dev}}/studio/build/shrink-code
[Sign your app]: https://developer.android.com/studio/publish/app-signing.html#generate-key
[upload-bundle]: {{site.android-dev}}/studio/publish/upload-bundle
[Version your app]: {{site.android-dev}}/studio/publish/versioning
[versions]: {{site.android-dev}}/studio/publish/versioning
[x86-64]: {{site.android-dev}}/ndk/guides/abis#86-64