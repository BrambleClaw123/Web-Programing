package murach.data;

import murach.business.Product;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ProductIO {

    // Each line of products.txt: code|description|price

    public static ArrayList<Product> getProducts(String filepath) throws IOException {
        ArrayList<Product> products = new ArrayList<>();
        try (BufferedReader in = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = in.readLine()) != null) {
                if (line.isBlank()) {
                    continue;
                }
                products.add(parse(line));
            }
        }
        return products;
    }

    public static Product getProduct(String productCode, String filepath) throws IOException {
        if (productCode == null) {
            return null;
        }
        try (BufferedReader in = new BufferedReader(new FileReader(filepath))) {
            String line;
            while ((line = in.readLine()) != null) {
                if (line.isBlank()) {
                    continue;
                }
                Product p = parse(line);
                if (p.getCode().equals(productCode)) {
                    return p;
                }
            }
        }
        return null;
    }

    private static Product parse(String line) {
        String[] t = line.split("\\|");
        Product p = new Product();
        p.setCode(t[0]);
        p.setDescription(t[1]);
        p.setPrice(Double.parseDouble(t[2]));
        return p;
    }
}
