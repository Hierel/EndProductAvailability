package fr.isen.projet.productavailability.interfaces;

import fr.isen.projet.productavailability.interfaces.models.Category;
import fr.isen.projet.productavailability.interfaces.services.CategoryService;
import fr.isen.projet.productavailability.interfaces.services.CategoryServiceImpl;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/categories")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CategoryResource {

    CategoryService categoryService;

    public CategoryResource ()
    {
        this.categoryService = new CategoryServiceImpl();
    }

    @GET
    public Response getAllCategories() {
        List<Category> categories = categoryService.getAllCategory();
        return Response.ok(categories).build();
    }

    @GET
    @Path("/{id}")
    public Response getCategoryById(@PathParam("id") String idCategory) {
        Category category = categoryService.getOneCategory(idCategory);
        if (category != null) {
            return Response.ok(category).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Category not found for ID: " + idCategory)
                    .build();
        }
    }

    @POST
    public Response addCategory(Category category) {
        String id = categoryService.addCategory(category);
        if (id != null) {
            return Response.status(Response.Status.CREATED)
                    .entity("Category created with ID: " + id)
                    .build();
        } else {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("Unable to create category")
                    .build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response updateCategory(@PathParam("id") String idCategory, Category category) {
        category.id_category = idCategory;
        try {
            categoryService.updateCategory(category);
            return Response.ok("Category updated successfully").build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Error updating category: " + e.getMessage())
                    .build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deleteCategory(@PathParam("id") String idCategory) {
        try {
            categoryService.removeCategory(idCategory);
            return Response.ok("Category deleted successfully").build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Error deleting category: " + e.getMessage())
                    .build();
        }
    }
}
