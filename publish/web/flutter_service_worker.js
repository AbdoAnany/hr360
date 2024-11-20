'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3d6baa59e543e5fc9423e33db12c0073",
"assets/AssetManifest.bin.json": "c1101ac29aeddf7ea8dd04b51352943e",
"assets/AssetManifest.json": "953b09c37de042ab96bc38ebb07c8ee7",
"assets/assets/fonts/Outfit/Outfit-Black.ttf": "d032ccd62028487a6c8d70a07bda684b",
"assets/assets/fonts/Outfit/Outfit-Bold.ttf": "e28d1b405645dfd47f4ccbd97507413c",
"assets/assets/fonts/Outfit/Outfit-ExtraBold.ttf": "d649fd9b3a7e7c6d809b53eede996d18",
"assets/assets/fonts/Outfit/Outfit-ExtraLight.ttf": "f257db4579a91feb1c1f0e80daae48ae",
"assets/assets/fonts/Outfit/Outfit-Light.ttf": "905f109c79bd9683fc22eaffe4808ffe",
"assets/assets/fonts/Outfit/Outfit-Medium.ttf": "3c88ad79f2a55beb1ffa8f68d03321e3",
"assets/assets/fonts/Outfit/Outfit-Regular.ttf": "9f444021dd670d995f9341982c396a1d",
"assets/assets/fonts/Outfit/Outfit-SemiBold.ttf": "f4bde7633a5db986d322f4a10c97c0de",
"assets/assets/fonts/Outfit/Outfit-Thin.ttf": "8f281fc8ba39d6f355190c14b6532b44",
"assets/assets/icons/activity_filled.svg": "f48cc8da6b1f1800dd6fa1fee1257589",
"assets/assets/icons/activity_light.svg": "400fa9a09f7c243f8bdbe8a0d6e16a87",
"assets/assets/icons/add_circled_filled.svg": "ff16d68b219ccc8873f5153629f8be2b",
"assets/assets/icons/add_circled_light.svg": "44f698b8cd3930db30f6ebe2d607b489",
"assets/assets/icons/add_filled.svg": "adf3241942a2b684e918a724102bb3d6",
"assets/assets/icons/add_light.svg": "adf3241942a2b684e918a724102bb3d6",
"assets/assets/icons/alarm_filled.svg": "c08c65e69852f1bc0efa6cf74ffb5b62",
"assets/assets/icons/alarm_light.svg": "bfd7fdaa0359fe347e7f0e8610d62a49",
"assets/assets/icons/alert_circled_filled.svg": "6b71e9d8f1a2ea9ddd01d972a6d6950f",
"assets/assets/icons/alert_circled_light.svg": "61fafa5e43e10f22bea38ba8e1876f29",
"assets/assets/icons/anchor_filled.svg": "832f9a1cb7f3b15a9c319362e35bf6f5",
"assets/assets/icons/anchor_light.svg": "832f9a1cb7f3b15a9c319362e35bf6f5",
"assets/assets/icons/android_filled.svg": "fb8ca1181bb2288a250ad93e301a3d1e",
"assets/assets/icons/android_light.svg": "22e0a085b369084585962e2ac090b47b",
"assets/assets/icons/apple_filled.svg": "92911aba24f58dc2bc225103a002ada9",
"assets/assets/icons/apple_ic.svg": "b7ced21e3b62dfef3a3009e5211cd17a",
"assets/assets/icons/apple_light.svg": "928d8475ebef06b8387ea3032aff84ed",
"assets/assets/icons/archive_filled.svg": "12d56755c73815bede7d2f124c96e5fe",
"assets/assets/icons/archive_light.svg": "75cdae1e187f10e908e26b59c4b9a568",
"assets/assets/icons/arrow_backward_filled.svg": "3fe26a61d9934127e6c2a745d5c1cb9e",
"assets/assets/icons/arrow_backward_light.svg": "3fe26a61d9934127e6c2a745d5c1cb9e",
"assets/assets/icons/arrow_down_filled.svg": "59e26f33ad3f36ad6678ae8790a91e48",
"assets/assets/icons/arrow_down_light.svg": "59e26f33ad3f36ad6678ae8790a91e48",
"assets/assets/icons/arrow_forward_filled.svg": "ebaf46f395025bef80aa0811604cb6c2",
"assets/assets/icons/arrow_forward_light.svg": "ebaf46f395025bef80aa0811604cb6c2",
"assets/assets/icons/arrow_up_down_filled.svg": "ee3ee3b12550201173536c3adc1cb62f",
"assets/assets/icons/arrow_up_down_light.svg": "ee3ee3b12550201173536c3adc1cb62f",
"assets/assets/icons/arrow_up_filled.svg": "127903f0b6d2df6491f637d4190b0e34",
"assets/assets/icons/arrow_up_light.svg": "127903f0b6d2df6491f637d4190b0e34",
"assets/assets/icons/attachment_filled.svg": "5099619b061552e34afcb190fc78e286",
"assets/assets/icons/attachment_light.svg": "070f69edb146bd55700eed36397338ca",
"assets/assets/icons/at_sign_filled.svg": "4435edec071d42a664f84e15c94b172f",
"assets/assets/icons/at_sign_light.svg": "4ae1f16552c662e384471d393d1caf07",
"assets/assets/icons/badge_filled.svg": "b71bc8270a367f2da359ed71148cbd49",
"assets/assets/icons/badge_light.svg": "cc44b49d58fafd4bbbdd88327954d01d",
"assets/assets/icons/bank_filled.svg": "77027bc51b1cc782307ace52cce5d7a6",
"assets/assets/icons/bank_light.svg": "ec8d6e8e253380fcbcfcfc5e12e181cf",
"assets/assets/icons/bar_chart_filled.svg": "575e19bf3cf3a51a9220c45c22a33723",
"assets/assets/icons/bar_chart_light.svg": "575e19bf3cf3a51a9220c45c22a33723",
"assets/assets/icons/basketball_filled.svg": "92a84419718090f42f42678733795352",
"assets/assets/icons/basketball_light.svg": "c2b8fa82b17c47c58b3fcda214dc3aa6",
"assets/assets/icons/basket_filled.svg": "4dbab6e798d17414c5d37c28d0f7dd4d",
"assets/assets/icons/basket_light.svg": "5ccd282599b49ffa9f7a2d8a330945bf",
"assets/assets/icons/battery_charging_filled.svg": "c173ddb7a8e2449a34aef19083f667b3",
"assets/assets/icons/battery_charging_light.svg": "e2143ac11ac9a239ad28df5848b3df58",
"assets/assets/icons/battery_filled.svg": "6927623f10c24eedc9a7c8d68221ca9e",
"assets/assets/icons/battery_full_filled.svg": "5d89000d808fa5858ed9edec8281356d",
"assets/assets/icons/battery_full_light.svg": "43aa02625b09b85c8816967ea6fd4303",
"assets/assets/icons/battery_half_filled.svg": "5c6de79ff296cf4c9f7c3e73d3fa131a",
"assets/assets/icons/battery_half_light.svg": "2f8e87c545e358600583f9b6865a2c69",
"assets/assets/icons/battery_light.svg": "c78adefe7fe25f1ddd0d58a46cbcca09",
"assets/assets/icons/battery_low_filled.svg": "975f67d1e8175182e1ebf546b0d4be87",
"assets/assets/icons/battery_low_light.svg": "49d4a4d4df054c2e0779e1f2f91aa754",
"assets/assets/icons/bluetooth_filled.svg": "96b8c9fca1aadd5ff1d2944118f3e0c0",
"assets/assets/icons/bluetooth_light.svg": "96b8c9fca1aadd5ff1d2944118f3e0c0",
"assets/assets/icons/bluetooth_off_filled.svg": "9fbe5aaf01068ab95c74a8c442d58bf3",
"assets/assets/icons/bluetooth_off_light.svg": "9fbe5aaf01068ab95c74a8c442d58bf3",
"assets/assets/icons/bold_filled.svg": "3ab8e2c604dea77cdfcd6cde5bac34df",
"assets/assets/icons/bold_light.svg": "3ab8e2c604dea77cdfcd6cde5bac34df",
"assets/assets/icons/bookmark_filled.svg": "6bdfa7bb287309bb2c30a7024fba028f",
"assets/assets/icons/bookmark_light.svg": "413827ab198c51210a600550bfd7a819",
"assets/assets/icons/book_filled.svg": "3b667d4de9335cdecda6674184671237",
"assets/assets/icons/book_light.svg": "6297a76fff63c5dcf1bca97d021896dd",
"assets/assets/icons/box_filled.svg": "a3f80837e693fae5824748e44a9ae545",
"assets/assets/icons/box_light.svg": "07fade8cf41dd059ec4eb99224b0be14",
"assets/assets/icons/briefcase_filled.svg": "45358f1bd5f750a876a97d98ffff9216",
"assets/assets/icons/briefcase_light.svg": "6762b138a30538e3c8bdf4d35e8cb5f9",
"assets/assets/icons/brush_filled.svg": "836637ed74331ffe9739b0135aec257d",
"assets/assets/icons/brush_light.svg": "4a8f7548c9b0e09949084709221c7e58",
"assets/assets/icons/bug_filled.svg": "f3891baf25a34bc5952d75ae1e4f97c6",
"assets/assets/icons/bug_light.svg": "1ee580619866ef63df09731584faed21",
"assets/assets/icons/building_filled.svg": "e8ea7b362515340a0f349b9b1cf7b54b",
"assets/assets/icons/building_light.svg": "bc8ead18f513b3780aecf89fde0a73e6",
"assets/assets/icons/bulb_filled.svg": "bf0159a9154eb1de0d3ac5a876ed281c",
"assets/assets/icons/bulb_light.svg": "cf9de2d600b925f3c8fc7229efe93334",
"assets/assets/icons/burger_filled.svg": "3c857c49b4e679bf8cf3feb5f56a9006",
"assets/assets/icons/burger_light.svg": "a75f58309c59815660eb3ee2256eac82",
"assets/assets/icons/bus_filled.svg": "8dc1512af8b0127118b3d654e037cbc4",
"assets/assets/icons/bus_light.svg": "c11fb55c4bc5c35340938d60cb51279b",
"assets/assets/icons/cake_filled.svg": "6ec161afee7c05c228266d4b05103d89",
"assets/assets/icons/cake_light.svg": "694b3df5692b9ef2c2bce9cba6523246",
"assets/assets/icons/calculator_filled.svg": "85c57bb135a7c4ab3752a1e70394489e",
"assets/assets/icons/calculator_light.svg": "aee83623f0db60e0f454923531bb9acb",
"assets/assets/icons/calendar_filled.svg": "012e5f0ed9c67da22cbb391b0ef1375b",
"assets/assets/icons/calendar_light.svg": "db4911fcab4e3cbab021175619af02fd",
"assets/assets/icons/camera_filled.svg": "1dfe9a7f68f0ba2eb716ec2a99941102",
"assets/assets/icons/camera_light.svg": "3756dacf6eb227b79c32ebbb295558b8",
"assets/assets/icons/cart_filled.svg": "c8de888b0f8ac7a7328139260b51244d",
"assets/assets/icons/cart_light.svg": "f57e62dd880ebc2a7c5377863b2f52d1",
"assets/assets/icons/cast_filled.svg": "d0df5d3a4cc5db72dcccc55b6d7a0263",
"assets/assets/icons/cast_light.svg": "eb7ebf4ae32844c660aeaab2248ea4db",
"assets/assets/icons/category_filled.svg": "3dc1f8187dffebfad1d6278c5ff731ef",
"assets/assets/icons/category_light.svg": "22372db2b4e04f337f070d4fdbdeef74",
"assets/assets/icons/center_align_filled.svg": "e570626bb206135958cfdc0179655154",
"assets/assets/icons/center_align_light.svg": "e570626bb206135958cfdc0179655154",
"assets/assets/icons/checkbox_filled.svg": "98ed9161948bc62d4b8c5bd452d413e1",
"assets/assets/icons/checkbox_light.svg": "56810eda7525ad50f687a13720435362",
"assets/assets/icons/checkbox_unchecked_filled.svg": "e1b63151d8a81334cb80aa2eb683d34d",
"assets/assets/icons/checkbox_unchecked_light.svg": "e1b63151d8a81334cb80aa2eb683d34d",
"assets/assets/icons/check_all_filled.svg": "2c2dbefadfe31a0ff57e0ebd34ea19ab",
"assets/assets/icons/check_all_light.svg": "dc139cbdad3aa76e3bac34197f4ff948",
"assets/assets/icons/check_circled_filled.svg": "71e2620295de704cf09edf3a0682358b",
"assets/assets/icons/check_circled_light.svg": "a27cc53756b0b9b494cc6326534fd7c6",
"assets/assets/icons/check_filled.svg": "bbaf08c38d3a9b785490d1558d84c841",
"assets/assets/icons/check_light.svg": "bbaf08c38d3a9b785490d1558d84c841",
"assets/assets/icons/chevron_backward_filled.svg": "814d972744f75a7b0404a7a97d010e23",
"assets/assets/icons/chevron_backward_light.svg": "814d972744f75a7b0404a7a97d010e23",
"assets/assets/icons/chevron_double_backward_filled.svg": "dffea0734447671239669a3edee87185",
"assets/assets/icons/chevron_double_backward_light.svg": "dffea0734447671239669a3edee87185",
"assets/assets/icons/chevron_double_down_filled.svg": "763839ea8139c6c5a3d814950bdf4b28",
"assets/assets/icons/chevron_double_down_light.svg": "763839ea8139c6c5a3d814950bdf4b28",
"assets/assets/icons/chevron_double_forward_filled.svg": "ce3902395044e1af70700d9ef7ac4a1f",
"assets/assets/icons/chevron_double_forward_light.svg": "ce3902395044e1af70700d9ef7ac4a1f",
"assets/assets/icons/chevron_double_up_filled.svg": "c042eb79118ec378378038680eef9694",
"assets/assets/icons/chevron_double_up_light.svg": "c042eb79118ec378378038680eef9694",
"assets/assets/icons/chevron_down_filled.svg": "3006afe726337b68402da3bb2c7e4bbd",
"assets/assets/icons/chevron_down_light.svg": "3006afe726337b68402da3bb2c7e4bbd",
"assets/assets/icons/chevron_forward_filled.svg": "b17f75dbb26c89523d1a576b14f89c86",
"assets/assets/icons/chevron_forward_light.svg": "b17f75dbb26c89523d1a576b14f89c86",
"assets/assets/icons/chevron_up_filled.svg": "6a701ec1d3afba0375833008850a1073",
"assets/assets/icons/chevron_up_light.svg": "6a701ec1d3afba0375833008850a1073",
"assets/assets/icons/chip_filled.svg": "54bf9253ac5630480fd99ff4f387faa0",
"assets/assets/icons/chip_light.svg": "5d76d3dba8a934b06b7c07e6b33ac519",
"assets/assets/icons/chrome_filled.svg": "1c28b78a07b52edeba31341d314039f8",
"assets/assets/icons/chrome_light.svg": "88c141c1871aad73108249d2fed4b273",
"assets/assets/icons/clipboard_filled.svg": "6c776a0191691edcbac590cff3d5053f",
"assets/assets/icons/clipboard_light.svg": "d0f72d5b8eddfa2948da5401db5578c4",
"assets/assets/icons/clock_filled.svg": "5b40398a9d27630ed58446218364686e",
"assets/assets/icons/clock_light.svg": "ad0da518fa292ca644a972899b66ad0c",
"assets/assets/icons/close_circled_filled.svg": "a786da54bd5a0538f2276d4dd2b83c01",
"assets/assets/icons/close_circled_light.svg": "82515c3016bddc880ec83c8bf4296c04",
"assets/assets/icons/close_filled.svg": "f8be1e975fbc261bbee16b4b231b7564",
"assets/assets/icons/close_light.svg": "9836ca6c32fb585431a725811d1a055e",
"assets/assets/icons/cloud%2520check_filled.svg": "cbbd91a9a765fa5ccd4f6ce64861f1e9",
"assets/assets/icons/cloud%2520check_light.svg": "5025c366c05e7dbe8ea5108d923c0843",
"assets/assets/icons/cloud_download_filled.svg": "b8d198905d4ec67b9af25bf4cb2392ea",
"assets/assets/icons/cloud_download_light.svg": "c7309e70c8175ac0c99dd7d107f26a45",
"assets/assets/icons/cloud_filled.svg": "a9336b66db8da5fafb1ef8feef81d022",
"assets/assets/icons/cloud_light.svg": "930dd2af98bf0068411f18c22e0e1821",
"assets/assets/icons/cloud_off_filled.svg": "c11fc38e88d755c95fad283e715c94a6",
"assets/assets/icons/cloud_off_light.svg": "aa5c0004a765bdb6cc5d423f25f33b1c",
"assets/assets/icons/cloud_upload_filled.svg": "41ade60bcc8f8ffdef3ca2e634e40338",
"assets/assets/icons/cloud_upload_light.svg": "babe52b368b4b042b995628c7f0d4162",
"assets/assets/icons/code_filled.svg": "ecbca434b8339b7ea4d558314cd6ae0a",
"assets/assets/icons/code_light.svg": "ecbca434b8339b7ea4d558314cd6ae0a",
"assets/assets/icons/coffee_filled.svg": "9e7eb43cfac014ebeced000f0de8a158",
"assets/assets/icons/coffee_light.svg": "2bb39bf5348b97576673be8df7def05a",
"assets/assets/icons/collapse_filled.svg": "334041fdd7b9b840d62ad260ace6b8bc",
"assets/assets/icons/collapse_light.svg": "334041fdd7b9b840d62ad260ace6b8bc",
"assets/assets/icons/color_palette_filled.svg": "3b71e1b28ddec5275b922ca700d9d324",
"assets/assets/icons/color_palette_light.svg": "e779474604dd89a652aea12dd5a5513c",
"assets/assets/icons/command_filled.svg": "c016d6aedea9185d879aae543015c574",
"assets/assets/icons/command_light.svg": "c016d6aedea9185d879aae543015c574",
"assets/assets/icons/compass_filled.svg": "b3eba1035e23e8e24a8c84b897883d2a",
"assets/assets/icons/compass_light.svg": "81bf202831eb19422de7709c139fb7f2",
"assets/assets/icons/copy_filled.svg": "5d273f700935ff5e26e8c38c2cd19546",
"assets/assets/icons/copy_light.svg": "90ad0799a2ad784efb5d9b99b828d4a5",
"assets/assets/icons/crop_filled.svg": "9e6c9a730566b10dd9b7957d984e504e",
"assets/assets/icons/crop_light.svg": "1e80757be2d727de1ed14a943a0f430a",
"assets/assets/icons/crosshairs_filled.svg": "c9d2c7ca510f0ac2fd725aaa24168aa5",
"assets/assets/icons/crosshairs_light.svg": "e40c87dbd3343fc58bce41c0af6d3855",
"assets/assets/icons/cursor_filled.svg": "c6c34ec9996affbeebb45276ec721de6",
"assets/assets/icons/cursor_light.svg": "1c5e082aa517ae3b434126801eb1d32d",
"assets/assets/icons/cycling_filled.svg": "9ffc70e9e9b041a8da1cdcddb4e44b7f",
"assets/assets/icons/cycling_light.svg": "0fa80f9f8c2137e01cc2e52f20f1f79e",
"assets/assets/icons/dashboard_filled.svg": "af4047a8719d74c399c741e7ca7988f9",
"assets/assets/icons/dashboard_light.svg": "06fd44a12950c55c8d26878832acc4c6",
"assets/assets/icons/database_filled.svg": "b2331da666184b59889146a67a08d91e",
"assets/assets/icons/database_light.svg": "cccbfe54f5ad5465630764a5650c67ab",
"assets/assets/icons/design_filled.svg": "55a98fd3efeeafba707f20af4b64512d",
"assets/assets/icons/design_light.svg": "7d43579f0bd59f079871bf49e9f12b27",
"assets/assets/icons/diamond_filled.svg": "93ff4e1f73a3bebd15842d321bab1c27",
"assets/assets/icons/diamond_light.svg": "7b6dd8ae1cfa6526c75582db48687ae0",
"assets/assets/icons/document_filled.svg": "408fde674f1272298ed7d61f6e9854ba",
"assets/assets/icons/document_light.svg": "a1abe2339c6e8138a4e6c3e8c3ba7bd8",
"assets/assets/icons/dollar_filled.svg": "ef8b3d33c1785deccbe028719ad5cc51",
"assets/assets/icons/dollar_light.svg": "ef8b3d33c1785deccbe028719ad5cc51",
"assets/assets/icons/donut_chart_filled.svg": "fdc5feb33dad5a91cae8cb82a90e4aad",
"assets/assets/icons/donut_chart_light.svg": "b7d5345ed79771560feffbbb95c1540c",
"assets/assets/icons/download_filled.svg": "0a7b0fe88deb3b3bc34f4f9e5f986474",
"assets/assets/icons/download_light.svg": "126efb3023f8ebdaab48d14104bf4259",
"assets/assets/icons/drop_filled.svg": "4819827bfc0d4543bae1f42ad2e46afb",
"assets/assets/icons/drop_light.svg": "de743af91ede9c1e533adc9406fe748d",
"assets/assets/icons/dumbell_filled.svg": "3774211981c57203d9dafd81e24f767c",
"assets/assets/icons/dumbell_light.svg": "8f2525fdbd0fdca8cf2e4ec1762a0359",
"assets/assets/icons/edit_filled.svg": "e48341c90c6a4f2b194d949602e5a270",
"assets/assets/icons/edit_light.svg": "36f911b680268cb15d9036fdd1ba786e",
"assets/assets/icons/euro_filled.svg": "b5e63e782a56db67fb0db77ed3712ed6",
"assets/assets/icons/euro_light.svg": "b5e63e782a56db67fb0db77ed3712ed6",
"assets/assets/icons/event_add_filled.svg": "f3247f221fa88c253e81a9044f1ccdb1",
"assets/assets/icons/event_add_light.svg": "5ca5ce9daf2e1afd45ae076ee1881e2e",
"assets/assets/icons/event_scheduled_filled.svg": "9a2920fa3c8d2e206b870ad21daaf222",
"assets/assets/icons/event_scheduled_light.svg": "5b416e06ac2d7dd4599f56cf77578667",
"assets/assets/icons/expand_filled.svg": "dcfd563bff59ef4c669f8a32e7d52d8a",
"assets/assets/icons/expand_light.svg": "dcfd563bff59ef4c669f8a32e7d52d8a",
"assets/assets/icons/eye_dropper_filled.svg": "d41f749be1aa332ed6900e2a9ee7b411",
"assets/assets/icons/eye_dropper_light.svg": "d07a44048544c1dc62deab5e466f6b1c",
"assets/assets/icons/facebook_filled.svg": "552477e1200b26daa8e048a90cb4480e",
"assets/assets/icons/facebook_light.svg": "cdea1953120be7463c6214674df441fe",
"assets/assets/icons/fast_backward_filled.svg": "b07b7ae3a9019a02660a16039a1712ff",
"assets/assets/icons/fast_backward_light.svg": "f30e27108589c3353576cf4583661a99",
"assets/assets/icons/fast_forward_filled.svg": "aec642a70df028c78aebfe76602ea381",
"assets/assets/icons/fast_forward_light.svg": "18d4dbf69e3c2c7c88e055044b2aed52",
"assets/assets/icons/figma_filled.svg": "a7bab5778a542ad8837b06ec68c7c1d4",
"assets/assets/icons/figma_light.svg": "3087183775f0a3ce6928ba49a5f24284",
"assets/assets/icons/files_filled.svg": "5843d288f9cdee3b9ca403ae730a34df",
"assets/assets/icons/files_light.svg": "cdc8d520479015c1dcc73bf395d138fb",
"assets/assets/icons/file_add_filled.svg": "78c2d524822fc7fd269fdd2c0ec33dd5",
"assets/assets/icons/file_add_light.svg": "a3dda466ebc92b26f914f6193773505a",
"assets/assets/icons/file_filled.svg": "6b110669ce695eeb2d2b89e68610b3de",
"assets/assets/icons/file_light.svg": "be4dadf871bd3c0f095095420fb96c22",
"assets/assets/icons/film_filled.svg": "095db96b480a1e49f42aa97f7e321586",
"assets/assets/icons/film_light.svg": "3bcb5552f814bcb45a3d67e35c4423fb",
"assets/assets/icons/filter_filled.svg": "86c37904c4c183d453fbe9cf8f44b5b9",
"assets/assets/icons/filter_light.svg": "c92686ee11248b2a0047d8d4dbe92cc9",
"assets/assets/icons/fire_filled.svg": "a78151a99b1b1529639f7ba1b7547925",
"assets/assets/icons/fire_light.svg": "916955c9da241541f031ef19d4730219",
"assets/assets/icons/flag_filled.svg": "dcddc3c5e2b7faa0b6d98242347c29ef",
"assets/assets/icons/flag_light.svg": "1c6f17ccb97ab9cbeba378d8f1ac92a7",
"assets/assets/icons/flashlight_filled.svg": "68ae72a2f3c4a5c53646f5e59cd52f95",
"assets/assets/icons/flashlight_light.svg": "f4bb60d52f02ae7322143ddebcb3089e",
"assets/assets/icons/flight_filled.svg": "3c1cfc024b039de808a265696400f5a8",
"assets/assets/icons/flight_light.svg": "e2e8fbf3362e91d9138d9c39541f50a4",
"assets/assets/icons/folder_add_filled.svg": "841ee0a69f7ddadd9cd4faa7a4e01aaf",
"assets/assets/icons/folder_add_light.svg": "9e7a615df712a8dd2db1eacdcb48fc18",
"assets/assets/icons/folder_filled.svg": "7ec3619877eddbfa3a5154146d401d37",
"assets/assets/icons/folder_light.svg": "e5d05d4ceca979ebecacc176496060e1",
"assets/assets/icons/frown_filled.svg": "367a2e2046f171020c2478d97a65e7d4",
"assets/assets/icons/frown_light.svg": "b8b886bf5c7940c5423ae1fbaa0c936b",
"assets/assets/icons/fuel_filled.svg": "ffb9bb18a5751d0a6492cf5df4497edc",
"assets/assets/icons/fuel_light.svg": "e5d1b44338a3c52957b532a7c47c1509",
"assets/assets/icons/gamepad_filled.svg": "bd10cd77a84bb8c0a58895746c2f2223",
"assets/assets/icons/gamepad_light.svg": "91af2406c49dc255f6462d21497d261b",
"assets/assets/icons/gift_filled.svg": "aa20e0ae1fba3566de427c6cc6453061",
"assets/assets/icons/gift_light.svg": "bcbd511eff089d2185bf7e7ca191f4f3",
"assets/assets/icons/google_filled.svg": "621883104bd0f3a7f780157c6f068cb3",
"assets/assets/icons/grid_filled.svg": "11fc5f75285f1929b66133052c67a0d4",
"assets/assets/icons/grid_light.svg": "4143806f06797737701447bcc9aba6df",
"assets/assets/icons/group_filled.svg": "91d45dba3cb0ddd734ff1e8c1d06ebc6",
"assets/assets/icons/group_light.svg": "2db10818406bd9809dfca1b7c0b3bed0",
"assets/assets/icons/growth_filled.svg": "ae0b077cafd4fd5efa9cb731a4cc5a50",
"assets/assets/icons/growth_light.svg": "ae0b077cafd4fd5efa9cb731a4cc5a50",
"assets/assets/icons/hand%2520cursor_filled.svg": "3b68323ad3175d5bc7637e200e5022db",
"assets/assets/icons/hand%2520cursor_light.svg": "60ccf14b4dd7c9b7b31dca9b3e1829db",
"assets/assets/icons/hash_filled.svg": "d4814d9359a85fa728c41f10195f2ca6",
"assets/assets/icons/hash_light.svg": "d13ea4e07965d031c7e76f938af400de",
"assets/assets/icons/headphone_filled.svg": "5059d8d951484d45460a5a4280ccfd9f",
"assets/assets/icons/headphone_light.svg": "9212d655bfff131273bd2682b4afe88b",
"assets/assets/icons/heart_filled.svg": "7f5b32f7ce5d961d706f108a637b9d51",
"assets/assets/icons/heart_light.svg": "ce16dee05fa09f1df3c8191a7b2362d3",
"assets/assets/icons/help_filled.svg": "72783adaca5d13581129542739f0bb2b",
"assets/assets/icons/help_light.svg": "3a7c9e598f3e80ef350ce529262879ad",
"assets/assets/icons/hide_filled.svg": "1d17fad1af82a4197c7cc6e3fd256e14",
"assets/assets/icons/hide_light.svg": "80636313ecc05d13f47487c21a0a042b",
"assets/assets/icons/history_filled.svg": "0bbca6f01b078faa15f08f6c6929c0c9",
"assets/assets/icons/history_light.svg": "0bbca6f01b078faa15f08f6c6929c0c9",
"assets/assets/icons/home_filled.svg": "d2a5bba9a5595335241cae071da61e12",
"assets/assets/icons/home_light.svg": "1c8b6e288f63774794d1314d79efc965",
"assets/assets/icons/hourglass_filled.svg": "d5e5eebd89f7cbc5191e7d7ebf4a2c6b",
"assets/assets/icons/hourglass_light.svg": "e420ade045cbfbf20b0e344a21722e8d",
"assets/assets/icons/hybrid_view_filled.svg": "55b36f22f1ba38bb932180160d623de9",
"assets/assets/icons/hybrid_view_light.svg": "33458de1d2fcce2ab055fe2e3f321979",
"assets/assets/icons/image_filled.svg": "c2109349a40d13a022bea264f8be7650",
"assets/assets/icons/image_light.svg": "962f2199e58f3358d6caed30cb990950",
"assets/assets/icons/inbox_filled.svg": "9007ed8a9eb35e7b710e1c974d5def28",
"assets/assets/icons/inbox_light.svg": "ada4b0c3083785a30b14cd21aa23f1e9",
"assets/assets/icons/info_filled.svg": "7523e0158aa6cc184acef96dddcc5a24",
"assets/assets/icons/info_light.svg": "c8f999337d4c36e2be87763cb48d3fdd",
"assets/assets/icons/instagram_filled.svg": "f6ae5653762999b417c3c5b0e935fcff",
"assets/assets/icons/instagram_light.svg": "f6ae5653762999b417c3c5b0e935fcff",
"assets/assets/icons/internet_filled.svg": "5e1cfd5872173eb09b1eeeeee4cece5f",
"assets/assets/icons/internet_light.svg": "f42297ab695bc43a2190072627a6697e",
"assets/assets/icons/italics_filled.svg": "00768a1050209f94660f8a2437da5fef",
"assets/assets/icons/italics_light.svg": "00768a1050209f94660f8a2437da5fef",
"assets/assets/icons/justify_filled.svg": "fc1242536379be1a7d83b081ebead438",
"assets/assets/icons/justify_light.svg": "fc1242536379be1a7d83b081ebead438",
"assets/assets/icons/keyboard_filled.svg": "a922b3d77f72a94dd5e5bb5498ad851d",
"assets/assets/icons/keyboard_light.svg": "d0fa41b7d16105ef6a20592852431ed4",
"assets/assets/icons/keypad_filled.svg": "c16b7e841a91c380a120038eed09b438",
"assets/assets/icons/keypad_light.svg": "5e7cffe4589b05a4a51afdb856a141ff",
"assets/assets/icons/key_filled.svg": "2265f214fe8465a23a27eb320e1fe317",
"assets/assets/icons/key_light.svg": "34acb52e8665652c8d0f64557c667747",
"assets/assets/icons/laptop_filled.svg": "96875ba3b0fb798a28b3814d34f794b7",
"assets/assets/icons/laptop_light.svg": "6c538d43a6eae8fd2d75664f84e60632",
"assets/assets/icons/laugh_filled.svg": "5b2afff7e6ee517e85e74d53dac8f8c6",
"assets/assets/icons/laugh_light.svg": "6ebc7c28c2ea18a8271ffb18eeda4d01",
"assets/assets/icons/layers_filled.svg": "c5d5e5b97af92541f5930c0c48966f13",
"assets/assets/icons/layers_light.svg": "413736ea17a28a019c005e7493c81463",
"assets/assets/icons/layout_filled.svg": "d01a2c420af2c5f066e6b8d8876f6c49",
"assets/assets/icons/layout_light.svg": "7ea6cbbf30e0273a670389a7ac3ac020",
"assets/assets/icons/leaderboard_filled.svg": "c81bcc8e5342e8c7e98d0acc4a7399a9",
"assets/assets/icons/leaderboard_light.svg": "825f1f33827ec352870e05c8475d642c",
"assets/assets/icons/left_align_filled.svg": "ec60ddab1fa4a60964d27ba13558a21a",
"assets/assets/icons/left_align_light.svg": "ec60ddab1fa4a60964d27ba13558a21a",
"assets/assets/icons/line_chart_filled.svg": "3d583120edc95b2787ac36779ba23b54",
"assets/assets/icons/line_chart_light.svg": "3d583120edc95b2787ac36779ba23b54",
"assets/assets/icons/linkedin_filled.svg": "d0baf69bb59ec698d94e8cc15cd8cb23",
"assets/assets/icons/linkedin_light.svg": "831fb47603367b2ff56ab5f18b9cf801",
"assets/assets/icons/link_filled.svg": "6ae641acf451543a41fcb6e019157a43",
"assets/assets/icons/link_light.svg": "6ae641acf451543a41fcb6e019157a43",
"assets/assets/icons/list_filled.svg": "b6ae3b7d587d650e3977230aa9dd8bd6",
"assets/assets/icons/list_light.svg": "b9f5e670954ba81110abca4f120c41d3",
"assets/assets/icons/live_filled.svg": "28dcd2861d8af7ad16d2900824b83133",
"assets/assets/icons/live_light.svg": "28dcd2861d8af7ad16d2900824b83133",
"assets/assets/icons/loader_filled.svg": "37433c28bb4736fccb71b4583d034fc3",
"assets/assets/icons/loader_light.svg": "768134066be0c3e7a386a6fa44beb707",
"assets/assets/icons/location_filled.svg": "7d3a038e14bd6b9b17e1b454612d5e72",
"assets/assets/icons/location_light.svg": "45081d12a4d53416aeae47480f5725e4",
"assets/assets/icons/lock_filled.svg": "95f0680d7eee43d0503b945e2f34dad2",
"assets/assets/icons/lock_light.svg": "369d22bfb944ebd8d2dbd9e653a227ab",
"assets/assets/icons/login_filled.svg": "4f9e3176af1a435cac20e4fa4b323ee4",
"assets/assets/icons/login_light.svg": "e234a88c807badbf009b20ff272e7666",
"assets/assets/icons/logout_filled.svg": "7d0c0e11bfe02a3aa17538e36d2aa0d1",
"assets/assets/icons/logout_light.svg": "d1cd82d02e2f73946f1787e814768c6a",
"assets/assets/icons/mail_filled.svg": "a1c7a53b3f819869ed9cb7e636728164",
"assets/assets/icons/mail_light.svg": "f7e3b57fc4d88ab8b0cd411c67240dda",
"assets/assets/icons/map_filled.svg": "ee7a8df9af362167967b0c95146299eb",
"assets/assets/icons/map_light.svg": "399f6a6ef601dde4f120e1008d0f8978",
"assets/assets/icons/medal_filled.svg": "8b9a9a3f70cbcb1d8f51cf421e1047ab",
"assets/assets/icons/medal_light.svg": "6ca87b558901867afc9dc6befcf101ac",
"assets/assets/icons/meh_filled.svg": "422cb4814793c25fe0673a5d92a0653a",
"assets/assets/icons/meh_light.svg": "c95490439a6d7495fbbdd1edcddf1059",
"assets/assets/icons/menu_filled.svg": "1f24663bbf047ba439d4bdbfb8eb8a79",
"assets/assets/icons/menu_light.svg": "1f24663bbf047ba439d4bdbfb8eb8a79",
"assets/assets/icons/messages_filled.svg": "2b2680167314df17472f6d5bcfd1c57a",
"assets/assets/icons/messages_light.svg": "75a2507cb6967671dfaf2a8b6dbe81fb",
"assets/assets/icons/message_filled.svg": "da9fd3849a8cb05e58d7ab11e3c27aa5",
"assets/assets/icons/message_light.svg": "9f0620e87b8f76e24046e3b3c2bc1026",
"assets/assets/icons/mic_filled.svg": "c7864c7ff63a89b7a2f5c508b94ea0cf",
"assets/assets/icons/mic_light.svg": "88c6f03cc2ea89ed2928e69c4bc2e598",
"assets/assets/icons/mic_off_filled.svg": "9a1007b340cc3cc921c91c8af004e996",
"assets/assets/icons/mic_off_light.svg": "18a13c2b50beebf0d1726c6a4ec4db51",
"assets/assets/icons/mission_filled.svg": "23a931bbc6a864195c83ed4526a90e0a",
"assets/assets/icons/mission_light.svg": "c095a3ec9c58fd05db09989d864c1aee",
"assets/assets/icons/mobile_filled.svg": "1d42480bdc70372fb8952d763e089dc5",
"assets/assets/icons/mobile_light.svg": "c9622dbfa82b72996310576d02b3f721",
"assets/assets/icons/moon_filled.svg": "e60fae367019f0115204d9a67755a4a9",
"assets/assets/icons/moon_light.svg": "ea1c8217c41467f17872ca02eccfae27",
"assets/assets/icons/more_horizontal_filled.svg": "5862c720885f948e9d37d63d8cf16796",
"assets/assets/icons/more_horizontal_light.svg": "dad5b693b1c260894191af77c368ed19",
"assets/assets/icons/more_vertical_filled.svg": "0306c4b5420315688f98dcac0a9f77a9",
"assets/assets/icons/more_vertical_light.svg": "9c532b30a0481800f96a64f51f623045",
"assets/assets/icons/mouse_filled.svg": "a492ea127d4566ebd79261e5d951123d",
"assets/assets/icons/mouse_light.svg": "72b4631c662af17ae8b35e55078297b0",
"assets/assets/icons/multiselect_filled.svg": "861654b03c6d7ca532c9901349a81a2a",
"assets/assets/icons/multiselect_light.svg": "15445e0757d142c2a995f4f8efb8a54e",
"assets/assets/icons/music_filled.svg": "523fb30ce6a3b423b8bbabc9aa656ebc",
"assets/assets/icons/music_light.svg": "dcc3f9b08c2327f6e495168c7291180c",
"assets/assets/icons/new_filled.svg": "1de24578cf9ceab35fbd175efdfbc94d",
"assets/assets/icons/new_light.svg": "f3eeec3a9a8f99083eb6e389845a7e2f",
"assets/assets/icons/next_filled.svg": "699756467645ce0111821741f12400e8",
"assets/assets/icons/next_light.svg": "16616fe081375043162ceb6dd290e7ea",
"assets/assets/icons/notes_filled.svg": "5ae76617987201536bfe7e6c0141dd7f",
"assets/assets/icons/notes_light.svg": "2c0392854fd53f6a6e95e731b92fda30",
"assets/assets/icons/note_filled.svg": "b84c9f2d9ad34f134064f6e19c3d2ec7",
"assets/assets/icons/note_light.svg": "b16cc0fd36d04d88b3dc0882f36dd0b3",
"assets/assets/icons/notification_filled.svg": "1345a5d2f34f72699f3c3b7caab14d4e",
"assets/assets/icons/notification_light.svg": "d2123097207040befef07fb43f98d0d4",
"assets/assets/icons/notification_off_filled.svg": "10230c06bb79b9a5576b0002c59d41b1",
"assets/assets/icons/notification_off_light.svg": "740fe2cc5bb2e80fd4c956a53dd03c20",
"assets/assets/icons/open_filled.svg": "af5689d88b955e461781a2368c2a66ae",
"assets/assets/icons/open_light.svg": "f8bde943572909f14b3cc3407a5e5dea",
"assets/assets/icons/paint_bucket_filled.svg": "955d78ef64d94d0e330a2993b473836b",
"assets/assets/icons/paint_bucket_light.svg": "238a1f1344b38ad95ebae5c58283de4f",
"assets/assets/icons/paint_roller_filled.svg": "102cbd4aaa16423e4b4f8c6d32a769b5",
"assets/assets/icons/paint_roller_light.svg": "1818bad016fb55701bf4741602eb21bb",
"assets/assets/icons/paragraph_filled.svg": "b7fe61a415a7a6fef5a37dbdbf187566",
"assets/assets/icons/paragraph_light.svg": "4341ffdfe033723a2d9327f51e3c058d",
"assets/assets/icons/pause_filled.svg": "da2d7ddf0cc201b2579912272874d77e",
"assets/assets/icons/pause_light.svg": "da2d7ddf0cc201b2579912272874d77e",
"assets/assets/icons/payment_filled.svg": "c75103f55c778fd076178b328e8e3682",
"assets/assets/icons/payment_light.svg": "689ab1e9469c58675707f4628c45ef1e",
"assets/assets/icons/pen_filled.svg": "daf2308bb675678b9e2953795d4f0f05",
"assets/assets/icons/pen_light.svg": "b91f35f40353e42f5f1d81a0d5623c13",
"assets/assets/icons/percent_filled.svg": "df38001cd560ef74ba5d238d072c9570",
"assets/assets/icons/percent_light.svg": "df38001cd560ef74ba5d238d072c9570",
"assets/assets/icons/person_filled.svg": "92bccdf2d194a537ce923b5bcc7d019c",
"assets/assets/icons/person_light.svg": "dc0bd430de7e68d07416fd7a1c904b6b",
"assets/assets/icons/phone_call_incoming_filled.svg": "bb7e73d688b73bb8e06ac302961c28c1",
"assets/assets/icons/phone_call_incoming_light.svg": "c7e53fb573c15a35b2246c9d15b0e834",
"assets/assets/icons/phone_call_outgoing_filled.svg": "c1859e489e0cb94a62e8a6dd3756ae47",
"assets/assets/icons/phone_call_outgoing_light.svg": "4a9cb35f0fae0b6466706cf860a978ad",
"assets/assets/icons/phone_call_rejected_filled.svg": "3b1fbce45bb50014f7387939bde430d4",
"assets/assets/icons/phone_call_rejected_light.svg": "7472b0554d9217a70aef7350cd992a2d",
"assets/assets/icons/phone_filled.svg": "979411a3bdffb01c16e8c72ad2276344",
"assets/assets/icons/phone_light.svg": "19a359ba7c34fc37bfb313ce2144837d",
"assets/assets/icons/photos_filled.svg": "637d150d9f225f265a30f060e1d3a87b",
"assets/assets/icons/photos_light.svg": "1d9eb6b9d863af8b6f027b1a4f8b5d8c",
"assets/assets/icons/pie_chart_filled.svg": "b97f4c9879d2b028ed03cdc7f1d2c6fe",
"assets/assets/icons/pie_chart_light.svg": "fe1a66fe47832c687c00849a94322aea",
"assets/assets/icons/pinterest_filled.svg": "549d258422a4396752b85301ef7c69c6",
"assets/assets/icons/pinterest_light.svg": "549d258422a4396752b85301ef7c69c6",
"assets/assets/icons/pin_filled.svg": "cb271f46a3c3f26809549d50e7bfc2fa",
"assets/assets/icons/pin_light.svg": "3d6441cb7cda6ada84f76d25e6dd4a53",
"assets/assets/icons/pizza_filled.svg": "e1808a7ecc7f874aeef28c3a3f6d96ca",
"assets/assets/icons/pizza_light.svg": "8150c2aa79cb8599c2c050e757076aeb",
"assets/assets/icons/playlist_filled.svg": "d787d529a27674098c2184e85c32e19a",
"assets/assets/icons/playlist_light.svg": "ca351fb363800b922aad07c0c5a3a2cd",
"assets/assets/icons/play_circled_filled.svg": "98ca8e0c45b6b4641eaa400beea4b698",
"assets/assets/icons/play_circled_light.svg": "093bb4892f045ae62e65bf64a2f49b31",
"assets/assets/icons/play_filled.svg": "207cfdadd4b25220f16e66e7603405ea",
"assets/assets/icons/play_light.svg": "97282464382fc1c260eddce315bf80c6",
"assets/assets/icons/power_filled.svg": "a6a3f00bc1dd9c6689f7b81dba335fd4",
"assets/assets/icons/power_light.svg": "a6a3f00bc1dd9c6689f7b81dba335fd4",
"assets/assets/icons/presentation_filled.svg": "3590cc7054dd61b96f0f1eafb3655a8b",
"assets/assets/icons/presentation_light.svg": "eeb462a5c1e76f720f0f5d02a37e8132",
"assets/assets/icons/previous_filled.svg": "c6eeab30c1580774f529e6387713c66e",
"assets/assets/icons/previous_light.svg": "291d38635f88743a4acd7a664da3ce32",
"assets/assets/icons/printer_filled.svg": "9a643a24c54146161c6ad5c788913c8b",
"assets/assets/icons/printer_light.svg": "510181b91bdfac1423e4a807a8215cad",
"assets/assets/icons/privacy_filled.svg": "108815271a9fc908772a2c5a9759c641",
"assets/assets/icons/privacy_light.svg": "d4ecc5690e9bb1cb03c0f86660bfa7ec",
"assets/assets/icons/profile_circled_filled.svg": "de7c2f275bb1c50be12e0a8b6a4fcb09",
"assets/assets/icons/profile_circled_light.svg": "c8c556aeb61ab071087010d585446ca7",
"assets/assets/icons/promotion_filled.svg": "e3ed1c3c35e378b4152d8beaccaf5e41",
"assets/assets/icons/promotion_light.svg": "55fddbbfb9cabc31aa547501b377b3c9",
"assets/assets/icons/puzzle_filled.svg": "ffcd1a4dd94f8128cc991f650a2df6e7",
"assets/assets/icons/puzzle_light.svg": "68f659e1031b302aefcc34a013ebda39",
"assets/assets/icons/rain_filled.svg": "42d10f2321b3d89a9cde8422051e41fb",
"assets/assets/icons/rain_light.svg": "e821cf14846aa2966edceba313693a3d",
"assets/assets/icons/receipt_filled.svg": "10633feaee78ebd0f8e9e6c27376a8a5",
"assets/assets/icons/receipt_light.svg": "26973afe17e9a4caf1475971ae5f518c",
"assets/assets/icons/redo_filled.svg": "9056355cedceedc16b91fdbef33a0100",
"assets/assets/icons/redo_light.svg": "07b5bd13e5b8b8eb3cc4691887caa61a",
"assets/assets/icons/reload_filled.svg": "ae3db2163e8bad0aedab4787ab4c1054",
"assets/assets/icons/reload_light.svg": "ae3db2163e8bad0aedab4787ab4c1054",
"assets/assets/icons/remove_filled.svg": "0e462c43ae8601463099b7fb63cf24ba",
"assets/assets/icons/remove_light.svg": "0e462c43ae8601463099b7fb63cf24ba",
"assets/assets/icons/repeat_filled.svg": "06e71078de02f3b315ff1a9c7e8434d1",
"assets/assets/icons/repeat_light.svg": "c16020664c784335917bb9f820928480",
"assets/assets/icons/right_align_filled.svg": "98454f30aa290fd2c7c83ee7ca39671f",
"assets/assets/icons/right_align_light.svg": "98454f30aa290fd2c7c83ee7ca39671f",
"assets/assets/icons/rocket_filled.svg": "db818c1dedf1284376d0962e19c9c5d2",
"assets/assets/icons/rocket_light.svg": "0ff78fe89c8b7bb8c10e8ce52b70c627",
"assets/assets/icons/ruler_filled.svg": "bc1afb165073f67b17a1fc43aaa65642",
"assets/assets/icons/ruler_light.svg": "45349563e07b0674ce9ffcadf174feeb",
"assets/assets/icons/rupee_filled.svg": "341cd0c95e8bbabe69412bf415e137dc",
"assets/assets/icons/rupee_light.svg": "13e1fe2eb47ef25fb0462b6ab1e23fc7",
"assets/assets/icons/sad_filled.svg": "4cd0eb54d3888b1f13df3e23401f1610",
"assets/assets/icons/sad_light.svg": "8170bd0cc963df962fd973d7250c5d18",
"assets/assets/icons/safe_filled.svg": "c96ae8556796df685812be99b8b85c5f",
"assets/assets/icons/safe_light.svg": "a5de7c6c488af4ef5e02bbcba7b1d21b",
"assets/assets/icons/save_filled.svg": "5970bbbc118accce6a9787f05fc64c4c",
"assets/assets/icons/save_light.svg": "68a07c23b3dfa1a55f8036fa3fb8913e",
"assets/assets/icons/scan_filled.svg": "41ea01ee9477e1f753ba09d9aaa3b137",
"assets/assets/icons/scan_light.svg": "52626639526e865762b89a9c70d28905",
"assets/assets/icons/schedule_filled.svg": "6ff728059f96011d80cddc02672f665b",
"assets/assets/icons/schedule_light.svg": "2055d17f13be8d3a08cd94f4bc31b6bc",
"assets/assets/icons/scissors_filled.svg": "3dc4434ccfe979d5fb6973f9fd60ba58",
"assets/assets/icons/scissors_light.svg": "d86d2ebea90a55de0c75904d40b20ac3",
"assets/assets/icons/search_filled.svg": "9df88ba039f05cabe86ac2aaf40d9a6d",
"assets/assets/icons/search_light.svg": "67cce736d321dcf4770ba7530cd30ac0",
"assets/assets/icons/send_filled.svg": "49d52cb9fd2dd2761eb127b1439c5382",
"assets/assets/icons/send_light.svg": "8a923f26f013f7447ba8db90f834d754",
"assets/assets/icons/server_filled.svg": "dfea2173dd660851eae400b29a048100",
"assets/assets/icons/server_light.svg": "8eb9405d273d9907c21df78548f67f3a",
"assets/assets/icons/settings_filled.svg": "eccf68ff6ba553e295e58e8e5980269e",
"assets/assets/icons/settings_light.svg": "9009df88ec61bcb2640ec983c3a55ac8",
"assets/assets/icons/share_filled.svg": "197bed2f60dd27712958ee3030a162fb",
"assets/assets/icons/share_light.svg": "4d8c17b1580539c86f56e2fbbd895642",
"assets/assets/icons/shield_check_filled.svg": "60679de8b380937215df480c9cd9f601",
"assets/assets/icons/shield_check_light.svg": "8926ddd69b27189c826bd4fefdb508c1",
"assets/assets/icons/shield_filled.svg": "bd4aaa10058d4c58a467608918c9a87b",
"assets/assets/icons/shield_light.svg": "5a1544b1ab3d5e08ce1aa635242de730",
"assets/assets/icons/ship_filled.svg": "b7a0a99cbb095ecbfbf11ef0743d2b65",
"assets/assets/icons/ship_light.svg": "b6060ac531edb4cb5c146bc4bc9e0ce4",
"assets/assets/icons/shopping_bag_filled.svg": "b7db16d7bda76b5d31c75081d452ab81",
"assets/assets/icons/shopping_bag_light.svg": "d69b59f18d90ea55584d285c521f3e7b",
"assets/assets/icons/show_filled.svg": "6001db307ee377ed898af877285d7360",
"assets/assets/icons/show_light.svg": "2e30c13ce30060ad8ee96613d5fe92f8",
"assets/assets/icons/shuffle_filled.svg": "4ac2a9d2cf12bc34cb3546e3f4c09f73",
"assets/assets/icons/shuffle_light.svg": "aedda47e03c8ca7459bf4f1da2b9d7bf",
"assets/assets/icons/size_filled.svg": "a34e528c36d994745d08b96452d61d1e",
"assets/assets/icons/size_light.svg": "e18e5323aebbb3fb660de89c7d0ee18c",
"assets/assets/icons/slack_filled.svg": "4951ad89808ea272baadb9db2b1e5da2",
"assets/assets/icons/slack_light.svg": "0fc7920f221e5ee93ac709334b3e5a8a",
"assets/assets/icons/smart_watch_filled.svg": "4c050c87c1b15b7be29dfa66a30601f5",
"assets/assets/icons/smart_watch_light.svg": "8d0bdabc744991ee166dafe79cadb72a",
"assets/assets/icons/smile_filled.svg": "3c1e33da12446bdef2a29ae9fd376fd5",
"assets/assets/icons/smile_light.svg": "9614c23381fce5c603871a8875d12053",
"assets/assets/icons/snapchat_filled.svg": "7217a00de9c00d6bc00bd3169f0307bd",
"assets/assets/icons/snapchat_light.svg": "b8eb58d48e28e3304a05f6bc6b13409c",
"assets/assets/icons/snowflake_filled.svg": "937d7a461db6ba42dc15b46dca9adea7",
"assets/assets/icons/snowflake_light.svg": "937d7a461db6ba42dc15b46dca9adea7",
"assets/assets/icons/sort_ascending_filled.svg": "df7d4fec97fb57ff33eea5307ce72fd0",
"assets/assets/icons/sort_ascending_light.svg": "df7d4fec97fb57ff33eea5307ce72fd0",
"assets/assets/icons/sort_decending_filled.svg": "735402e8b677648e5b04730054d6c69b",
"assets/assets/icons/sort_decending_light.svg": "735402e8b677648e5b04730054d6c69b",
"assets/assets/icons/sort_filled.svg": "1ca8830d9a7c1637772f72c7b3336d21",
"assets/assets/icons/sort_light.svg": "1ca8830d9a7c1637772f72c7b3336d21",
"assets/assets/icons/spotify_filled.svg": "9e675bc1ce60100346374f3dd94b8bcb",
"assets/assets/icons/spotify_light.svg": "2ba593b15e18e4f071489bae7e65cdc2",
"assets/assets/icons/spray_filled.svg": "12912d9adecae2cf392b9a653474dac1",
"assets/assets/icons/spray_light.svg": "7aa85b1df82bacac86a5c9e318835e3b",
"assets/assets/icons/star_filled.svg": "5c893b109aa7e054d3f8aff646cb0d23",
"assets/assets/icons/star_light.svg": "186b3f5307300049579dbcd386905b04",
"assets/assets/icons/stop_filled.svg": "dba8f7aba8b3e3eafcca0c82725f116f",
"assets/assets/icons/stop_light.svg": "dba8f7aba8b3e3eafcca0c82725f116f",
"assets/assets/icons/store_filled.svg": "40315b39e7e3abd6ec9a2d54bde810b4",
"assets/assets/icons/store_light.svg": "651519c66053f3925b3f6092334efe36",
"assets/assets/icons/sun_filled.svg": "23c50c0501a9c72be4cca85d8aa046d0",
"assets/assets/icons/sun_light.svg": "7c58f95d3ff532cc4c60a5a8676741e1",
"assets/assets/icons/sync_filled.svg": "62730bfe043411042a8448c596df9d1d",
"assets/assets/icons/sync_light.svg": "62730bfe043411042a8448c596df9d1d",
"assets/assets/icons/tablet_filled.svg": "f895561c5d263d34f5c812f67bb280a9",
"assets/assets/icons/tablet_light.svg": "d1ba891b544c63df3c61f0bb7aff3041",
"assets/assets/icons/table_tennis_filled.svg": "ca3d8ea7f25ae6cbd2432280fc4dd17d",
"assets/assets/icons/table_tennis_light.svg": "475933e7583dcc78d9f9fe9066dc0048",
"assets/assets/icons/tag_filled.svg": "328d1bb7e6f7165bdd13dd2c3d5b0b8a",
"assets/assets/icons/tag_light.svg": "29ee3959cccde0bd5dd206a2b145e168",
"assets/assets/icons/target_filled.svg": "bbe74225d273e02375f3b94d34caaae1",
"assets/assets/icons/target_light.svg": "d3c931aee9ef19b2400fb92f1005e3db",
"assets/assets/icons/thermometer_filled.svg": "de8f7bbe8362b9a598e7645e12db795a",
"assets/assets/icons/thermometer_light.svg": "de8f7bbe8362b9a598e7645e12db795a",
"assets/assets/icons/thumbs_down_filled.svg": "8e5a2c19536770f0164f690e289ee084",
"assets/assets/icons/thumbs_down_light.svg": "1b73780997852029f0bedc22ae61c679",
"assets/assets/icons/thumbs_up_filled.svg": "dd469bca06c8d7ea02f78478379fac2c",
"assets/assets/icons/thumbs_up_light.svg": "9e9b88c0182fdc972d5289ae39546dbe",
"assets/assets/icons/ticket_filled.svg": "cdb59abf9ddf8bbb1d02530cd1a1541b",
"assets/assets/icons/ticket_light.svg": "4f3aefda87fcf3236af000ff15c1d499",
"assets/assets/icons/tile_view_filled.svg": "8ebc7edf3e042aad869efc46c8e1f6fa",
"assets/assets/icons/tile_view_light.svg": "c037e368e1c372ce711b0b0f67bc4434",
"assets/assets/icons/timer_filled.svg": "0095af077f525f877af626deb46526d3",
"assets/assets/icons/timer_light.svg": "b40f18864c8fc03142afeff848439c76",
"assets/assets/icons/toggle_off_filled.svg": "f9ecea3259a318c89a033f43201a27ea",
"assets/assets/icons/toggle_off_light.svg": "f996df5cb83299e3352213d2ddce67dc",
"assets/assets/icons/toggle_on_filled.svg": "1407e434b54d06859d86c5d429f82767",
"assets/assets/icons/toggle_on_light.svg": "a7da16d88bbe4c2496ef63fdc489b8ce",
"assets/assets/icons/tool_filled.svg": "b7011abebaecce37f26253c0b242fe40",
"assets/assets/icons/tool_light.svg": "c82caf09e73a508492ef7b93c21b1ae0",
"assets/assets/icons/train_filled.svg": "24f44a572ae909a1aeaa18c9e9696474",
"assets/assets/icons/train_light.svg": "a1ccbefb9e3bd56fe8590ffe716ec24a",
"assets/assets/icons/trash_filled.svg": "905a6ff314d7b093d54d1f768631a110",
"assets/assets/icons/trash_light.svg": "2acce5177d98c7f2d4f178bec329775c",
"assets/assets/icons/trending_down_filled.svg": "ad17ff2e1c9c2e1432bf94359cd50db8",
"assets/assets/icons/trending_down_light.svg": "ad17ff2e1c9c2e1432bf94359cd50db8",
"assets/assets/icons/trending_up_filled.svg": "66123a63f7328d37b3375a4ec011b814",
"assets/assets/icons/trending_up_light.svg": "66123a63f7328d37b3375a4ec011b814",
"assets/assets/icons/trophy_filled.svg": "f39621f5528182d8e986c2ef90db252e",
"assets/assets/icons/trophy_light.svg": "fc6d9160afb9a9e4ebc2ec2258228cd3",
"assets/assets/icons/truck_filled.svg": "3fb5afe7c08c05f682184e77e3d19d52",
"assets/assets/icons/truck_light.svg": "807f3db1578d6006cbfa457d84cf7704",
"assets/assets/icons/tune_filled.svg": "403ecf576bdbeab0e99bb9c0516ddb48",
"assets/assets/icons/tune_light.svg": "136b0bd007067a05eeda6c8a578c4b7a",
"assets/assets/icons/tv_filled.svg": "825591d5b2e9e54ee2a099775c77de11",
"assets/assets/icons/tv_light.svg": "8b828ce0ffa81f419958de120fa5bb5f",
"assets/assets/icons/twitch_filled.svg": "10c3151234daa0f6fea8cbe2abd55243",
"assets/assets/icons/twitch_light.svg": "53e1e92860bd2ca5bc4a82fad66e7839",
"assets/assets/icons/twitter_filled.svg": "4df82d739f1ed9a4ce629c67d8815614",
"assets/assets/icons/twitter_light.svg": "f6b0243764d971ccf8b467f7889d823a",
"assets/assets/icons/umbrella_filled.svg": "9dc08d1e1d736b20c7933a9f620e4364",
"assets/assets/icons/umbrella_light.svg": "2ef2974cf5dd82a2638d1623d4ec34e2",
"assets/assets/icons/underline_filled.svg": "4181f94bbebf258b2fd1ff11ccfa6936",
"assets/assets/icons/underline_light.svg": "4181f94bbebf258b2fd1ff11ccfa6936",
"assets/assets/icons/undo_filled.svg": "93c78d5e5f2b108b6fa58d6b6312cc3b",
"assets/assets/icons/undo_light.svg": "bae0862678a8e8d0f00e034eb2de0510",
"assets/assets/icons/unlock_filled.svg": "4a7de9b5341922f47700876cca9755fd",
"assets/assets/icons/unlock_light.svg": "bcecbe3b9e69bb415ffd86838157c3dc",
"assets/assets/icons/update_filled.svg": "caa0cdd0a7dda0dcafac9dbce34d1ca4",
"assets/assets/icons/update_light.svg": "37bb3313950ccf4b5661e57647214ae4",
"assets/assets/icons/upload_filled.svg": "6204fc384007c926aff9b36e67d9ecbb",
"assets/assets/icons/upload_light.svg": "4baa4e76edb382bbed9d1d336bb2ba25",
"assets/assets/icons/utensils_filled.svg": "b827722a410a06012018516301c22ea2",
"assets/assets/icons/utensils_light.svg": "ddc11094e02702d8bcaeb29ab9b21748",
"assets/assets/icons/vector_filled.svg": "a4be6191d264eb219f345165d4d6fef9",
"assets/assets/icons/vector_light.svg": "a610efc0497beed4b587f9291cbdb90a",
"assets/assets/icons/video_off_filled.svg": "33060fb7dd8c497fc16793326ed33c69",
"assets/assets/icons/video_off_light.svg": "4acce0718334aa5b8e58d3fe053f2605",
"assets/assets/icons/video_recorder_filled.svg": "21f0e37642d100c8acf2303fdb1df8e7",
"assets/assets/icons/video_recorder_light.svg": "90a5a3557854ceb8bfc4a61eed63637f",
"assets/assets/icons/volume_filled.svg": "730f0221665fde65bc80415610516819",
"assets/assets/icons/volume_high_filled.svg": "8e3efec4acd6350e3917b3bedf4c075e",
"assets/assets/icons/volume_high_light.svg": "4a3a9874c7ec7df84e186754cef0b958",
"assets/assets/icons/volume_light.svg": "d95ac0bc64e62248098a0497becbbf3a",
"assets/assets/icons/volume_off_filled.svg": "cf2e5ef8d8d2b01e4b2369b75bb0883b",
"assets/assets/icons/volume_off_light.svg": "6d226d853b0262f46b824a1eaf06d5cd",
"assets/assets/icons/wallet_filled.svg": "f66d0a446f9b4343bcf80507a040aa9a",
"assets/assets/icons/wallet_light.svg": "8e76dfea7190e30937160f0a9f1f8144",
"assets/assets/icons/warning_filled.svg": "8a859d7c6e235aca39cba015453271e6",
"assets/assets/icons/warning_light.svg": "da2e5123ce08b7a1b1787155a78d8bac",
"assets/assets/icons/watch_filled.svg": "4d85f9ab4af535656358e7374387dae1",
"assets/assets/icons/watch_light.svg": "b64ca7f8d2bb982a559bfc8863d6d0a3",
"assets/assets/icons/web_development_filled.svg": "724eb690ccd6c2f84d9b3c4923ab1a86",
"assets/assets/icons/web_development_light.svg": "66e888b0a6d732f7ec9ef2a35350c096",
"assets/assets/icons/wifi_filled.svg": "3c4a5f6497975cdf61f9d94e8eb52b7f",
"assets/assets/icons/wifi_light.svg": "3c4a5f6497975cdf61f9d94e8eb52b7f",
"assets/assets/icons/wifi_off_filled.svg": "ad37914f615fa7d13cc1c851c2e992d6",
"assets/assets/icons/wifi_off_light.svg": "ad37914f615fa7d13cc1c851c2e992d6",
"assets/assets/icons/window_filled.svg": "96ac2c554fee9a6e16da64eb229ebd07",
"assets/assets/icons/window_light.svg": "c18717c136c6d1c40acc61c92660656b",
"assets/assets/icons/wind_filled.svg": "b0e249dc4467522d774ff50136cf4a94",
"assets/assets/icons/wind_light.svg": "b0e249dc4467522d774ff50136cf4a94",
"assets/assets/icons/wine_filled.svg": "1bee8cb54a3ae9ecbe3003fb3272f30d",
"assets/assets/icons/wine_light.svg": "ce94955769007b2ee4a100ba004a1ce2",
"assets/assets/icons/youtube_filled.svg": "1277602d1cc3fe37d31537c11e7e7084",
"assets/assets/icons/youtube_light.svg": "e602c9c8912826297d39fe6ff02df400",
"assets/assets/icons/zap_filled.svg": "5b1d8a8a5cfe229d1610db1f67c713e4",
"assets/assets/icons/zap_light.svg": "159ae351cdd2bdb8274f5a82a5985b92",
"assets/assets/icons/zoom_in_filled.svg": "0f10cd97e3a0e3a00dc66c2a87df0078",
"assets/assets/icons/zoom_in_light.svg": "a9dd1be0a9e71dbfb379ffcc55254762",
"assets/assets/icons/zoom_out_filled.svg": "6cd98f5f1120d87ca4b7d3bf6f36a9de",
"assets/assets/icons/zoom_out_light.svg": "ee3049a94b390fe39af1211a760fbe1d",
"assets/assets/image-1.png": "f735fb5bab47faac3046a5f61f8e29f2",
"assets/assets/image-2.png": "0e4432f5bd59e9dea2d41f395cb3d0b4",
"assets/assets/image-3.png": "1e12fa4f4e85e93f5d8bc4d89fc9138e",
"assets/assets/image-4.png": "0447bf18c7ca5b5eafd2d8a1bfc68c4a",
"assets/assets/image.png": "e1c3995d0a4c45d8c2c8ca2a34084819",
"assets/assets/images/illustration/signup_illustration.png": "58cc9ed7c88057373fa27c77e0b4f7c0",
"assets/assets/logo/Logo.svg": "20513a36eb57c9aefe38f014178426c0",
"assets/assets/logo.png": "078e3fbe75850e051290abaabf7c1756",
"assets/assets/weman.png": "d55cab1f943d5508306feb1259752c27",
"assets/FontManifest.json": "1dc180890b0182281e3266a1c45eec89",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "e57edba6e0073757964c3f9951386fa2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/packages/simple_barcode_scanner/assets/barcode.html": "7a1c45aca573208e15c71b378fdbe027",
"assets/packages/simple_barcode_scanner/assets/html5-qrcode.min.js": "d88d3200cb547c9e86ee972975561dcd",
"assets/packages/syncfusion_flutter_datagrid/assets/font/FilterIcon.ttf": "c17d858d09fb1c596ef0adbf08872086",
"assets/packages/syncfusion_flutter_datagrid/assets/font/UnsortIcon.ttf": "6d8ab59254a120b76bf53f167e809470",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "9b45d72aec99f7826d7c526a76bb52f0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "035c86391b4b04e7f2f3b29042fbb86b",
"/": "035c86391b4b04e7f2f3b29042fbb86b",
"main.dart.js": "c131398da54071a15cc0f99d53459b57",
"manifest.json": "ebf4d547a0c90a4746d7e07ed2b64902",
"version.json": "50b443a1dfd708c3e516f9811c78ba24"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
