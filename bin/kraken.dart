import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Kraken {
  static Map<String, String> hostMap = new Map<String, String>();

  static getHostMap(){
    if(hostMap.isEmpty){
      hostMap.putIfAbsent("Sabre-Provider-Adapter",()=>"git@ewegithub.sb.karmalab.net:EWE/Sabre-Provider-Adapter.git");
      //run jar
      hostMap.putIfAbsent("com.expedia.air.supply.flights.shopping",()=>"git@ewegithub.sb.karmalab.net:EWE/com.expedia.air.supply.flights.shopping.git");
      hostMap.putIfAbsent("gulfstream-search-service",()=>"git@ewegithub.sb.karmalab.net:EWE/gulfstream-search-service.git");
      hostMap.putIfAbsent("sos-sb-service",()=>"git@ewegithub.sb.karmalab.net:EWE/sos-sb-service.git");
      hostMap.putIfAbsent("com.expedia.gulfstream.offerservice",()=>"git@ewegithub.sb.karmalab.net:EWE/com.expedia.gulfstream.offerservice.git");
      //spring-boot
      hostMap.putIfAbsent("gulfstream-detail-service",()=>"git@ewegithub.sb.karmalab.net:EWE/gulfstream-detail-service.git");
      hostMap.putIfAbsent("atc",()=>"git@ewegithub.sb.karmalab.net:seiso-data/atc.git");
    }
    return hostMap;
  }

//hostMap.putIfAbsent("Sabre-Provider-Adapter", "git@ewegithub.sb.karmalab.net:EWE/Sabre-Provider-Adapter.git");
//  ..
  static Future fetchResposIfNeeded() async{
    String hostPath;
    for (var key in await getHostMap().keys){
      if(!Directory.current.parent
          .listSync()
          .any((file) => file.path.contains(key))){
//        Process.runSync('git', ['clone', value],
//            workingDirectory: Directory.current.parent.path,
//            runInShell: true);
        var gitUrl = await getHostMap()[key];
        print("CheckPoint 1");
        Process process = await Process.start('git', ['clone', gitUrl],
            workingDirectory: Directory.current.parent.path,
            runInShell: true);


//            process.exitCode.then((value){
//              print("Process exited with $value");
//            });
//        });
        var lineStream = process.stdout
            .transform(new Utf8Decoder())
            .transform(new LineSplitter());
        await for (var line in lineStream) {
          print(line);
        }
        print('exit code: ${await process.exitCode}');

      }

  }
//    hostMap.forEach((key,value){
//
//
//    });
//    var directory = Directory.current.parent
//        .listSync()
//        .firstWhere((file) => file.path.contains("Sabre"))
//        .path;
//    Process
//        .run(
//        'git', ['reset', '--hard', 'origin/master'],
//        workingDirectory: directory,
//        runInShell: true)
//        .asStream().listen((process) {
//      stdout.write(process.stdout);
//      print("hello");
//    });
  }
}
//  );
