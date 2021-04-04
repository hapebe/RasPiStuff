# "Kressecam" - DYI webcam watching garden cress sprout in spring

These scripts run on a Raspberry Pi personal LAN server. If you want to make use of them, you will have to create and define your own *.keys* and *.urls* files, see the respective examples.

Photos are taken using an old smartphone running *IP Webcam*.

Kudos for software, services and knowledge to:

* Pavel Khlebovich for the Android [IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam) app
* ImageMagick, specifically (https://legacy.imagemagick.org/Usage/annotating/)
* [OpenWeatherMap](https://openweathermap.org/api) for temperature and atmospheric pressure data
* and last not least to the people behind Raspberry Pi and its OS

Dependencies

There are a few packages you will need and that may not be installed on your system yet:

    sudo apt install imagemagick jpeginfo