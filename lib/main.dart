import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

const _readinitial = r'''
{
  "type": "service_account",
  "project_id": "adroit-flare-455408-s0",
  "private_key_id": "58fd6f05aa5eea73a70fe52067df4033d054dac8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCg1QKDUW8FJFbR\n6TvpPD27mdGxZoou1Ul4m8yyVu5vW3mjortJffIcDHtkyvizGc052yQPRHyY5d2X\ni+WPqQJTOqmOilJDXaOxLVrqu9DcN5ZCjgPgBOIxsenTdpt9xF8kekdxLc3nfcWf\nVXHScQdAxC/tkpJD6VSBPmhSKEQLYTjG/gB7v1VWWyZZt1phPO1PMO72NosbQ1mL\nrHaV5211/KI0lDVGvxv4Cisy9goLH/TY8OMuk/uyBsW+ZDrNloMIGKbPodTAyIYd\naqdNmPiiUKoVZBU8kH/8QioeZ+FYktXH8vPUnbCc1qUFSxnxE/H/UQgmj8IpDeXF\nF6c5IyFXAgMBAAECggEABGSNAwUwYRWTAXy7VC1/CiazYYMJdyoALbkjqCNTs9rt\nwZhqQSGdgUKeBCy/CjVEM7ZWj8wxEwQEP2Vkyb22AIvzoZ8JjCl8lRRGDW8/zyP9\niKfUV0QK4YyYdFwi9xZr+tUUKnUz0ITQ5v8wcqz/o7c4D+cW85/l3PnVY5kR8rWT\n8XpyucKA/QN351KgrFWll7mV9b0FTVMg3kppLEHQDZBgD3IMsulXrGpjPRpj1iLL\nd2PSW7ThqMeZ9OfwMs88t2BO2lZi17KsRy80VzncxjQsOCLrUuouPzI+laGxpXLl\nAKgxuYAheS1kXDuoHM9p7VyMlZR61tDhho+pWUIcsQKBgQDgX1o4R4FxsJicDdXr\nKcwcxpDhFFqXcWwgVNT+9tS5c+r9KhLvOAeiKalNQ6DyuXZ2hFtAwn7uI14ctNZz\nHHHDDG8bYMLw7Pt+1OskY6ox8PIMxF4srWMcPHFwpEIq+HP0g6HjBJtiyL49KnyG\nFvloL4zUJFZVuFSgxxcCuJVpKwKBgQC3gME23oq5q2pPi+BKd3dnXPrFnMjsv83B\nvDyDig05Y4uMd8EJ2l3dGCqR7D03R4+FdG+gxgFoR0GVOnsHqBI5vuBuKlTaYFAJ\nBRF01irX2Gu2KD5Vj9H6k/tf92PijBeqIGQs4zGldCZ8ye20rdYSI4GQqkKESCWg\nmksGMa96hQKBgFZjQChlF6i/VrLW/OMzT5xQs52Fqa+fgwMbxnp4bMUOpY5d8bZb\nO00rfzz5afGqiLrvEPdpK1fjFCw3UE43yHFRy0GeStBaXiaiMfrryK6712YlASFw\njLVlbEPzamqDCJo/SEhREMbDBcQlJJa4J8T+cdmIOBl/BE52+RwaF6TLAoGAYOV+\nISkV+8DGHEbyIqA+zrfMO3j0p/8H+RsaoSLOpNUppPy/VCKYmdze7brfAEerQ38e\nSrkDmTq3KMN+n6ZiKVffTozPzZg56ulgNF+6s8s15TQO5kNRT43AmQYbGk97V3xP\nKVy2pHVWtWIzQMriVSWmjus4wH0QUWPn5ddqn7kCgYAXfTZ776sFHesOMNfiign9\nCv+IRzMD2lMvmCq/4r8z8P/HBTSeEOjidZoMFxAOmoVKgGXXjU7BVhl7Xz74Fe9H\nWgKRryxz4eJQEXuYISipaWvbAF7Pz8nCo+Shywr7HGZ5xqKJNomJIhGz4Amy/6Lf\nzDrRg1+4ZPMO9Jr/bv+vbA==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-sheets@adroit-flare-455408-s0.iam.gserviceaccount.com",
  "client_id": "116990151399276251859",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-sheets%40adroit-flare-455408-s0.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
const wrgsheets = '1IBef22C_cNte8trgH5r0Q3p4WpDfasMEtaEoGgNyx1M';

void main() async {
  //Инициализация таблицы
  final gsheets = GSheets(_readinitial);
  // Св\зь с таблицей
  final ss = await gsheets.spreadsheet(wrgsheets);
  //Запись данных
  var sheet = ss.worksheetByTitle('Shudle_1');
  await sheet!.values.insertValue('Понедельник', column: 1, row: 1);
// Извлечение данных
  final value = await sheet.values.value(column: 1, row: 1);
  print("Значение в A1: $value");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
