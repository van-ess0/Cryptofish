#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include <QFileInfo>
#include <QFile>
#include <QCryptographicHash>
#include <sailfishapp.h>


class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = 0);

signals:
    void responseKey(bool answer);
    void fileDecrypted();

public slots:
//    void getDBLocation(QString path);
//    void fileRequest(QString name);
    void verification(QString Key);
//    void closing();

private:
    bool fileExists(QString path);
/*    void cryptFile(QString path);
    void decryptFile(QString path)*/;


};

#endif // FILEMANAGER_H
