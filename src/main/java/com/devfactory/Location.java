package com.devfactory;

import java.util.*;
import java.io.*;

public class Location implements Comparable<Location> {
  int time;
  String person;
  int x,y;
  public Location(int time, String person, int x, int y) {
    this.time = time;
    this.person = person;
    this.x = x;
    this.y = y;
  }

  public static List<Location> readCsv(String path) throws Exception {
    Scanner scanner = new Scanner(new File(path));
    List<Location> locations = new ArrayList<>();
    while(scanner.hasNextLine()) {
      String line = scanner.nextLine();
      String[] parts = line.split(",");
      locations.add(new Location(Integer.parseInt(parts[0]), parts[1], Integer.parseInt(parts[2]), Integer.parseInt(parts[3])));
    }
    scanner.close();
    return locations;
  }

  public int compareTo(Location b) {
    return Integer.compare(time, b.time);
  }

  public String toString() {
    return String.format("{%d, %s, %d, %d}", time, person, x, y);
  }
}
