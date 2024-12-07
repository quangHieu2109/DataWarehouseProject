package main.java.run;

import db.Connections;
import org.jdbi.v3.core.Jdbi;

public class LoadDWToMart {
    private static Jdbi martJDBI = Connections.getMartJDBI();

    public static void loadDWToMart() {
        String sql = "CALL loadDWToMart()";
        martJDBI.withHandle(handle -> {
            handle.createCall(sql).invoke();
            System.out.println("Data loaded from DW to Mart successfully.");
            return null;
        });
    }

    public static void main(String[] args) {
        loadDWToMart();
    }
}