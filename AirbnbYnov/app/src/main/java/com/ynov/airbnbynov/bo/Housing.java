package com.ynov.airbnbynov.bo;

public class Housing {
    City place;
    String title, owner;
    Number price;
    Float lat, lng;

    public Housing(City place, String title, String owner, Number price, Float lat, Float lng) {
        this.place = place;
        this.title = title;
        this.owner = owner;
        this.price = price;
        this.lat = lat;
        this.lng = lng;
    }

    public City getPlace() {
        return place;
    }

    public void setPlace(City place) {
        this.place = place;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public Number getPrice() {
        return price;
    }

    public void setPrice(Number price) {
        this.price = price;
    }

    public Float getLat() {
        return lat;
    }

    public void setLat(Float lat) {
        this.lat = lat;
    }

    public Float getLng() {
        return lng;
    }

    public void setLng(Float lng) {
        this.lng = lng;
    }
}
