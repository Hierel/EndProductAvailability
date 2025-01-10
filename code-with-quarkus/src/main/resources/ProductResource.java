package fr.isen.projet.product_availability.interfaces.resources;

import fr.isen.projet.product_availability.interfaces.models.Product;
import fr.isen.projet.product_availability.interfaces.services.ProductService;

import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/products")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ProductResource {

    @Inject
    ProductService productService;

    @GET
    public List<Product> getAllProducts() {
        return productService.getAllProduct();  // Appel du service pour récupérer tous les produits
    }

    @GET
    @Path("/{id}")
    public Response getProductById(@PathParam("id") String id) {
        Product product = productService.getOneProduct(id);
        if (product == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(product).build();
    }

    @POST
    public Response addProduct(Product product) {
        String id = productService.addProduct(product);
        return Response.status(Response.Status.CREATED).entity("Product added with ID: " + id).build();
    }

    @PUT
    @Path("/{id}")
    public Response updateProduct(@PathParam("id") String id, Product product) {
        product.id_product = id;
        productService.updateProduct(product);
        return Response.ok("Product updated").build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteProduct(@PathParam("id") String id) {
        productService.removeProduct(id);
        return Response.ok("Product deleted").build();
    }
}
