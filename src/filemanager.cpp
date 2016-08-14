#include "filemanager.h"
#define SALT  "359"
//#define ADDRESS (SailfishApp::pathTo("./").toString() + "path.key")

FileManager::FileManager(QObject *parent) : QObject(parent)
{
    bool identification(QString Key);
    bool fileExists(QString path);
}
/*
    verification - проверяет введеный ключ Key с сохранненым хеш
*/
void FileManager::verification(QString Key)
{
    passwd = new QString;
    *passwd = Key;
    qDebug() << QDir::homePath() + "/path.key - наш хеш пароля";
    QFile file(QDir::homePath() + "/path.key");
    QByteArray password;
    password.append(Key + SALT);
    qDebug() << "Entering verification";
    if(file.exists())
    {
        qDebug() << "Хеш файл есть!";
        file.open(QIODevice::ReadOnly);
        if(file.isOpen())
            qDebug() << "isOpen хеш пароля";
        else
            qDebug() << "NOT isOpen хеш пароля";
        QDataStream in(&file);

        QByteArray file_key;
        in >> file_key;

        //file_key = file.readAll();
        qDebug() << "file_key = " + QString(file_key) + "\n" + "isEmpty =";
        if(file_key.size() != 0)
        {
            if(file_key == QCryptographicHash::hash(password, QCryptographicHash::Sha3_512))
            {
                emit responseKey(true);
                qDebug() << "Verification sucssed";
            }
            else {
                emit responseKey(false);
                qDebug() << "Verification not sucssed";
            }
        }
        else
        {
            QDataStream out(&file);//create stream to file
            qDebug() << "111";
            out << QCryptographicHash::hash(password, QCryptographicHash::Sha3_512);//write to stream
            qDebug() << "211";
            emit responseKey(true);
        }
    }
    else
    {
        qDebug() << "231";
        file.close();
        //надо создать хешированный файл
        if(file.open(QIODevice::WriteOnly))//try open file
        {

            QDataStream out(&file);//create stream to file
            out << QCryptographicHash::hash(password, QCryptographicHash::Sha3_512);//write to stream
            qDebug() << QCryptographicHash::hash(password, QCryptographicHash::Sha3_512);
            emit responseKey(true);
        }
        else {
            qDebug() << "Error open";
            emit responseKey(false);
        }
    }
    file.close();//close file
}
void FileManager::changeKey(QString Key)
{
    qDebug() << "changeKey";
    QFile file(QDir::homePath() + "/path.key");
    if(!file.remove())
    {
        qDebug() << "Error remove file";
        emit passwordChanged(false);
        return;
    }
    if(file.open(QIODevice::WriteOnly))
    {
        QByteArray password;
        password.append(Key + SALT);
        QDataStream out(&file);//create stream to file
        out << QCryptographicHash::hash(password, QCryptographicHash::Sha3_512);//write to stream
        qDebug() << QCryptographicHash::hash(password, QCryptographicHash::Sha3_512);
        emit passwordChanged(true);
        passwd = new QString;
        *passwd = Key;
    }
    else
    {
        qDebug() << "Error open";
        emit passwordChanged(false);
    }
}

void FileManager::closing()
{
    delete passwd;
}
