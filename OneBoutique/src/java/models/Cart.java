/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entities.Product;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import sessionbeans.ProductFacade;

/**
 *
 * @author PHT
 */
public class Cart {

    ProductFacade pf = lookupProductFacadeBean();

    Map<Integer, Item> map = new HashMap();

    public Cart() {
    }

    public void add(int id, int quantity) {
        Product product = pf.find(id);
        Item item = new Item(product.getId(),
                product.getDescription(),
                product.getPrice(),
                product.getDiscount(),
                quantity);
        map.put(id, item);
    }

    public int getNumOfProducts() {
        return map.size();
    }

    public Collection<Item> getItems() {
        return map.values();
    }

    public void update(int id, int quantity) {
        Item item = map.get(id);
        item.setQuantity(quantity);
    }

    public void delete(int id) {
        map.remove(id);
    }

    public void empty() {
        map.clear();
    }

    private ProductFacade lookupProductFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProductFacade) c.lookup("java:global/OneBoutique/ProductFacade!sessionbeans.ProductFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
