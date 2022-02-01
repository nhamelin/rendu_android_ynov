package com.ynov.airbnbynov.bo;

public class City {
    int id;
    String name, created_at, pic;

    public City(int id, String name, String created_at, String pic) {
        this.id = id;
        this.name = name;
        this.created_at = created_at;
        this.pic = pic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
