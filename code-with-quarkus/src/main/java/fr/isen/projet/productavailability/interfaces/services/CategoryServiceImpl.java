package fr.isen.projet.productavailability.interfaces.services;

import fr.isen.projet.productavailability.interfaces.models.Category;
import io.agroal.api.AgroalDataSource;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class CategoryServiceImpl implements CategoryService {

    @Inject
    AgroalDataSource dataSource;

    @Override
    public Category getOneCategory(String id_category) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM category WHERE id_category = ?")) {
            statement.setString(1, id_category);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapResultSetToCategory(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération de la catégorie", e);
        }
    }

    @Override
    public List<Category> getAllCategory() {
        List<Category> categories = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM category");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                categories.add(mapResultSetToCategory(resultSet));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération des catégories", e);
        }
    }

    @Override
    public String addCategory(Category category) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO category (name, description, date_created, bDelete) VALUES (?, ?, ?, ?)",
                     PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, category.name);
            statement.setString(2, category.description);
            statement.setDate(3, new java.sql.Date(category.date_created.getTime()));
            statement.setBoolean(4, category.bDelete);
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getString(1);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de l'ajout de la catégorie", e);
        }
    }

    @Override
    public void updateCategory(Category category) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE category SET name = ?, description = ?, bDelete = ? WHERE id_category = ?")) {
            statement.setString(1, category.name);
            statement.setString(2, category.description);
            statement.setBoolean(3, category.bDelete);
            statement.setString(4, category.id_category);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la mise à jour de la catégorie", e);
        }
    }

    @Override
    public void removeCategory(String id_category) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM category WHERE id_category = ?")) {
            statement.setString(1, id_category);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression de la catégorie", e);
        }
    }

    private Category mapResultSetToCategory(ResultSet resultSet) throws SQLException {
        Category category = new Category();
        category.id_category = resultSet.getString("id_category");
        category.name = resultSet.getString("name");
        category.description = resultSet.getString("description");
        category.date_created = resultSet.getDate("date_created");
        category.bDelete = resultSet.getBoolean("bDelete");
        return category;
    }
}
