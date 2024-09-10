-#timesmedlite

Timesmed Product
 
##Getting Started

##Build

flutter build apk --flavor doctor -t lib/main_doctor.dart --release --split-per-abi
flutter build apk --flavor patient -t lib/main_patient.dart --release --split-per-abi

##Build Runner 
flutter pub run build_runner watch --delete-conflicting-outputs

