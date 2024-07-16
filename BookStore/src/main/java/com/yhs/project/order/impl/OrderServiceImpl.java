package com.yhs.project.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhs.project.dao.OrderDAO;
import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;
import com.yhs.project.order.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO od;
	
	@Override
	public void insertOrder(OrderVO vo) {
		od.insertOrder(vo);
	}

	@Override
	public List<OrderVO> listOrder(String id) {
		return od.listOrder(id);
	}

	@Override
	public List<OrderVO> listOrderView(String id) {
		return od.listOrderView(id);
	}
	
	@Override
	public List<OrderVO> getOrderResult(String id) {
		return od.getOrderResult(id);
	}
	@Override
	public void updateOrderInfo(OrderVO ov) {
		od.updateOrderInfo(ov);
	}
	
	@Override
	public void deleteOrder(String id, String result) {
		od.deleteOrder(id, result);
	}
	
	@Override
	public void updateOrder(String id, String result) {
		od.updateOrder(id, result);
	}
	
	@Override
	public void updateOrderCheck(int oseq) {
		
		od.updateOrderCheck(oseq);
	}
	
	@Override
	public void updateOrderCancel(int oseq) {
		od.updateOrderCancel(oseq);
	}
	
	@Override
	public List<OrderVO> adminOrderList() {
		return od.adminOrderList();
	}

	@Override
	public void updateOrderOk(int oseq) {
		od.updateOrderOk(oseq);
	}

	@Override
	public OrderVO getOrder(int oseq) {
		return od.getOrder(oseq);
	}
	@Override
	public void updateGetOrder(OrderVO ov) {
		od.updateGetOrder(ov);
	}
	
	@Override
	public void insertCart(OrderVO vo) {
		od.insertCart(vo);
	}

	@Override
	public List<OrderVO> listCart(String id) {
		return od.listCart(id);
	}

	@Override
	public void deleteCart(int oseq) {
		od.deleteCart(oseq);
	}

	@Override
	public int updateQuantity(OrderVO ov) {
		return od.updateQuantity(ov);
	}
	
	@Override
	public void updateCart(int oseq) {
		od.updateCart(oseq);
	}

	@Override
	public List<OrderVO> listCartView(int oseq) {
		return od.listCartView(oseq);
	}
}







