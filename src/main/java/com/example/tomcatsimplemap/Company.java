package com.example.tomcatsimplemap;

import java.util.ArrayList;
import java.util.List;

public class Company {
    private List<Department> departments = new ArrayList<>();
    private List<Person> persons = new ArrayList<>();
    private static int lastPersonId = 1;

    public Company() {
        Person p = new Person("Jan", "Potocki", Function.WORKER);
        addPerson(p);
        addPerson(new Person("Janina", "Rzepecka", Function.DEP_HEAD));
        p = new Person("Janusz", "Kopytko", Function.IT_SPEC);
        addPerson(p);
        addPerson(new Person("Karolina", "Gazda", Function.OFFICER));

        Department department = new Department("Filia w Gdańsku",p,persons);
        departments.add(department);
    }

    public List<Person> getAllPersons() {
        return persons;
    }
    public Person getPersonById(int id) {
        for (Person p : persons) {
            if(p.getID() == id) {
                return p;
            }
        }
        return null;
    }
    public List<Person> getPersonByName(String name) {
        List<Person> tempList = new ArrayList<>();

        for(Person p : persons) {
            if(p.getName().toLowerCase().equals(name.toLowerCase())) {
                tempList.add(p);
            }
        }
        return tempList;
    }

    public void addPerson(Person p) {
        int id = lastPersonId++;
        p.setID(id);
        persons.add(p);
    }
}
