package com.piachsecki.order.service;

import com.piachsecki.order.client.InventoryClient;
import com.piachsecki.order.dto.OrderRequest;
import com.piachsecki.order.event.OrderPlacedEvent;
import com.piachsecki.order.model.Order;
import com.piachsecki.order.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final InventoryClient inventoryClient;
    private final KafkaTemplate<String, OrderPlacedEvent> kafkaTemplate;

    public void placeOrder(OrderRequest orderRequest){
        var isProductInStock = inventoryClient.isInStock(orderRequest.skuCode(), orderRequest.quantity());

        if(isProductInStock){
            Order order = new Order();
            order.setOrderNumber(UUID.randomUUID().toString());
            order.setPrice(orderRequest.price());
            order.setSkuCode(orderRequest.skuCode());
            order.setQuantity(orderRequest.quantity());
            orderRepository.save(order);


//            OrderPlacedEvent orderPlacedEvent = new OrderPlacedEvent(order.getOrderNumber(), orderRequest.userDetails().email());
//            log.info("Start - sending OrderPlacedEvent {} to Kafka topic order-placed", orderPlacedEvent);
//            kafkaTemplate.send("order-placed", orderPlacedEvent);
//            log.info("End - sending OrderPlacedEvent {} to Kafka topic order-placed", orderPlacedEvent);


        } else {
            throw new RuntimeException("Product with skuCode: " + orderRequest.skuCode() + " is not in stock");
        }


    }
}
