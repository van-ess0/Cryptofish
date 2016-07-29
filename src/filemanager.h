#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>

class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = 0);

signals:

public slots:


private:
    bool verification(QString passwd);
};

#endif // FILEMANAGER_H
