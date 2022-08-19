# Base Project
Made a template using **BLoC pattern** approach with our project structure

## Contributors

 1. [Musaddiq Ahmed Khan][1]   [<img alt="Musaddiq625 | LinkedIn" width=16 src="https://cdn-icons-png.flaticon.com/512/174/174857.png">][musaddiq]
 2. [Adil Ahmed][2]  [<img alt="AdilAhmed | LinkedIn" width=16 src="https://cdn-icons-png.flaticon.com/512/174/174857.png">][adil]
 3. [Ammar Ayoubi][3]  [<img alt="AmmarAyoubi | LinkedIn" width=16 src="https://cdn-icons-png.flaticon.com/512/174/174857.png">][ammar]

 [1]: https://github.com/Musaddiq625
 [2]: https://github.com/Adil-Rangila
 [3]: https://github.com/ammarayoubi
 [musaddiq]: https://www.linkedin.com/in/musaddiq625
 [adil]: https://www.linkedin.com/in/adil-ahmed-566871151
 [ammar]: https://www.linkedin.com/in/ammar-ayoubi-925119188
 
 
 ## Getting Started 🚀
 Their are two ways
 1. Clone
 2. Installation ( Recommended )
 
 
 ## Clone 

Clone the the base_project repository 
```sh
 git clone https://github.com/Musaddiq625Org/base_project.git
```

 ## Installation 
 
Ensure you have the use_template installed.

 ### 🎯 Activate from https://pub.dev
```sh
dart pub global activate use_template
```
Write following command in your prefer terminal
```sh
use_template
```
You are asked for three parameters.
1. New name: This will be the new name of your application.
2. Template: Past the following Git URL.
 ```sh
 https://github.com/Musaddiq625Org/base_project.git
```

## Output Directory Structure 📦

Generated folder architecture
```
📂android
📂assets
 ┣ 📂app_icon
 ┃ ┗ 📜sample_icon.png 
 ┣ 📂images
 ┃ ┗ 📜sample_image.png  
 ┣ 📂vector
 ┃ ┗ 📜sample_vector.svg   
📂ios
📂lib
 ┣ 📂components
 ┃ ┣ 📂media
 ┃ ┃ ┗ 📜custom_image_preview.dart
 ┃ ┃ ┗ 📜media_source_selection_widget.dart 
 ┃ ┣ 📜loading_dialog.dart
 ┃ ┣ 📜main_scaffold_component.dart 
 ┃ ┣ 📜text_component.dart
 ┃ ┣ 📜toast_component.dart  
 ┣ 📂src
 ┃ ┣ 📂app_cubit
 ┃ ┃ ┗ 📜app_cubit.dart
 ┃ ┃ ┗ 📜app_state.dart 
 ┃ ┣ 📂constants
 ┃ ┣ ┣ 📂language_constant
 ┃ ┃ ┃ ┗ 📜english.dart
 ┃ ┃ ┃ ┗ 📜urdu.dart
 ┃ ┣ ┣ 📜app_constants.dart 
 ┃ ┣ ┣ 📜asset_constants.dart
 ┃ ┣ ┣ 📜color_constants.dart 
 ┃ ┣ ┣ 📜date_constants.dart 
 ┃ ┣ ┣ 📜font_styles_constants.dart 
 ┃ ┣ ┣ 📜http_constants.dart 
 ┃ ┣ ┣ 📜padding_constants.dart 
 ┃ ┣ ┣ 📜route_constants.dart 
 ┃ ┣ ┣ 📜shared_preference_constants.dart 
 ┃ ┣ ┣ 📜sizedbox_constants.dart 
 ┃ ┣ ┣ 📜string_constants.dart 
 ┃ ┣ 📂enums
 ┃ ┃ ┗ 📜sample_enum.dart
 ┃ ┣ 📂models
 ┃ ┃ ┗ 📜sample_model.dart 
 ┃ ┣ 📂network
 ┃ ┃ ┗ 📜dio_api_services.dart
 ┃ ┃ ┗ 📜dio_client_network.dart
 ┃ ┣ 📂repositories
 ┃ ┃ ┗ 📜token_repository.dart
 ┃ ┣ 📂screens
 ┃ ┣ ┣ 📂splash
 ┃ ┃ ┣ ┣ 📂cubit
 ┃ ┃ ┃ ┃ ┗ 📜splashe_cubit.dart
 ┃ ┃ ┃ ┃ ┗ 📜splash_state.dart
 ┃ ┃ ┃ ┗ 📜splash_interface.dart
 ┃ ┃ ┃ ┗ 📜splash_screen.dart
 ┃ ┣ 📂screens_args
 ┃ ┃ ┗ 📜sample_screen_args.dart 
 ┃ ┣ 📂services
 ┃ ┃ ┗ 📜navigation_service.dart
 ┃ ┃ ┗ 📜translation_srevice.dart
 ┃ ┃ ┗ 📜validation_service.dart
 ┃ ┣ 📂utils
 ┃ ┣ ┣ 📂firebase
 ┃ ┃ ┣ ┣ 📂firebase_wrappers
 ┃ ┃ ┃ ┃ ┗ 📜android_response_wrapper.dart
 ┃ ┃ ┃ ┃ ┗ 📜ios_response_wrapper.dart
 ┃ ┃ ┃ ┗ 📜firebase_util.dart
 ┃ ┣ ┣ 📜connection_util.dart
 ┃ ┣ ┣ 📜date_util.dart
 ┃ ┣ ┣ 📜datetime_picker.dart 
 ┃ ┣ ┣ 📜device_util.dart 
 ┃ ┣ ┣ 📜launcher_util.dart 
 ┃ ┣ ┣ 📜logger_util.dart 
 ┃ ┣ ┣ 📜navigation_util.dart 
 ┃ ┣ ┣ 📜share_util.dart 
 ┃ ┣ ┣ 📜shared_preferences_util.dart 
 ┃ ┣ 📂wrappers
 ┃ ┃ ┗ 📜token_res_wrapper.dart
 ┣ 📜generated_route.dart
 ┣ 📜main.dart
📂linux
📂macos
📂test
📂web
📂windows
📜.gitattributes
📜.gitignore
📜.metadata
📜analysis_options.yaml
📜pubspec.lock
📜pubspec.yaml
📜README.md
 ```

 ## License 🍀
 MIT License
 
    Copyright (c) 2022 Musaddiq625Org

    Permission is hereby granted, free of charge, to any person obtaining a copy 
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
