package main.java.db;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

public class Mart {
    private static Jdbi martJDBI = Connections.getMartJDBI();

    public static void calculateDailyIncome(String targetDate, long targetId, long targetIdProduct) {
        String sql = "SELECT COALESCE(SUM(discountPercent), 0) AS totalDiscount " +
                     "FROM data_warehouse.data_tivi " +
                     "WHERE source_id = :targetId AND product_id = :targetIdProduct AND DATE(expired) = :targetDate";

        martJDBI.useHandle(handle -> {
            Query query = handle.createQuery(sql);
            query.bind("targetId", targetId);
            query.bind("targetIdProduct", targetIdProduct);
            query.bind("targetDate", targetDate);

            Double totalDiscount = query.mapTo(Double.class).one();
            System.out.println("Total discount for " + targetDate + " is " + totalDiscount);
        });
    }

    public static void main(String[] args) {
        // Example call to the method
        calculateDailyIncome("9999-12-30", 1, 272080);
    }
}