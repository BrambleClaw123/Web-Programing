package com.example.baitapchuong4.model;

import java.io.Serializable;

public class Survey implements Serializable {
    private String heardFrom;
    private Boolean wantsUpdates;
    private Boolean wantsEmail;
    private String contactVia;
    private User user;

    public Survey() {
        heardFrom = "";
        wantsUpdates = false;
        wantsEmail = false;
        contactVia =  "";
    }

    public Survey(String heardFrom, boolean wantsUpdates, boolean wantsEmail, String contactVia, User user) {

        this.heardFrom = heardFrom;
        this.wantsUpdates = wantsUpdates;
        this.wantsEmail = wantsEmail;
        this.contactVia = contactVia;
        this.user = user;
    }

    public String getHeardFrom() {
        return heardFrom;
    }

    public void setHeardFrom(String heardFrom) {
        this.heardFrom = heardFrom;
    }

    public boolean getWantsUpdates() {
        return wantsUpdates;
    }

    public void setWantsUpdates(boolean wantsUpdates) {
        this.wantsUpdates = wantsUpdates;
    }

    public boolean getWantsEmail() {
        return wantsEmail;
    }

    public void setWantsEmail(boolean wantsEmail) {
        this.wantsEmail = wantsEmail;
    }

    public String getContactVia() {
        return this.contactVia;
    }

    public void setContactVia(String contactVia) {
        this.contactVia = contactVia;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setWantsEmail(Boolean wantsEmail) {
        this.wantsEmail = wantsEmail;
    }

    public void setWantsUpdates(Boolean wantsUpdates) {
        this.wantsUpdates = wantsUpdates;
    }
}
