var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "884",
                    "DialogWidth": "1270"
                },
                "/Configuration": {
                    "PreloadWeight": "0"
                },
                "/General": {
                    "showToolbox": "false"
                },
                "/Wallpaper/CoverFlow/General": {
                    "CoverFlowBackgroundImage": "file:///media/datos/wallpapers/backgrounds/zorin-blur/1-sunrise.png",
                    "FillMode": "2"
                },
                "/Wallpaper/com.github.zren.inactiveblur/General": {
                    "FillMode": "2",
                    "Image": "file:///media/datos/Descargas/F150 Raptor bg x3 Wallpaper/X3O.jpg"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Blur": "true",
                    "Image": "file:///media/datos/wallpapers/Carl.png"
                },
                "/Wallpaper/org.kde.latte.slideshow/General": {
                    "SlideInterval": "20"
                },
                "/Wallpaper/org.kde.slideshow/General": {
                    "SlideInterval": "15",
                    "SlidePaths": "/media/datos/wallpapers/backgrounds/zorin-blur"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "90"
                        }
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        }
                    },
                    "plugin": "org.kde.plasma.appmenu"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/General": {
                            "length": "1256"
                        }
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "0"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "540",
                            "DialogWidth": "720"
                        },
                        "/General": {
                            "bold": "true",
                            "noWindowText": "Plasma ",
                            "noWindowType": "text",
                            "textType": "1"
                        }
                    },
                    "plugin": ""
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "100"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "480",
                            "DialogWidth": "640"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true",
                            "showAppsByName": "true"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/": {
                            "PreloadWeight": "94"
                        },
                        "/Appearance": {
                            "enabledCalendarPlugins": "/usr/lib/qt5/plugins/plasmacalendarplugins/holidaysevents.so",
                            "fontFamily": "SFNS Display"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "480",
                            "DialogWidth": "640"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "79",
                    "DialogWidth": "1920"
                },
                "/Configuration": {
                    "PreloadWeight": "0"
                }
            },
            "height": 1.625,
            "hiding": "normal",
            "location": "top",
            "maximumLength": 120,
            "minimumLength": 120,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
