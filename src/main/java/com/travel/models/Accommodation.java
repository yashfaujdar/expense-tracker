package com.travel.model;

public class Accommodation {
    private String accomId;
    private String locId;
    private String accomName;
    private String accomType;
    private String address;
    private float cost;
    private String amenities;
    private int promPriority;

    // Getters and Setters
    public String getAccomId() {
        return accomId;
    }

    public void setAccomId(String accomId) {
        this.accomId = accomId;
    }

    public String getLocId() {
        return locId;
    }

    public void setLocId(String locId) {
        this.locId = locId;
    }

    public String getAccomName() {
        return accomName;
    }

    public void setAccomName(String accomName) {
        this.accomName = accomName;
    }

    public String getAccomType() {
        return accomType;
    }

    public void setAccomType(String accomType) {
        this.accomType = accomType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public int getPromPriority() {
        return promPriority;
    }

    public void setPromPriority(int promPriority) {
        this.promPriority = promPriority;
    }
}
