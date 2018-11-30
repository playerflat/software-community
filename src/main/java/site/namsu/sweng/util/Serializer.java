package site.namsu.sweng.util;

import site.namsu.sweng.core.entity.Group;

import java.io.*;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Author : Hyunwoong
 * @When : 2018-11-29 오후 2:15
 * @Homepage : https://github.com/gusdnd852
 */
public class Serializer {
    private Serializer() {

    }

    public static void serialize(PreparedStatement db, Object input) {
        ByteArrayOutputStream bos = new java.io.ByteArrayOutputStream();
        ObjectOutputStream oos = null;
        try {
            oos = new ObjectOutputStream(bos);
            oos.writeObject(input);
            byte[] bytes = bos.toByteArray();
            ByteArrayInputStream regArrayStream =
                    new ByteArrayInputStream(bytes);
            db.setBinaryStream(1, regArrayStream, bytes.length);
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                oos.close();
                bos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static Object deserialize(ResultSet set, String column) {
        Blob serializedObject;
        try {
            serializedObject = set.getBlob(column);
            ObjectInputStream regObjectStream = new ObjectInputStream(serializedObject.getBinaryStream());
            return regObjectStream.readObject();
        } catch (SQLException | IOException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
