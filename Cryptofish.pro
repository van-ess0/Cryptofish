# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = Cryptofish

CONFIG += sailfishapp

SOURCES += src/Cryptofish.cpp \
    src/filemanager.cpp

OTHER_FILES += qml/Cryptofish.qml \
    qml/cover/CoverPage.qml \
    rpm/Cryptofish.changes.in \
    rpm/Cryptofish.spec \
    rpm/Cryptofish.yaml \
    translations/*.ts \
    Cryptofish.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS +=

DISTFILES += \
    qml/pages/PinCodePage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/Menu.qml \
    qml/pages/Notes.qml \
    qml/pages/Photo.qml \
    qml/pages/About.qml \
    qml/pages/Others.qml \
    qml/pages/NewNotePage.qml \
    qml/pages/GridNotePage.qml \
    qml/pages/DBManager.qml

HEADERS += \
    src/filemanager.h

