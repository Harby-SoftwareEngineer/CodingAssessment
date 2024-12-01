
const String kMaterialAppTitle = 'Flutter Clean Architecture';

// API
const String kTestBaseUrl = 'https://api.escuelajs.co/api';
const String kApiKey = 'ff957763c54c44d8b00e5e082bc76cb0';
 const String baseApiUrl = "https://api.escuelajs.co/api";

const bool isTestApp = true;

const kBaseUrl = kIsTestVersion ? kTestBaseUrl : kApiKey;

const kIsTestVersion = true;

const String homePageDataId = kIsTestVersion ? 'ee5be91d-f5d4-49d1-9f16-d8e2d001a164' : 'ee5be91d-f5d4-49d1-9f16-d8e2d001a164';