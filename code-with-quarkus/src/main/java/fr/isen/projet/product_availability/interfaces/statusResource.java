package fr.isen.projet.product_availability.interfaces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.agroal.api.AgroalDataSource;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;

@Path("/status")
public class statusResource {

    @Inject
    AgroalDataSource dataSource;

    @GET
    public String getStatus() throws JsonProcessingException {
        String state = "OK"; // L'état du service
        String version = "1.0"; // Version de l'API
        int count = 0;

        // Compter les lignes dans toutes les tables
        try (Connection connection = dataSource.getConnection()) {
            count = getTotalRowCount(connection);
        } catch (SQLException e) {
            state = "KO"; // Modifier l'état en cas d'erreur
            e.printStackTrace();
        }

        // Préparer la réponse
        Map<String, Object> statusResponse = new HashMap<>();
        statusResponse.put("state", state);
        statusResponse.put("count", count);
        statusResponse.put("version", version);

        // Retourner la réponse en JSON
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(statusResponse);
    }

    private int getTotalRowCount(Connection connection) throws SQLException {
        int totalCount = 0;

        // Requêtes pour compter les lignes de chaque table
        String[] queries = {
                "SELECT COUNT(*) AS total FROM product",
                "SELECT COUNT(*) AS total FROM category",
                "SELECT COUNT(*) AS total FROM subcategory"
        };

        for (String query : queries) {
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    totalCount += resultSet.getInt("total");
                }
            }
        }

        return totalCount;
    }
}
