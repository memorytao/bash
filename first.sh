URL=$(curl -L -X POST 'https://digitaltest.dtac.co.th/mobileapi/auth/v2.0.0/auth/requestlogin?subrNumb=66615650095' \
-H 'channelId: 2100251115' \
-H 'device: iPhone10' \
-H 'uid: Dff9xxxe5e3ba9-7193-4c88-9761-376b53938087' \
-H 'brandModel: Apple' \
-H 'osVersion: 11.3' \
-H 'appVersion: 9.0' \
-H 'platform: IOS' )

echo $URL