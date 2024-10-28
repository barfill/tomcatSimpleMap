package com.example.tomcatsimplemap;

public class Person {
    private int ID;
    private String name;
    private String surname;
    private Function function;

    public Person() {
        ID = -1;
        this.name = "Jane";
        this.surname = "Doe";
        this.function = null;
    }

    public Person(String name, String surname, Function function) {
        this(); //wywołanie konstruktora bezparametrowego, następnie zastąpienie jego wartości kolejno odczytanymi
        this.name = name;
        this.surname = surname;
        this.function = function;
    }

    public int getID() { return ID; }
    public void setID(int ID) { this.ID = ID; }

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

    public Function getFunction() { return function; }
    public void setFunction(Function function) { this.function = function; }

    public void copyFrom(Person p) {
        this.ID = p.ID;
        this.name = p.name;
        this.surname = p.surname;
        this.function = p.function;
    }
}
