package vocabulary;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VocabularyDAO {

    Connection connection = DatabaseUtil.getConnection();

    public VocabularyDTO[] getVocabulary(int userId){
        String SQL = "SELECT * FROM VOCABULARY WHERE userId = ?";

        try {
            PreparedStatement statement = connection.prepareStatement(SQL,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.setInt(1,userId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet != null && resultSet.next()) {

                resultSet.last();
                int count = resultSet.getRow();
                resultSet.beforeFirst();

                VocabularyDTO[] vocabularyDTOS = new VocabularyDTO[count];

                int i = 0;
                while (resultSet.next()) {

                    String name = resultSet.getString("name");
                    int id = resultSet.getInt("id");

                    VocabularyDTO vocabularyDTO = new VocabularyDTO(id, userId, name);
                    vocabularyDTOS[i++] = vocabularyDTO;
                }

                return vocabularyDTOS;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public void saveWord(int vocaId,String word){
        String SQL = "INSERT INTO SAVE(vocabularyId,wordId) " +
                " SELECT VOCABULARY.id,WORD.id"+
                " FROM VOCABULARY,WORD"+
                " WHERE VOCABULARY.id = ? AND (WORD.word = ? OR WORD.meaning = ?)  ";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(SQL);
            statement.setInt(1, vocaId);
            statement.setString(2,word);
            statement.setString(3,word);

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public void addVocabulary(int userId,String vocabularyName){
        String SQL = "INSERT INTO Vocabulary(userId,name) VALUES(?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(SQL);
            statement.setInt(1,userId);
            statement.setString(2,vocabularyName);

            statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
