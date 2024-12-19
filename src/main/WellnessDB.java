package main;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import utils.Utility;

public class WellnessDB {
    private static final String DB_url = "jdbc:mysql://localhost:3306/";
    private static final String DB_name = "WellnessDB";
    private static String DB_username = "root";
    private static String DB_password = "a4s6d8z9123";
    private static final String INIT_SQL_FILE = "C:\\Users\\Eon\\Downloads\\CollegeFiles\\StudyProgramming\\Java\\WellnessTracker\\WellnessTracker\\db\\init.sql"; // Replace with the actual path

    private static Connection connection = null;

    // Singleton pattern for database connection
    public static Connection getConnection() {
        if (connection == null) {
            Utility.clearScreen(1);
            connection = initializeDatabase();
        }
        return connection;
    }

    private static Connection initializeDatabase() {
        try {
            // Try connecting to the database
            Connection conn = DriverManager.getConnection(DB_url + DB_name, DB_username, DB_password);
            System.out.println("Connected to the database successfully.");
            return conn;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1049) { // Database not found error code
                System.out.println("Database not found. Proceeding to database creation...");
                createDatabaseAndInitialize();
                return initializeDatabase(); // Retry connection after creation
            } else if (e.getErrorCode() == 1045) { // Authentication error
                System.out.println("Incorrect MySQL username or password.");
            } else {
                System.out.println("Error connecting to the database: " + e.getMessage());
            }
        }
        return null;
    }

    private static void createDatabaseAndInitialize() {
        try (Connection conn = DriverManager.getConnection(DB_url, DB_username, DB_password);
            Statement stmt = conn.createStatement()) {
    
            // Create the database if it doesn't exist
            stmt.execute("CREATE DATABASE IF NOT EXISTS " + DB_name);
            System.out.println("Database '" + DB_name + "' created successfully.");
            Utility.clearScreen(1);
    
            // Initialize the database schema and tables from the init.sql file
            try (Connection dbConn = DriverManager.getConnection(DB_url + DB_name, DB_username, DB_password)) {
                System.out.println("Initializing database with schema and tables...");
                executeSQLFile(dbConn, INIT_SQL_FILE);
                System.out.println("Database initialized successfully.");
            }
    
        } catch (SQLException e) {
            System.out.println("Error creating the database or initializing it: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Executes SQL file without printing each line
    private static void executeSQLFile(Connection conn, String filePath) {
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            StringBuilder sqlBuilder = new StringBuilder();
            String line;

            // Read SQL file line by line
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("--") || line.startsWith("/*")) {
                    // Skip comments and empty lines
                    continue;
                }
                sqlBuilder.append(line);
                if (line.endsWith(";")) {
                    // Execute each SQL command ending with a semicolon
                    String sql = sqlBuilder.toString();
                    try (Statement stmt = conn.createStatement()) {
                        stmt.execute(sql);
                    } catch (SQLException ex) {
                        System.out.println("Failed to execute: " + sql);
                        ex.printStackTrace();
                    }
                    sqlBuilder.setLength(0); // Clear buffer
                }
            }
            System.out.println("SQL file executed successfully.");
            Utility.clearScreen(2); // Clears the screen after executing the SQL file
        } catch (IOException e) {
            System.out.println("Error reading the SQL file: " + e.getMessage());
        }
    }
}
