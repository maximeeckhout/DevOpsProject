# Jenkins - Android

## Android SDK

1. Download Android SDK: [link](https://developer.android.com/studio/#command-tools)
2. Maak de map ```/var/lib/jenkins/android-sdk```
3. Unzip de downloadfile in de map
```
# install unzip command
sudo apt-get install unzip
# unzip into this folder
sudo unzip android-sdk.zip -d .
```
4. Update de SDK tools
```
sudo ./bin/sdkmanager "tools"
```
5. Installeren van enkele build-tools
```
sudo ./bin/sdkmanager "build-tools;26.0.2" "platforms;android-26" "extras;android;m2repository" "extras;google;m2repository"
sudo ./bin/sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2" "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"
```
## Jenkins build jobs
* Aanmaken van Freestyle Project
  * build is parameterized [x]
* Build
```
chmod +x gradlew
./gradlew clean
./gradlew assembleDebug > logAndroid.txt
```

Update: Signed APK builden
```
chmod +x gradlew
./gradlew clean > logAndroid.txt
./gradlew build >> logAndroid.txt
```
# Post-build
*  APK archiveren en logs meegeven

```
app/build/outputs/apk/release/*.apk , logAndroid.txt
```

* APK releasen op github

```
export GITHUB_TOKEN=372ba634c71bbe5436b4bc6cb85b9f7ae543787c
export GOPATH=/usr/local/go/bin
GITHUB_ORGANIZATION=HoGent-Projecten3
GITHUB_REPO=projecten3-1819-android-groep9-ideaalduaal
VERSION_NAME=v$(date +'%Y-%m-%d-%H-%M')

#echo "Deleting release from github before creating new one"
#github-release delete --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME}

echo "Creating a new release in github"
github-release release --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${VERSION_NAME}"

echo "Uploading the artifacts into github"
github-release upload --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "app_IdeaalDuaal_${VERSION_NAME}.apk" --file "app/build/outputs/apk/release/app-release.apk"
```

* APK Uploaden naar Google Play Store
  * Eerste versie moet manueel op de Play Store gezet worden
    * Ingesteld samen met developers
  * Via Jenkins-plugin releasen naar Google Play Store
    * Credentials nodig van account (Robin) 
    * Release naar internal => Voor beperkt aantal testers beschikbaar

* Discord notifer
  * Bot die in discord builds toont (fail/succes) met gearchiveerde bestanden (apk en logs)

