package com.vam.service;

import java.util.List;

import com.vam.model.OrderPageItemDTO;

public interface OrderService {

	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
}
