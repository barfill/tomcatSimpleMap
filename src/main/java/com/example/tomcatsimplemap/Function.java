package com.example.tomcatsimplemap;

public enum Function {
    DEP_HEAD("Kieronik oddziału"),
    IT_SPEC("Informatyk"),
    WORKER("Pracownik fizyczny"),
    OFFICER("Kierownik");

    public final String displayName; //zmienan jest final po to aby była stała

    private Function(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return this.displayName;
    }

}
