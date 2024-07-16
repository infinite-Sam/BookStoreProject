package com.yhs.project.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yhs.project.dto.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 장바구니에 추가
	public void insertCart(OrderVO vo) {
		sst.insert("OrderDAO.insertCart", vo);
	}
	
	// 장바구니 목록
	public List<OrderVO> listCart(String id) {
		
		return sst.selectList("OrderDAO.listCart", id);
	}

	public List<OrderVO> listCartView(int oseq) {
		return sst.selectList("OrderDAO.listCartView", oseq);
	}
	
	public int updateQuantity(OrderVO ov) {
		return sst.update("OrderDAO.updateQuantity", ov);
	}
	
	// 장바구니 항목삭제
	public void deleteCart(int oseq) {
		sst.delete("OrderDAO.deleteCart", oseq);
	}
	
	public void updateCart(int oseq) {
		
		sst.update("OrderDAO.updateCart", oseq);
	}
	
	
	public void insertOrder(OrderVO vo) {
		sst.insert("OrderDAO.insertOrder", vo);
	}
	
	// 주문내역 상세보기(result)
	public List<OrderVO> getOrderResult(String id) {
		return sst.selectList("OrderDAO.getOrderResult", id);
	}
	public void updateOrderInfo(OrderVO ov) {
		sst.update("OrderDAO.updateOrderInfo", ov);
	}
	
	// 주문내역 상세보기(주문번호)
	public OrderVO getOrder(int oseq) {
		return sst.selectOne("OrderDAO.getOrder", oseq);
	}
	public void updateGetOrder(OrderVO ov) {
		sst.update("OrderDAO.updateGetOrder", ov);
	}
	
	// 마이페이지 주문목록 표시
	public List<OrderVO> listOrder(String id) {
		
		return sst.selectList("OrderDAO.listOrder", id);
	}
	
	public List<OrderVO> listOrderView(String id) {
		
		return sst.selectList("OrderDAO.listOrderView", id);
	}

	public void deleteOrder(String id, String result) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("result", result);
		sst.update("OrderDAO.deleteOrder", map);
	}
	
	public void updateOrder(String id, String result) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("result", result);
		sst.update("OrderDAO.updateOrder", map);
	}
	
	public void updateOrderCheck(int oseq) {
		
		sst.update("OrderDAO.updateOrderCheck", oseq);
	}
	
	public void updateOrderCancel(int oseq) {
		sst.update("OrderDAO.updateOrderCancel", oseq);
	}
	
	public List<OrderVO> adminOrderList(){
		return sst.selectList("OrderDAO.adminOrderList");
	}
	
	public void updateOrderOk(int oseq) {
		
		sst.update("OrderDAO.updateOrderOk", oseq);
	}
}










