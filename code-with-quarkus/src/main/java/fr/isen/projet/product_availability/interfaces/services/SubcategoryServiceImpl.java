package fr.isen.projet.product_availability.interfaces.services;

import fr.isen.projet.product_availability.interfaces.models.Subcategory;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubcategoryServiceImpl implements SubCategoryService {

    private final DataSource dataSource;

    public SubcategoryServiceImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Subcategory getOneSubcategory(final String id_subcategory) {
        Subcategory subcategory = null;
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM subcategory WHERE id_subcategory = ?")) {
            statement.setString(1, id_subcategory);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                subcategory = mapResultSetToSubcategory(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subcategory;
    }

    @Override
    public List<Subcategory> getAllSubcategory() {
        List<Subcategory> subcategories = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM subcategory");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                subcategories.add(mapResultSetToSubcategory(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subcategories;
    }

    @Override
    public String addSubcategory(final Subcategory subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO subcategory (name, active, id_category, date_created) VALUES (?, ?, ?, ?)",
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateSubcategory(final Subcategory subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE subcategory SET name = ?, active = ?, id_category = ? WHERE id_subcategory = ?")) {
            statement.setString(1, subcategory.name);
            statement.setBoolean(2, subcategory.active);
            statement.setInt(3, subcategory.id_category);
            statement.setString(4, subcategory.id_subcategory);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeSubcategory(final String id_subcategory) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM subcategory WHERE id_subcategory = ?")) {
            statement.setString(1, id_subcategory);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Mapper le ResultSet en un objet Subcategory
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
