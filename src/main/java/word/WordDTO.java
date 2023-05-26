package word;

public class WordDTO {
    private int vocabularyId;
    private String word;
    private String part_of_speech;
    private String meaning;

    public WordDTO(int vocabularyId, String word, String part_of_speech, String meaning) {
        this.vocabularyId = vocabularyId;
        this.word = word;
        this.part_of_speech = part_of_speech;
        this.meaning = meaning;
    }

    public int getVocabularyId() {
        return vocabularyId;
    }

    public void setVocabularyId(int vocabularyId) {
        this.vocabularyId = vocabularyId;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    public String getPart_of_speech() {
        return part_of_speech;
    }

    public void setPart_of_speech(String part_of_speech) {
        this.part_of_speech = part_of_speech;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }
}
