package com.devfactory;

import java.util.*;
import java.io.*;

public class Exposure implements Comparable<Exposure> {
  int time;
  String person;
  public Exposure(int time, String person) {
    this.time = time;
    this.person = person;
  }

  public static List<Exposure> readCsv(String path) throws Exception {
    Scanner scanner = new Scanner(new File(path));
    List<Exposure> exposures = new ArrayList<>();
    while(scanner.hasNextLine()) {
      String line = scanner.nextLine();
      String[] parts = line.split(",");
      exposures.add(new Exposure(Integer.parseInt(parts[0]), parts[1]));
    }
    scanner.close();
    return exposures;
  }

  public int compareTo(Exposure b) {
    return Integer.compare(time, b.time);
  }

  public String toString() {
    return String.format("{%d, %s}", time, person);
  }
}
