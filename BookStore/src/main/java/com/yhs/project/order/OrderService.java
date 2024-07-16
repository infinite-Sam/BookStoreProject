package com.yhs.project.order;

import java.util.List;

import com.yhs.project.dto.OrderVO;
import com.yhs.project.dto.ReplyVO;

public interface OrderService {

	void insertCart(OrderVO vo);

	List<OrderVO> listCart(String id);

	int updateQuantity(OrderVO ov);
	
	void deleteCart(int oseq);

	public void updateCart(int oseq);
	
	public List<OrderVO> listCartView(int oseq);
	
	public void insertOrder(OrderVO vo);
	
	public List<OrderVO> getOrderResult(String id);
	public void updateOrderInfo(OrderVO ov);
	
	public List<OrderVO> listOrder(String id);
	
	public List<OrderVO> listOrderView(String id);
	
	public OrderVO getOrder(int oseq);
	public void updateGetOrder(OrderVO ov);
	
	public void deleteOrder(String id, String result);

	public void updateOrder(String id, String result);
	
	public void updateOrderCheck(int oseq);
	
	public void updateOrderCancel(int oseq);
	
	public List<OrderVO> adminOrderList();
	
	public void updateOrderOk(int oseq);
}