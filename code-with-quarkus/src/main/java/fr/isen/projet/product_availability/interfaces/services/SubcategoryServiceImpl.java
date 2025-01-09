package fr.isen.projet.product_availability.interfaces.services;

import fr.isen.projet.product_availability.interfaces.models.Subcategory;
import fr.isen.projet.product_availability.interfaces.services.SubCategoryService;
import io.agroal.api.AgroalDataSource;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class SubcategoryServiceImpl implements SubCategoryService {

    @Inject
    AgroalDataSource dataSource;

    @Override
    public Subcategory getOneSubcategory(String id_subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM subcategories WHERE id_subcategory = ?")) {
            statement.setString(1, id_subcategory);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapResultSetToSubcategory(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération de la sous-catégorie", e);
        }
    }

    @Override
    public List<Subcategory> getAllSubcategory() {
        List<Subcategory> subcategories = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM subcategories");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                subcategories.add(mapResultSetToSubcategory(resultSet));
            }
            return subcategories;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération des sous-catégories", e);
        }
    }

    @Override
    public String addSubcategory(Subcategory subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO subcategories (name, active, id_category, date_created) VALUES (?, ?, ?, ?)",
                     PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, subcategory.name);
            statement.setBoolean(2, subcategory.active);
            statement.setInt(3, subcategory.id_category);
            statement.setDate(4, new java.sql.Date(subcategory.date_created.getTime()));
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getString(1);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de l'ajout de la sous-catégorie", e);
        }
    }

    @Override
    public void updateSubcategory(Subcategory subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE subcategories SET name = ?, active = ?, id_category = ? WHERE id_subcategory = ?")) {
            statement.setString(1, subcategory.name);
            statement.setBoolean(2, subcategory.active);
            statement.setInt(3, subcategory.id_category);
            statement.setString(4, subcategory.id_subcategory);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la mise à jour de la sous-catégorie", e);
        }
    }

    @Override
    public void removeSubcategory(String id_subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM subcategories WHERE id_subcategory = ?")) {
            statement.setString(1, id_subcategory);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression de la sous-catégorie", e);
        }
    }

    private Subcategory mapResultSetToSubcategory(ResultSet resultSet) throws SQLException {
        Subcategory subcategory = new Subcategory();
        subcategory.id_subcategory = resultSet.getString("id_subcategory");
        subcategory.name = resultSet.getString("name");
        subcategory.active = resultSet.getBoolean("active");
        subcategory.id_category = resultSet.getInt("id_category");
        subcategory.date_created = resultSet.getDate("date_created");
        return subcategory;
    }
}
