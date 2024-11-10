import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator_plus/translator_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  GoogleTranslator translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  TextEditingController userInputcontroller=TextEditingController();
  stt.SpeechToText speechToText = stt.SpeechToText();
  RxString leftLanguage = "English".obs;
  RxString fromLanguage = 'en'.obs;
  RxString rightLanguage = "Bangla".obs;
  RxString toLanguage = 'bn'.obs;
  RxString inputText = ''.obs;
  RxString translatedText = ''.obs;
  RxBool isSpeaking = false.obs;
  RxBool isListening = false.obs;

  //==========================Swap Language==================================//
  void swapLanguages() {
    String tempCode = leftLanguage.value;
    String tempLang = fromLanguage.value;
    leftLanguage.value = rightLanguage.value;
    fromLanguage.value = toLanguage.value;
    rightLanguage.value = tempCode;
    toLanguage.value = tempLang;
  }

  //=========================Translated Function==========================//
  void translate() async {
    if (inputText.value.isNotEmpty) {
      var translation = await translator.translate(
        inputText.value,
        from: fromLanguage.value,
        to: toLanguage.value,
      );
      translatedText.value = translation.text;
    }
  }

  //========================Clear Text ===================================//

  void clearText() {
    userInputcontroller.clear();
    inputText.value = '';
    translatedText.value = '';
  }

  //====================== speech to text================================//

  void startListening(String fromLanguage) async {
    var microphonePermission = await Permission.microphone.status;
    if (microphonePermission.isGranted) {

      bool available = await speechToText.initialize();
      if (available) {
        isListening.value = true;
        speechToText.listen(
          onResult: (result) {
            inputText.value = result.recognizedWords;
            userInputcontroller.text = result.recognizedWords;
          },
          localeId: fromLanguage == 'bn' ? 'bn_BD' : 'en_US',
        );
      }
    } else {

      await Permission.microphone.request();
    }

  }

  void stopListening() {
    speechToText.stop();
    isListening.value = false;  // Stop listening
  }

  //==========================text to speech==============================//

  void textToSpeech() async {
    if (isSpeaking.value) {
      await flutterTts.stop();
      isSpeaking.value = false;
    } else {
      if (translatedText.isNotEmpty) {
        await flutterTts.setLanguage(
            toLanguage.value == 'bn' ? 'bn-BD' : 'en-US'); // Set language
        await flutterTts.speak(translatedText.value);
        isSpeaking.value = true;
      }
    }
  }

  //=======================Copy Clipboard =============================//

  void copyToClipboard() {
    if (translatedText.isEmpty) {
      Fluttertoast.showToast(msg: "Text is Empty..");
    } else {
      Clipboard.setData(ClipboardData(text: translatedText.value));
      Fluttertoast.showToast(msg: "Copy successful");
    }
  }

  //=====================share translated text=========================//
  void shareTranslatedText() {
    if (translatedText.isEmpty) {
      Fluttertoast.showToast(msg: "Text is empty");
    } else {
      Share.share(translatedText.value);
    }
  }

  //============Drawer Menu=================
  var appReviewUrl = 'https://play.google.com/store/apps/details?id=com.translationvoice.englishtobengali';
  var privacyUrl = 'https://sites.google.com/view/englishtobengali';
  var appShareUrl = 'Download Link:\nhttps://play.google.com/store/apps/details?id=com.translationvoice.englishtobengali';

  //declare method
  launchAppReview() async {
    final Uri url = Uri.parse(appReviewUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  launchPrivacy() async {
    final Uri url = Uri.parse(privacyUrl);
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }






  //=================================onInit=============================//
  @override
  void onInit() {
    super.onInit();
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });
  }
}
