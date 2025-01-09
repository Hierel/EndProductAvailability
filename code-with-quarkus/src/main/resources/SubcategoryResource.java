package fr.isen.projet.product_availability.interfaces.resources;

import fr.isen.projet.product_availability.interfaces.models.Subcategory;
import fr.isen.projet.product_availability.interfaces.services.SubCategoryService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/subcategories")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SubcategoryResource {

    private final SubCategoryService subCategoryService;

    public SubcategoryResource(SubCategoryService subCategoryService) {
        this.subCategoryService = subCategoryService;
    }

    @GET
    @Path("/{id}")
    public Response getOneSubcategory(@PathParam("id") String id_subcategory) {
        Subcategory subcategory = subCategoryService.getOneSubcategory(id_subcategory);
        if (subcategory == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
        return Response.ok(subcategory).build();
    }

    @GET
    public Response getAllSubcategories() {
        List<Subcategory> subcategories = subCategoryService.getAllSubcategory();
        return Response.ok(subcategories).build();
    }

    @POST
    public Response addSubcategory(Subcategory subcategory) {
        String id = subCategoryService.addSubcategory(subcategory);
        if (id == null) {
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
        return Response.status(Response.Status.CREATED).entity(id).build();
    }

    @PUT
    @Path("/{id}")
    public Response updateSubcategory(@PathParam("id") String id_subcategory, Subcategory subcategory) {
        subcategory.id_subcategory = id_subcategory;
        subCategoryService.updateSubcategory(subcategory);
        return Response.ok().build();
    }

    @DELETE
    @Path("/{id}")
    public Response deleteSubcategory(@PathParam("id") String id_subcategory) {
        subCategoryService.removeSubcategory(id_subcategory);
        return Response.noContent().build();
    }
}
