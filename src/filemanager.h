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

public slots:
    void verification(QString Key);

private:
    bool fileExists(QString path);
};

#endif // FILEMANAGER_H
