package fr.isen.projet.product_availability.interfaces.resources;

import fr.isen.projet.product_availability.interfaces.models.Category;
import fr.isen.projet.product_availability.interfaces.services.CategoryService;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@ApplicationScoped
@Path("/categories")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CategoryResource {

    @Inject
    CategoryService categoryService;

    @GET
    public List<Category> getAllCategories() {
        return categoryService.getAllCategory();
    }

    @GET
    @Path("/{id}")
    public Response getCategoryById(@PathParam("id") String id) {
        Category category = categoryService.getOneCategory(id);
        if (category == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(category).build();
    }

    @POST
    public Response addCategory(Category category) {
        String id = categoryService.addCategory(category);
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        return Response.status(Response.Status.CREATED).entity(id).build();
    }

    @PUT
    @Path("/{id}")
    public Response updateCategory(@PathParam("id") String id, Category category) {
        Category existingCategory = categoryService.getOneCategory(id);
        if (existingCategory == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        category.id_category = id; // Ensure the ID matches
        categoryService.updateCategory(category);
        return Response.noContent().build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteCategory(@PathParam("id") String id) {
        Category existingCategory = categoryService.getOneCategory(id);
        if (existingCategory == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        categoryService.removeCategory(id);
        return Response.noContent().build();
    }
}
