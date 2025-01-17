# My Flutter Template

#### 创建 Flutter 项目的模板：

0. 创建一个新项目，项目名自己填；
1. 在 pubspec.yaml 复制第三方库，添加 images 、 fonts 类型。 在根目录创建 assets/images 、 assets/fonts 文件；
2. 在 Android 项目 AndroidManifest.xml 添加权限，修改 build.gradle 包名等；

    2.1 AndroidManifest.xml 添加权限，修改名称，图标；

    2.2 修改 build.gradle 包名，修改签名文件：
    
    ```
    signingConfigs {
        config {
            keyAlias 'test'
            keyPassword 'test'
            storeFile file('test.jks')
            storePassword 'test'
        }
    }
    
    buildTypes {
        debug {
            signingConfig signingConfigs.config
        }
        release {
            signingConfig signingConfigs.config
        }
    }
    ```

3. 在 iOS 项目 Info.plist 文件，复制添加权限；

    3.1 在根目录 cd ios 进入 iOS 项目，执行命令： pod install 生成 Podfile ；
    
    3.2 在 Podfile 文件修改第一行为： platform :ios, '12.0'；
    
    3.2 将最后的 post_install 修改为如下代码：
    
    ```
    post_install do |installer|
      installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "12.0"
                  config.build_settings['ENABLE_BITCODE'] = 'NO'
              end
          end
          project.build_configurations.each do |bc|
              bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = "12.0"
          end
      end
    end
    ```

4. 复制 lib 文件下的所有文件。
5. 右键 lib 文件夹，选择“Replace in Path..”，将 "my_flutter_template" 替换成自己的项目名。


**结束，可以开始写自己的代码了。**
