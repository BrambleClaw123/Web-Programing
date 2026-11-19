package com.example.ch07cart.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private List<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<LineItem> getItems() {
        return items;
    }

    // Thêm sản phẩm hoặc cộng dồn số lượng nếu đã tồn tại
    public void addItem(LineItem item) {
        String code = item.getProduct().getCode();
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getCode().equals(code)) {
                lineItem.setQuantity(lineItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    // Cập nhật số lượng trực tiếp
    public void updateItem(String productCode, int quantity) {
        if (quantity <= 0) {
            removeItem(productCode);
            return;
        }
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getCode().equals(productCode)) {
                lineItem.setQuantity(quantity);
                return;
            }
        }
    }

    // Xóa sản phẩm khỏi giỏ
    public void removeItem(String productCode) {
        items.removeIf(item -> item.getProduct().getCode().equals(productCode));
    }
}