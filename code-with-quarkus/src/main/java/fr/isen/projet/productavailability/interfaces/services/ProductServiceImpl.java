package fr.isen.projet.productavailability.interfaces.services;

import fr.isen.projet.productavailability.interfaces.models.Product;
import io.agroal.api.AgroalDataSource;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class ProductServiceImpl implements ProductService {

    @Inject
    AgroalDataSource dataSource;

    @Override
    public Product getOneProduct(String id_product) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE id_product = ?")) {
            statement.setString(1, id_product);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return mapResultSetToProduct(resultSet);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du produit", e);
        }
    }

    @Override
    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                products.add(mapResultSetToProduct(resultSet));
            }
            return products;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération de tous les produits", e);
        }
    }

    @Override
    public void updateProduct(Product product) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE product SET name = ?, unit_price = ?, status = ?, id_subcategory = ?, stock = ?, id_provider = ?, date_updated = ?, bDelete = ? WHERE id_product = ?")) {
            statement.setString(1, product.name);
            statement.setFloat(2, product.unit_price);
            statement.setString(3, product.status);
            statement.setInt(4, product.id_subcategory);
            statement.setInt(5, product.stock);
            statement.setString(6, product.id_provider);
            statement.setDate(7, new java.sql.Date(product.date_updated.getTime()));
            statement.setBoolean(8, product.bDelete);
            statement.setString(9, product.id_product);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la mise à jour du produit", e);
        }
    }

    @Override
    public void removeProduct(String id_product) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM product WHERE id_product = ?")) {
            statement.setString(1, id_product);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression du produit", e);
        }
    }

    @Override
    public String addProduct(Product product) {
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO product (name, unit_price, status, id_subcategory, stock, id_provider, date_created, date_updated, bDelete) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
                     PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, product.name);
            statement.setFloat(2, product.unit_price);
            statement.setString(3, product.status);
            statement.setInt(4, product.id_subcategory);
            statement.setInt(5, product.stock);
            statement.setString(6, product.id_provider);
            statement.setDate(7, new java.sql.Date(product.date_created.getTime()));
            statement.setDate(8, new java.sql.Date(product.date_updated.getTime()));
            statement.setBoolean(9, product.bDelete);
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getString(1);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de l'ajout du produit", e);
        }
    }

    private Product mapResultSetToProduct(ResultSet resultSet) throws SQLException {
        Product product = new Product();
        product.id_product = resultSet.getString("id_product");
        product.name = resultSet.getString("name");
        product.unit_price = resultSet.getFloat("unit_price");
        product.status = resultSet.getString("status");
        product.id_subcategory = resultSet.getInt("id_subcategory");
        product.stock = resultSet.getInt("stock");
        product.id_provider = resultSet.getString("id_provider");
        product.date_created = resultSet.getDate("date_created");
        product.date_updated = resultSet.getDate("date_updated");
        product.bDelete = resultSet.getBoolean("bDelete");
        return product;
    }
}
