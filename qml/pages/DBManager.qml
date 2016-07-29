import QtQuick 2.0
import QtQuick.LocalStorage 2.0

Item {

    //
    // TODO: использовать base64
    //

    function fetchFileById(id) {
        var db = LocalStorage.openDatabaseSync("QtQmlDB", "1.0", "Notes QML SQL");

        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Notes(id TEXT, data TEXT)');
                var rs = tx.executeSql('SELECT * FROM Notes');
                for(var i = 0; i < rs.rows.length; i++) {
                    if (rs.rows.item(i).id == id) {
                        return rs.rows.item(i).data
                    }
                }
            }
        )
    }

    function fetchAllFiles() {
        var db = LocalStorage.openDatabaseSync("QtQmlDB", "1.0", "Notes QML SQL");
        var recentFiles =  [];

        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Notes(id TEXT, data TEXT)');
                var rs = tx.executeSql('SELECT * FROM Notes');
                var r = ""
                for(var i = 0; i < rs.rows.length; i++) {
                    recentFiles.push(rs.rows.item(i).data)
                }
            }
        )
        return recentFiles
    }

    function addFile(string) {
        var db = LocalStorage.openDatabaseSync("QtQmlDB", "1.0", "Notes QML SQL");
        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Notes(id TEXT, data TEXT)');
                var rs = tx.executeSql('SELECT * FROM Notes');
                tx.executeSql('INSERT INTO Notes VALUES(?, ?)', [(rs.rows.length + 1).toString(), string ]);
            }
        )
    }
}

