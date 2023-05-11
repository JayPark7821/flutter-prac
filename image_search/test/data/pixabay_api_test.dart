import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pixabay_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('Pixabay 데이터를 잘 가져와야 한다', () async {
    final client = MockClient();
    final api = PhotoApiRepositoryImpl(PixabayApi(client));

    when(client.get(Uri.parse(
            '${PixabayApi.baseUrl}?key=${PixabayApi.apiKey}&q=iphone&image_type=photo')))
        .thenAnswer((_) async => http.Response(fakeJsonBody, 200));

    final result = await api.fetch('iphone');

    expect(result.first.id, 410311);

    verify(client.get(Uri.parse(
        '${PixabayApi.baseUrl}?key=${PixabayApi.apiKey}&q=iphone&image_type=photo')));
  });
}

String fakeJsonBody = """
{"total":1320,"totalHits":500,"hits":[{"id":410311,"pageURL":"https://pixabay.com/photos/iphone-hand-screen-smartphone-apps-410311/","type":"photo","tags":"iphone, hand, screen","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/27/iphone-410311_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/ga40944969ab1ca0cb5e5e2a753382c5ef38aa9b1bdf195f44a6e8c7def03f5b2ce08c74211f5bd254565642907f5e7b5_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/gac97151d90f6f74f39ba9a6013d97a3e0c8b3b2673356bef20a65b9a253d439913d8d3566a6e8485773b9aea90170c38a538a3582b0a2af3e51efe53ebc8885b_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":416413,"views":441374,"downloads":213676,"collections":2913,"likes":573,"comments":146,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":620817,"pageURL":"https://pixabay.com/photos/office-notes-notepad-entrepreneur-620817/","type":"photo","tags":"office, notes, notepad","previewURL":"https://cdn.pixabay.com/photo/2015/02/02/11/08/office-620817_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g5dce019c1f10360baae95dd11b0a474f4a88609aa453b6fb63eb21af5ced9f66512d0eecdb37d13d65aece68c04ac30f_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/g288340ffe42c24238450b87b53b341663b8a4d5a34cd29ddfe5bfb2ea8ebad94f954e901100c4cd89e7e821fb78c1262034505ae2109e88ecf14df55589fddb1_1280.jpg","imageWidth":4288,"imageHeight":2848,"imageSize":2800224,"views":631369,"downloads":269069,"collections":3062,"likes":1062,"comments":242,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":410324,"pageURL":"https://pixabay.com/photos/iphone-smartphone-apps-apple-inc-410324/","type":"photo","tags":"iphone, smartphone, apps","previewURL":"https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g16340bb72d787b64ec4aecea4e8bbe1384641da311bbeb252eec9d8276e0a889b00f38465010ff532f2be3f9374068dc_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g31e63ef550debc504b73ce92f5a82c64db4d54d270129bc052ee7a7dbb87b0dd988da39b698c6a4ed17cc59082fa156693317b39e111010f40df583fb0f9cef2_1280.jpg","imageWidth":2180,"imageHeight":1453,"imageSize":477025,"views":567395,"downloads":313685,"collections":3416,"likes":746,"comments":177,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":1807521,"pageURL":"https://pixabay.com/photos/hot-air-balloons-bagan-sunset-1807521/","type":"photo","tags":"hot air balloons, bagan, sunset","previewURL":"https://cdn.pixabay.com/photo/2016/11/08/05/18/hot-air-balloons-1807521_150.jpg","previewWidth":105,"previewHeight":150,"webformatURL":"https://pixabay.com/get/ga6b9f79fa9561bf4099e6d76066baa419c1f9e7b10859e25f4d6caa81228cda783514a0da431fa7e06ff5e4442b97dc01592e80504c6d3dc9bf80989a0dae584_640.jpg","webformatWidth":450,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g1d725b3d314bafcc9e5de999c28871bfb2721938333719dbfbe834b12f9cb52039a846f81f8a0e948448b0b3b5e3fb2054c644abb6c36e11c33893f5264446ef_1280.jpg","imageWidth":2504,"imageHeight":3558,"imageSize":2054554,"views":377842,"downloads":225496,"collections":1421,"likes":445,"comments":31,"user_id":3639875,"user":"sasint","userImageURL":"https://cdn.pixabay.com/user/2016/10/30/05-50-54-750_250x250.jpg"},{"id":2846221,"pageURL":"https://pixabay.com/photos/business-computer-mobile-smartphone-2846221/","type":"photo","tags":"business, computer, mobile","previewURL":"https://cdn.pixabay.com/photo/2017/10/12/22/17/business-2846221_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g028d38050445de1458bd84ef1d707a97d319cfb7474af3180e2e77b77bf476e24142bfee5416c5c8413273faa5df6f0f78deec58c9ba522a5e4159ec708d0e82_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g6156afe1eb14faf5c8e5984150e14a019e799ad169c630cc452df8b3f69da60fc497319dda203bef4c8198e95a8850d85a763a23b60bef1c523bd67d5313c33f_1280.jpg","imageWidth":4608,"imageHeight":3072,"imageSize":2543501,"views":312720,"downloads":221383,"collections":2213,"likes":563,"comments":80,"user_id":6689062,"user":"6689062","userImageURL":""},{"id":1851497,"pageURL":"https://pixabay.com/photos/bicycle-building-city-1851497/","type":"photo","tags":"bicycle, building, city","previewURL":"https://cdn.pixabay.com/photo/2016/11/23/00/39/bicycle-1851497_150.jpg","previewWidth":105,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g1999e20b5b69fd4f55deb9d90cfe02c6e93ae806ed4522113982392cd182dc1d28871e74968dfadf85b4e001259ca798ed4d63517ab1f383d7b90d2d8d166b48_640.jpg","webformatWidth":447,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g8ddb0178d2c135598df80089986b348f7881392f46d7ffcb8a43c43ad34b0b07922d88914c0ef0c569ba9d4a0b784ef50f11eb53f150ce3652fd38105754011f_1280.jpg","imageWidth":2859,"imageHeight":4096,"imageSize":2369529,"views":231438,"downloads":166426,"collections":1765,"likes":433,"comments":40,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":1867761,"pageURL":"https://pixabay.com/photos/home-office-computer-desk-display-1867761/","type":"photo","tags":"home office, computer, desk","previewURL":"https://cdn.pixabay.com/photo/2016/11/29/06/18/home-office-1867761_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/g43bdb579cf458dc60d6a7d03a4c76f1a236191977d606971b27c4fd48b14d7bb5883f3616a605f2c271a118dca471fa2c451c2be34529f8d1a43617f6a25f459_640.jpg","webformatWidth":640,"webformatHeight":427,"largeImageURL":"https://pixabay.com/get/g4d7add6dc54e6fe052cec9eca36c6d45cae99ee9c0a427d4ac4baa1ef4bcf61f9478c20df21f81ff8858156ed698b72f80df320e1f41e3486d6353343531cdc7_1280.jpg","imageWidth":4000,"imageHeight":2669,"imageSize":2381783,"views":151271,"downloads":90765,"collections":1385,"likes":331,"comments":45,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":459196,"pageURL":"https://pixabay.com/photos/macbook-laptop-google-display-459196/","type":"photo","tags":"macbook, laptop, google","previewURL":"https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_150.jpg","previewWidth":150,"previewHeight":92,"webformatURL":"https://pixabay.com/get/g0791feb464387f8cf93c366710d526158a9d37f8d8ed20d254123d96c9f4f7ebfc8117abfb2d46481e599a7a7541ddb2_640.jpg","webformatWidth":640,"webformatHeight":396,"largeImageURL":"https://pixabay.com/get/g5cfc1c58c7f0554d7cbc9d3c0407c85a5358a3f5f324bec38eeb9f958c3458f53dea75d1d03eac8aaf6c8cc33b365c0b5206427f019980ee8d1e4c37c901bf24_1280.jpg","imageWidth":3888,"imageHeight":2406,"imageSize":2883743,"views":459130,"downloads":224390,"collections":2788,"likes":726,"comments":185,"user_id":377053,"user":"377053","userImageURL":""},{"id":1979674,"pageURL":"https://pixabay.com/photos/relaxing-lounging-saturday-cozy-1979674/","type":"photo","tags":"relaxing, lounging, saturday","previewURL":"https://cdn.pixabay.com/photo/2017/01/14/15/11/relaxing-1979674_150.jpg","previewWidth":150,"previewHeight":102,"webformatURL":"https://pixabay.com/get/ge5faf76e80277d3cba937bb839bcbeca09aff9cbcd3d729718bf5b5fab8d228db8d8545cd639091f89a713dd5ba0af3375a998fcbb7dc5465e295c2e25258ae3_640.jpg","webformatWidth":640,"webformatHeight":438,"largeImageURL":"https://pixabay.com/get/gfe5058e2a45cbdbbc63b2c54e2c8964ab66abd33b72f97357b0f5b01d24ba5bf66cb0fbbdc8699a7e5a1c490904d27b164fdb260dde58c7317cc5ffa0bdf54c2_1280.jpg","imageWidth":5310,"imageHeight":3637,"imageSize":3751070,"views":341483,"downloads":197853,"collections":2271,"likes":1034,"comments":123,"user_id":334088,"user":"JillWellington","userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"},{"id":3076954,"pageURL":"https://pixabay.com/photos/desk-smartphone-iphone-notebook-3076954/","type":"photo","tags":"desk, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2018/01/11/21/27/desk-3076954_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g5045887afe1b52b145675a243284e523b3f1cbdc7743dab6c0565271e4bd825a049910d8df67085ddbd5bc7e13cbd606283e44938eb1611f6407c58bf8408136_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g71d994f5f3b8e7938d24ce4fac362c367ecf9b5a95c23275eef125df708c5f399ef8d3baa080f5fcbfe311a68208efa3ee9cf68d81f00f9cf66a0dbc44db041e_1280.jpg","imageWidth":5304,"imageHeight":3531,"imageSize":2258922,"views":192889,"downloads":122410,"collections":1958,"likes":507,"comments":94,"user_id":2218222,"user":"Ylanite","userImageURL":"https://cdn.pixabay.com/user/2021/11/18/21-11-44-855_250x250.png"},{"id":791450,"pageURL":"https://pixabay.com/photos/iphone-iphone-6-iphone-6-plus-apple-791450/","type":"photo","tags":"iphone, iphone 6, iphone 6 plus","previewURL":"https://cdn.pixabay.com/photo/2015/05/31/12/14/iphone-791450_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/gb96d53f674c35b67efa014d33f77441fc5fd06e956d9011191247537040700f8e85b1309d427e958cc7e9f4c19d3404a_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g03ece4df7c6ce682777e12f7fa59b4f9089e5ce99d0ada41edbe9357cc0a4548cb1ffb881780c7e97beafa8bb23fd6ce2d25f72f663caafa10ada6a75f9ea581_1280.jpg","imageWidth":5254,"imageHeight":3503,"imageSize":1909143,"views":122994,"downloads":78303,"collections":1409,"likes":338,"comments":56,"user_id":1013994,"user":"kaboompics","userImageURL":"https://cdn.pixabay.com/user/2018/04/09/00-31-22-504_250x250.jpg"},{"id":763731,"pageURL":"https://pixabay.com/photos/social-media-facebook-smartphone-763731/","type":"photo","tags":"social media, facebook, smartphone","previewURL":"https://cdn.pixabay.com/photo/2015/05/12/09/13/social-media-763731_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g0843745593cfb6b7801088c9b85a7bef4da82297b86028cd02fc8135188d1020a3d3046d6a3124f7c3d411e258d53210_640.jpg","webformatWidth":640,"webformatHeight":425,"largeImageURL":"https://pixabay.com/get/g095901d8b4af23e0df080c477212f558083d8725828277b4fbfcabcad21fe89b397c6c9f2dc087682fb421958a336b51a78d42132703fada98f8f48078c2ad5b_1280.jpg","imageWidth":3967,"imageHeight":2635,"imageSize":2511740,"views":198159,"downloads":115232,"collections":1666,"likes":411,"comments":89,"user_id":663163,"user":"Firmbee","userImageURL":"https://cdn.pixabay.com/user/2020/11/25/09-38-28-431_250x250.png"},{"id":3713473,"pageURL":"https://pixabay.com/photos/asia-rain-street-illumination-3713473/","type":"photo","tags":"asia, rain, street","previewURL":"https://cdn.pixabay.com/photo/2018/09/30/13/17/asia-3713473_150.jpg","previewWidth":120,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g1be944de92e2a81733cac6d1948329c1bff652eef75985911555a8f24ef95f54b10b3d866e101197093597c91f45bc5a0903d2736e4be95071b99372052f52ad_640.jpg","webformatWidth":512,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/ga5164c9ffa9601a834b09858a030b7f48abe1a7bab0986ccc76e4e0f5d9852ea3a32acfbc911a61860ab045f41dd5acc1f598f2878d0787cdc47498588946703_1280.jpg","imageWidth":2410,"imageHeight":3013,"imageSize":1813305,"views":104169,"downloads":59614,"collections":1148,"likes":213,"comments":18,"user_id":4601460,"user":"4601460","userImageURL":""},{"id":499585,"pageURL":"https://pixabay.com/photos/boat-lake-reflection-water-calm-499585/","type":"photo","tags":"boat, lake, reflection","previewURL":"https://cdn.pixabay.com/photo/2014/10/23/11/21/boat-499585_150.jpg","previewWidth":98,"previewHeight":150,"webformatURL":"https://pixabay.com/get/ga93fe0b31a8aeb90936e6f337e098007424546d6df539c6ea81dbcd62231ad1fff6e11c0135085ed0a0ce9404f438f3f_640.jpg","webformatWidth":420,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/g69158feae6299ceab0df1b2d359d6a77bffa0de1a08b9d4ad13d3239c0edf851e3e8a43038bf764f015ceb2a065f2a4f21292d3c5d2c42522012e6087886a584_1280.jpg","imageWidth":3177,"imageHeight":4839,"imageSize":2043537,"views":109644,"downloads":55364,"collections":697,"likes":218,"comments":30,"user_id":516512,"user":"DuncanNelson","userImageURL":"https://cdn.pixabay.com/user/2014/10/18/11-16-04-114_250x250.jpg"},{"id":1192032,"pageURL":"https://pixabay.com/photos/girl-smartphone-iphone-1192032/","type":"photo","tags":"girl, smartphone, iphone","previewURL":"https://cdn.pixabay.com/photo/2016/02/10/16/39/girl-1192032_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g7b501cefa4d5870d43e0ff233320b276f31decd6325e2f2a414a52da7228f3eff95a6e597819de4112bcbbcb6a03ae865c0d2a43542cf66123ff58bd8f4ac807_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/ge49fe9c0820da438b148fc3ab2e48e802832d6dc1b4f86377d9d4febfd5a08cca747a8c0bbedb857a0229787ac343ada28938071ec4672755d599ffd04acc3f2_1280.jpg","imageWidth":2048,"imageHeight":1367,"imageSize":299773,"views":94102,"downloads":44522,"collections":546,"likes":188,"comments":16,"user_id":725943,"user":"janeb13","userImageURL":"https://cdn.pixabay.com/user/2016/02/25/23-52-46-967_250x250.jpg"},{"id":1867461,"pageURL":"https://pixabay.com/photos/apple-iphone-close-up-smartphone-1867461/","type":"photo","tags":"apple, iphone, close up","previewURL":"https://cdn.pixabay.com/photo/2016/11/29/05/08/apple-1867461_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/g3db401e81862617155a4729552195f7cfa3929b097676c39972dcdd798a8528a32d2f743aa71cfbb718636ca1c634c60abe2e831cb9318fd9e1133ff9084e8ef_640.jpg","webformatWidth":640,"webformatHeight":427,"largeImageURL":"https://pixabay.com/get/g12bbaf72c4dd6987cccfcbe53af3b6ff5a6e7a692402c71c54fdbfe0bf3a24305fe0d1ae1c67c12f5bd8749837987350f7ea21c20c80e82bc86494b024e7ab14_1280.jpg","imageWidth":5252,"imageHeight":3507,"imageSize":1410507,"views":52540,"downloads":30619,"collections":631,"likes":102,"comments":17,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"},{"id":5537230,"pageURL":"https://pixabay.com/photos/iphone-hand-phone-mobile-phone-5537230/","type":"photo","tags":"iphone, hand, phone","previewURL":"https://cdn.pixabay.com/photo/2020/09/02/03/26/iphone-5537230_150.jpg","previewWidth":150,"previewHeight":100,"webformatURL":"https://pixabay.com/get/g458ee681b3c8e5e5126059aff95c19b6c0e2afb3e395efb564c66b671fe8efa6ad8de17322f7583d42e777ec90967cbfe9157ad38685858a6f6f9b88e1b3b2e3_640.jpg","webformatWidth":640,"webformatHeight":427,"largeImageURL":"https://pixabay.com/get/g8bb221e070fc8a286f546a8fecd5629a0713d0dcaf251a4d31f56dcc7fcf45e9ee8dfd9760ad00c337163e557d39dda91d8f5c1ba25258aa449bc1ccb6e05eec_1280.jpg","imageWidth":6000,"imageHeight":4000,"imageSize":2408760,"views":43364,"downloads":26871,"collections":735,"likes":71,"comments":9,"user_id":498081,"user":"tranmautritam","userImageURL":"https://cdn.pixabay.com/user/2015/01/22/05-13-32-817_250x250.jpg"},{"id":4599956,"pageURL":"https://pixabay.com/photos/cellular-man-person-technology-4599956/","type":"photo","tags":"cellular, man, person","previewURL":"https://cdn.pixabay.com/photo/2019/11/04/01/11/cellular-4599956_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/g1bbb61a217bb2ba938e518e7cd246f4d26433a8ef51df779b9a33221abf910843ddf3022efa3c6f1ab9ef64967301d7690b6a22f500c5e4660da79f092e54059_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g380e0308e913063c6020c1fe00f211e1fd9b36dbc66166dffd6e7f32e10574d1f3de5b460dbca2210e175d1376d5b896421d272f40beaaed461c43b8c0f9300c_1280.jpg","imageWidth":5184,"imageHeight":3456,"imageSize":5727471,"views":48861,"downloads":31696,"collections":672,"likes":109,"comments":21,"user_id":10110273,"user":"GustavoWandalen","userImageURL":"https://cdn.pixabay.com/user/2021/08/16/16-33-21-80_250x250.jpg"},{"id":500291,"pageURL":"https://pixabay.com/photos/iphone-hand-girl-smartphone-500291/","type":"photo","tags":"iphone, hand, girl","previewURL":"https://cdn.pixabay.com/photo/2014/10/23/20/51/iphone-500291_150.jpg","previewWidth":150,"previewHeight":99,"webformatURL":"https://pixabay.com/get/ge19b8a9d1d9dce7708482878a2b59f13a10949fee838d3d84018fcc770dc51931365d8e5c084e11ad4b330b09883c988_640.jpg","webformatWidth":640,"webformatHeight":426,"largeImageURL":"https://pixabay.com/get/g254ebcf0ae5cb5c27ffbe4eb0a35bfe1784cbd0f8b8b529ba18bdf198d53daabcfa26315db5179acbc4e05ac35a890ce510d4601d6e20905c59efae7c7fc6752_1280.jpg","imageWidth":1920,"imageHeight":1280,"imageSize":521447,"views":144488,"downloads":68565,"collections":661,"likes":265,"comments":44,"user_id":264599,"user":"JESHOOTS-com","userImageURL":"https://cdn.pixabay.com/user/2014/06/08/15-27-10-248_250x250.jpg"},{"id":1867636,"pageURL":"https://pixabay.com/photos/water-pool-turquoise-background-1867636/","type":"photo","tags":"water, pool, turquoise","previewURL":"https://cdn.pixabay.com/photo/2016/11/29/05/49/water-1867636_150.jpg","previewWidth":100,"previewHeight":150,"webformatURL":"https://pixabay.com/get/g01e156151600b1554e75174b1ea48fa5bd5d1b05793a163d665b09b5a66a838b3c49454f1d95d040ce0c868277aca6c39e475ffabf2e8d336bb5768087033616_640.jpg","webformatWidth":426,"webformatHeight":640,"largeImageURL":"https://pixabay.com/get/gf34f13355929c4faea22023d1dd7268a33386317fe18ec4a3fec3bfd57401725bab0bb6262f541e0f950cef647eb138ce608831640f73cda4bbbdc32fb7837bb_1280.jpg","imageWidth":3648,"imageHeight":5472,"imageSize":8220680,"views":149903,"downloads":95061,"collections":924,"likes":231,"comments":10,"user_id":2286921,"user":"Pexels","userImageURL":"https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"}]}
""";
