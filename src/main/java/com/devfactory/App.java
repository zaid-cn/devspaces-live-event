package com.devfactory;

import java.io.FileWriter;
import java.util.*;

public class App {

    public static void main(String[] args) throws Exception {
        List<Exposure> exposures = Exposure.readCsv("contact-tracing/exposure.csv");
        List<Location> locations = Location.readCsv("contact-tracing/locations.csv");
        Collections.sort(exposures);
        Collections.sort(locations);

        System.out.println(exposures.toString());
        System.out.println(locations.toString());

        int maxTime = 0;
        for(Location l:locations) {
            maxTime = Math.max(maxTime, l.time);
        }

        HashMap<String, Person> state = new HashMap<>();
        int li = 0;
        int ei = 0;
        for(int t=1;t<=maxTime;t++) {
            while (ei<exposures.size() && exposures.get(ei).time == t) {
                Exposure exposure = exposures.get(ei);
                Person person = new Person(t, exposure.person);
                if (state.containsKey(exposure.person)) {
                    person = state.get(exposure.person);
                }
                if (person.infectedAt <= 0)
                    person.infectedAt = t;
                state.put(person.name, person);
                ei++;
            }
            Person[][] positions = new Person[10][10];
            while (li < locations.size() && locations.get(li).time == t) {
                Location location = locations.get(li);
                positions[location.x][location.y] = state.computeIfAbsent(location.person, (person) -> {return new Person(-1, person);});
                li++;
            }
            for (int i=0;i<10;i++) {
                for (int j=0;j<10;j++) {
                    Person current = positions[i][j];
                    if(current != null && current.infectedAt <= 0) {
                        List<String> currentInfections = new ArrayList<>();
                        for (int k=-1;k<2;k++) {
                            for (int l=-1;l<2;l++) {
                                try {
                                    Person other = positions[i+k][j+l];
                                    if(other != null && other.infectedAt>0) {
                                        currentInfections.add(other.name);
                                    }
                                } catch(IndexOutOfBoundsException e) {}
                            }
                        }
                        if (currentInfections.size() > 0) {
                            if (current.infectedAt == 0) {
                                current.infectedAt = t;
                            } else {
                                current.infectedAt = 0;
                                current.lastContacts = currentInfections;
                            }
                        } else {
                            current.infectedAt = -1;
                            current.clearList();
                        }
                    }
                }
            }
        }

        FileWriter fw = new FileWriter("contact-tracing/output.csv");
        int iter = 0;
        for (Person p:state.values()) {
            if (p.infectedAt>0) {
                fw.write(String.format("%d,%d,%s\n", iter++, p.infectedAt, p.name));
            }
        }
        fw.close();
    }

    static boolean abcd(List<String> a, List<String> b) {
        a.retainAll(b);
        if(a.size() > 0)
            return true;
        return false;
    }
}

class Person {
    int infectedAt; // -1 -> not infected 0 -> semi infected positive -> time of infection
    String name;
    List<String> lastContacts;
    Person(int i, String n) {
        infectedAt = i;
        name = n;
        lastContacts = new ArrayList<>();
    }

    public void clearList() {
        lastContacts = new ArrayList<>();
    }
}
