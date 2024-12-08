package main.java.run;

import db.Connections;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoadDWToMart {
    private static final Logger logger = Logger.getLogger(LoadDWToMart.class.getName());
    private static Jdbi martJDBI = Connections.getMartJDBI();

    public static void loadDWToMart() {
        String sql = "CALL loadDWToMart()";
        String targetDate = null;
        long targetId = null;
        long targetIdProduct = null;
        martJDBI.withHandle(handle -> {
            handle.createCall(sql).invoke();
            logger.info("Data loaded from DW to Mart successfully.");

            String revenueSql = "SELECT COALESCE(SUM(discountPercent), 0) AS totalDiscount " +
                    "FROM data_warehouse.data_tivi " +
                    "WHERE source_id = :targetId AND product_id = :targetIdProduct AND DATE(expired) = :targetDate";
            Double totalRevenue = handle.createQuery(revenueSql)
                    .bind("saleDate", targetDate)
                    .mapTo(Double.class)
                    .one();
            logger.info("Total revenue for TVs on " + targetDate + ": " + totalRevenue);

            calculateDailyIncome(targetDate, targetId, targetIdProduct);

            return null;
        });
    }

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
            logger.info("Total discount for " + targetDate + " is " + totalDiscount);
        });
    }

    public static void main(String[] args) {
        loadDWToMart();
    }
}