package word;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class WordDAO {

    Connection connection = DatabaseUtil.getConnection();
    /**
     *  함수명 : searchKToE
     *  매개변수 : String word
     *  리턴형 : String[]
     *  함수설명 :
     *      - 한글 뜻을 받아서 영어 단어 결과를 반환하는 함수
     * */
    public WordDTO[] searchKToE(String word){
        // Todo : 검색 조건을 like 를 사용하는 방법도 고려 가능
        String SQL = "SELECT * FROM Word WHERE meaning = ?";
        WordDTO[] wordDTOS = new WordDTO[1];

        try{
            PreparedStatement statement = connection.prepareStatement(SQL,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.setString(1,word);
            ResultSet resultSet = statement.executeQuery();

            int count = 0;

            if (resultSet != null && resultSet.next()){
                // 행의 길이 구하기
                resultSet.last();
                count = resultSet.getRow();
                resultSet.beforeFirst();

                wordDTOS = new WordDTO[count];

                int i = 0;
                while(resultSet.next()){

                    int vocabularyId = resultSet.getInt("vocabularyId");
                    String wordEn = resultSet.getString("word");
                    String part_of_speech = resultSet.getString("part_of_speech");
                    String meaning = resultSet.getString("meaning");

                    WordDTO wordDTO = new WordDTO(vocabularyId,wordEn,part_of_speech,meaning);
                    wordDTOS[i++] = wordDTO;
                }
            } else {
                return null;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return wordDTOS;
    }


    public WordDTO[] searchEToK(String word){
        // Todo : 검색 조건을 like 를 사용하는 방법도 고려 가능
        String SQL = "SELECT * FROM Word WHERE word = ?";
        WordDTO[] wordDTOS = new WordDTO[1];

        try{
            PreparedStatement statement = connection.prepareStatement(SQL,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.setString(1,word);

            ResultSet resultSet = statement.executeQuery();

            int count = 0;

            if (resultSet.next()){
                // 행의 개수 구하기
                resultSet.last();
                count = resultSet.getRow();
                resultSet.beforeFirst();

                wordDTOS = new WordDTO[count];

                int i = 0;

                while(resultSet.next()){
                    int vocabularyId = resultSet.getInt("vocabularyId");
                    String wordEn = resultSet.getString("word");
                    String part_of_speech = resultSet.getString("part_of_speech");
                    String meaning = resultSet.getString("meaning");

                    WordDTO wordDTO = new WordDTO(vocabularyId,wordEn,part_of_speech,meaning);
                    wordDTOS[i++] = wordDTO;
                }
            }else {
                return null;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return wordDTOS;
    }

    public int countWord(int vocaId){
        String SQL = "SELECT COUNT(*) FROM WORD WHERE vocabularyId = ?";
        int count = 0;
        try{
            PreparedStatement statement = connection.prepareStatement(SQL);

            statement.setInt(1,vocaId);

            ResultSet resultSet = statement.executeQuery();

            resultSet.next();
            count = resultSet.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

    public WordDTO[] getWord(int vocaId){
        String SQL = "SELECT * FROM WORD WHERE vocabularyId  = ?";
        int count = countWord(vocaId);

        try{
            PreparedStatement statement = connection.prepareStatement(SQL,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.setInt(1,vocaId);

            ResultSet resultSet = statement.executeQuery();
            int i =0;

            if (resultSet.next()){
                WordDTO[] wordDTOS = new WordDTO[count];
                resultSet.beforeFirst();
                while (resultSet.next()) {

                    String word = resultSet.getString("word");
                    String part_of_speech = resultSet.getString("part_of_speech");
                    String meaning = resultSet.getString("meaning");

                    WordDTO wordDTO = new WordDTO(vocaId, word, part_of_speech, meaning);
                    wordDTOS[i++] = wordDTO;
                }
                return wordDTOS;
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public WordDTO[] getWord(int vocaId,String word){
        String SQL = "SELECT * FROM WORD WHERE id = ? AND word = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(SQL,
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            statement.setInt(1, vocaId);
            statement.setString(2,word);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                resultSet.last();
                int count = resultSet.getRow();
                resultSet.beforeFirst();
                WordDTO[] wordDTOS = new WordDTO[count];
                int i =0;
                while (resultSet.next()){
                    String meaning = resultSet.getString("meaning");
                    String pos = resultSet.getString("part_of_speech");
                    WordDTO w = new WordDTO(vocaId,word,pos,meaning);
                    wordDTOS[i++] = w;
                }
                return wordDTOS;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
