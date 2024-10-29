package com.example.tomcatsimplemap;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class Company {
    private List<Department> departments = new ArrayList<>();

    private List<Person> persons = new ArrayList<>();
    private static int lastPersonId = 1;

    public Company() {
        Person p = new Person("Jan", "Potocki", Function.WORKER);
        addPerson(p);
        addPerson(new Person("Janina", "Rzepecka", Function.DEP_HEAD));
        p = new Person("Janusz", "Kopytko", Function.DEP_HEAD);
        addPerson(p);
        addPerson(new Person("Karolina", "Gazda", Function.OFFICER));
        addPerson(new Person("Krzysztof", "Chrzanowski", Function.WORKER));
        addPerson(new Person("Jeremiasz", "Socha", Function.IT_SPEC));

        Department department = new Department("Filia w Gdańsku",p,assignEveryNPerson(2)); //pobieram co drugą osobę czyli (0,2,4)
        departments.add(department);

        List<Integer> indicies = List.of(1,3,5);
        department = new Department("Oddział w Łodzi",persons.get(1),assignSpecificPerson(indicies));
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

    public List<Department> getAllDepartments() {
        //System.out.println("Liczba departamentów: " + departments.size());
        return departments; //2.0
    }
    public Department getDepartmentById(int id) {
        for (Department d : departments) {
            if(d.getID() == id) {
                return d;
            }
        }
        return null;
    }
    public List<Person> assignEveryNPerson(int n) {
        List<Person> members = IntStream.range(0,persons.size())
                .filter(i -> i % n == 0 )
                .mapToObj(persons::get)
                .collect(Collectors.toList());
        return members;
    }

    public List<Person> assignSpecificPerson(List<Integer> indices) {
        return indices.stream()
                .filter(index -> index >= 0 && index < persons.size()) //to działa jak taki if, sprawdza czy index podany jest >= zero i czy jest mniejszy od liczby elementów w tablicy osób
                .map(persons::get) // to pobiera z tablicy persons osobę o określonym indeksie który przekazujemy tutaj mamy na myśli: index-> persons.get(index)
                .collect(Collectors.toList()); // tutaj chyba po prostu dodajemy do listy indices pobrany obiekt
    }


}
