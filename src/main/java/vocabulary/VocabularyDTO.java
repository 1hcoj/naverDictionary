package vocabulary;

public class VocabularyDTO {
    private int id;
    private int userId;
    private String name;

    public VocabularyDTO(int id, int userId,String name) {
        this.id = id;
        this.userId = userId;
        this.name = name;
    }

    public String getId() {
        return String.valueOf(id);
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
