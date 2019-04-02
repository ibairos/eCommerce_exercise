package cart;

import entity.Product;
import java.text.DecimalFormat;
import java.util.*;

/**
 *
 * @author juanluis
 */
public class ShoppingCart {
    
    private ArrayList<ShoppingCartItem> items;
    
    public ShoppingCart() {
        items = new ArrayList<ShoppingCartItem>();
    }

    public synchronized void addItem(Product product) {
        boolean itemExists = false;
        for (ShoppingCartItem item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + 1);
                itemExists = true;
                break;
            }
        }
        if (!itemExists) {
            items.add(new ShoppingCartItem(product));            
        }
    }

    public synchronized void update(Product product, String quantity) {
        for (ShoppingCartItem item : items) {
            if (item.getProduct().getId().equals(product.getId())) {
                item.setQuantity(Integer.parseInt(quantity));
                break;
            }
        }
    }

    public synchronized List<ShoppingCartItem> getItems() {
        return items;
    }

    public synchronized int getNumberOfItems() {
        int num = 0;
        for (ShoppingCartItem item : items) {
            num += item.getQuantity();
        }
        return num;
    }

    public synchronized double getTotal() {
        double total = 0;
        for (ShoppingCartItem item : items) {
            total += item.getTotal();
        }
        DecimalFormat df = new DecimalFormat("#.00");
        return Double.parseDouble(df.format(total));
    }
    
    public synchronized void clear() {
        items.clear();
    }

}
