package fr.isen.projet.productavailability.interfaces;

import fr.isen.projet.productavailability.interfaces.models.Subcategory;
import fr.isen.projet.productavailability.interfaces.services.SubcategoryService;
import fr.isen.projet.productavailability.interfaces.services.SubcategoryServiceImpl;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/subcategories")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SubcategoryResource {

    SubcategoryService subcategoryService;

    public SubcategoryResource ()
    {
        this.subcategoryService = new SubcategoryServiceImpl();
    }

    @GET
    public Response getAllSubcategories() {
        List<Subcategory> subcategories = subcategoryService.getAllSubcategory();
        return Response.ok(subcategories).build();
    }

    @GET
    @Path("/{id}")
    public Response getSubcategoryById(@PathParam("id") String idSubcategory) {
        Subcategory subcategory = subcategoryService.getOneSubcategory(idSubcategory);
        if (subcategory != null) {
            return Response.ok(subcategory).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Subcategory not found for ID: " + idSubcategory)
                    .build();
        }
    }

    @POST
    public Response addSubcategory(Subcategory subcategory) {
        String id = subcategoryService.addSubcategory(subcategory);
        if (id != null) {
            return Response.status(Response.Status.CREATED)
                    .entity("Subcategory created with ID: " + id)
                    .build();
        } else {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("Unable to create subcategory")
                    .build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response updateSubcategory(@PathParam("id") String idSubcategory, Subcategory subcategory) {
        subcategory.id_subcategory = idSubcategory;
        try {
            subcategoryService.updateSubcategory(subcategory);
            return Response.ok("Subcategory updated successfully").build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Error updating subcategory: " + e.getMessage())
                    .build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deleteSubcategory(@PathParam("id") String idSubcategory) {
        try {
            subcategoryService.removeSubcategory(idSubcategory);
            return Response.ok("Subcategory deleted successfully").build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Error deleting subcategory: " + e.getMessage())
                    .build();
        }
    }
}
