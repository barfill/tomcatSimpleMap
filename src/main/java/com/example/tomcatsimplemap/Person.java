package com.example.tomcatsimplemap;

public class Person {
    private String name;
    private String surname;

    public Person() {
        this.name = "Jane";
        this.surname = "Doe";
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


}
