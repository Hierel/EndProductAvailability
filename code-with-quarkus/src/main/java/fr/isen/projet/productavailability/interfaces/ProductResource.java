package fr.isen.projet.productavailability.interfaces;

import fr.isen.projet.productavailability.interfaces.models.Product;
import fr.isen.projet.productavailability.interfaces.services.CategoryService;
import fr.isen.projet.productavailability.interfaces.services.CategoryServiceImpl;
import fr.isen.projet.productavailability.interfaces.services.ProductService;
import fr.isen.projet.productavailability.interfaces.services.ProductServiceImpl;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/products")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ProductResource {

    ProductService productService;

    public ProductResource ()
    {
        this.productService = new ProductServiceImpl();
    }

    @GET
    @Path("/{id}")
    public Response getOneProduct(@PathParam("id") String idProduct) {
        Product product = productService.getOneProduct(idProduct);
        if (product != null) {
            return Response.ok(product).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).entity("Product not found").build();
        }
    }

    @GET
    public Response getAllProducts() {
        List<Product> products = productService.getAllProduct();
        return Response.ok(products).build();
    }

    @POST
    public Response addProduct(Product product) {
        String id = productService.addProduct(product);
        if (id != null) {
            return Response.status(Response.Status.CREATED).entity("Product created with ID: " + id).build();
        } else {
            return Response.status(Response.Status.BAD_REQUEST).entity("Unable to create product").build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response updateProduct(@PathParam("id") String idProduct, Product product) {
        product.id_product = idProduct;
        productService.updateProduct(product);
        return Response.ok("Product updated successfully").build();
    }

    @DELETE
    @Path("/{id}")
    public Response removeProduct(@PathParam("id") String idProduct) {
        productService.removeProduct(idProduct);
        return Response.ok("Product deleted successfully").build();
    }
}
