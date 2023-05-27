# CV_sorting_box
Программа состоит из симуляции ковеера на движке Unity и обработки изображений в Matlab.

# Запуск
### 1. Создаем новый проект в Unity.
### 2. Из папки unity импортируем пакет box_sorting_cv.unitypackage
### 3. Запустить сцену Scenes/CVSystem
### 4. Для корректной работы лазеров необходимо произвести следующую настройку: File -> Build Settings -> Player Settings -> Player -> Other Settings -> Rendering -> Auto Graphics API for Windows (выключить галолчку) -> добавить OpenGLCore и поднять его на верх
### 5. Добавкляем в списке тегов тег "cube"
![image](https://github.com/rkdlight/CV_sorting_box/assets/30794595/557a0b11-80ef-4582-8362-a8a2831f85a0)
![image](https://github.com/rkdlight/CV_sorting_box/assets/30794595/1ed7d051-4aa9-48c1-8e87-10bde4726754)
![image](https://github.com/rkdlight/CV_sorting_box/assets/30794595/7e18b2ff-a769-45a3-bb83-2c5ac102e274)
### 6. Так как связь между Matlab и Unity происходит через файлы, нам необходимо указать пути, куда будут сохраняться файлы.
Первым делом добавляем путь для сохранения фото с камеры. Путь должен быть в формате ../../CV_sorting_box/matlab/TestImages (в начале должен быть путь до места куда вы скачали данный репозиторий)
![image](https://github.com/rkdlight/CV_sorting_box/assets/30794595/bf0d303c-9d5f-40ab-908b-a91313287890)
Далее нам необходимо указать путь к файлу из которого Unity будет получать результат работы Matlab. (cм фото ниже). Путь должен буть такой же как в прошлый раз, только добавиться указание на файл:../../CV_sorting_box/matlab/TestImages/result.json
![image](https://github.com/rkdlight/CV_sorting_box/assets/30794595/d7568fc9-0b7c-42f6-86f6-d28f1139df12)

### 7. В папке matlab запускаем файл TutorialBasic.m
### 7. Запускаем симуляцию в Unity

# Принцип работы
В среде Unity находится фишай камера. Когда коробки подъезжают к первому датчику поочередно включаются и включаются горизонтальный и вертикальный лазеры, одновременно с этим камера фотографирует коробку с лазерами. В это время matlab ожидает появления фото в папке, когда они появляются программа производит расчеты размеров коробок на основе статьи I. Kholodilin, Y. Li and Q. Wang, "Omnidirectional Vision System With Laser Illumination in a Flexible Configuration and Its Calibration by One Single Snapshot," in IEEE Transactions on Instrumentation and Measurement, vol. 69, no. 11, pp. 9105-9118, Nov. 2020, doi: 10.1109/TIM.2020.2998598. Рассчитанные значения размеров сохраняются в файл result.json, который уже ожидает unity.
Unity на основе наибольшего из габаритов коробки определяет на какую ковеерную линию необходимо направить коробку и соответственно направляет.


