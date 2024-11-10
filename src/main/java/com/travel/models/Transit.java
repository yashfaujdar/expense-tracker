package com.travel.model;

public class Transit {
    private String transitId;
    private String transType;
    private String source;
    private String dest;
    private String startTime;
    private String endTime;
    private float cost;
    private int promPriority;

    // Getters and Setters
    public String getTransitId() {
        return transitId;
    }

    public void setTransitId(String transitId) {
        this.transitId = transitId;
    }

    public String getTransType() {
        return transType;
    }

    public void setTransType(String transType) {
        this.transType = transType;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public int getPromPriority() {
        return promPriority;
    }

    public void setPromPriority(int promPriority) {
        this.promPriority = promPriority;
    }
}
