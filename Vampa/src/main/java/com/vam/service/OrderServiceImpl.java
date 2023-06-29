package com.vam.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vam.mapper.AttachMapper;
import com.vam.mapper.BookMapper;
import com.vam.mapper.CartMapper;
import com.vam.mapper.MemberMapper;
import com.vam.mapper.OrderMapper;
import com.vam.model.AttachImageVO;
import com.vam.model.BookVO;
import com.vam.model.CartDTO;
import com.vam.model.MemberVO;
import com.vam.model.OrderCancelDTO;
import com.vam.model.OrderDTO;
import com.vam.model.OrderItemDTO;
import com.vam.model.OrderPageItemDTO;

@Service
public class OrderServiceImpl implements OrderService{
		
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private BookMapper bookMapper;
	
	@Override
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders) {
		
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getBookId());
			goodsInfo.setBookCount(ord.getBookCount());
			goodsInfo.initSaleTotal();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(goodsInfo.getBookId());
			goodsInfo.setImageList(imageList);
			
			result.add(goodsInfo);
		}
		
		return result;
	}
	
	
	@Override
	@Transactional
	public void order(OrderDTO ord) {
		/* 사용할 데이터 가져오기 */
		/* 회원정보 */
		MemberVO member = memberMapper.getMemberInfo(ord.getMemberId());
		
		/* 주문정보 */
		List<OrderItemDTO> ords = new ArrayList<>();
		
		for(OrderItemDTO oit : ord.getOrders()) {
			OrderItemDTO orderItem = orderMapper.getOrderInfo(oit.getBookId());
			orderItem.setBookCount(oit.getBookCount());
			orderItem.initSaleTotal();
			ords.add(orderItem);
		}
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		
		/* db 주문, 주문상품(, 배송정보) 넣기 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMemberId() + format.format(date);
		ord.setOrderId(orderId);
		
		orderMapper.enrollOrder(ord);	 // 주문 정보 등록
		
		//주문 제품 등록
		for(OrderItemDTO oit : ord.getOrders()) {
			oit.setOrderId(orderId);
			orderMapper.enrollOrderItem(oit);
		}
		
		
		/* 비용 포인트 변동 적용 */
		/* 비용 차감 & 변동 돈 Member 객체 적용 */
		int calMoney = member.getMoney();
		calMoney -= ord.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		/* 포인트 차감, 포인트 증가 & 변동 포인트(point) member객체 적용 */
		int calPoint = member.getPoint();
		calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint();
		member.setPoint(calPoint);
		
		/*변동 돈, 포인트 db적용 */
		orderMapper.deductMoney(member);
		
		/* 재고 변동 적용 */
		for(OrderItemDTO oit : ord.getOrders()) {
			
			/*변동 재고 값 구하기*/
			BookVO book = bookMapper.getGoodsInfo(oit.getBookId());
			book.setBookStock(book.getBookStock() - oit.getBookCount());
			
			/* 변동 값 DB 적용 */
			orderMapper.deductStock(book);
			
		}
		
		/* 장바구니 제거 */
		for(OrderItemDTO oit : ord.getOrders()) {
			
			CartDTO dto = new CartDTO();
			dto.setMemberId(ord.getMemberId());
			dto.setBookId(oit.getBookId());
			
			cartMapper.deleteOrderCart(dto);
		}
	}
	
	
	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO dto) {
		
		/* 주문, 주문상품 객체 */
		/* 회원 */
		MemberVO member = memberMapper.getMemberInfo(dto.getMemberId());
		
		/* 주문상품 */
		List<OrderItemDTO> ords = orderMapper.getOrderItemInfo(dto.getOrderId());
		for(OrderItemDTO ord : ords) {
			ord.initSaleTotal();
		}
		
		/* 주문 */
		OrderDTO orw = orderMapper.getOrder(dto.getOrderId());
		orw.setOrders(ords);
		orw.getOrderPriceInfo();
		
		/* 주문 상품 취소 DB */
		orderMapper.orderCancle(dto.getOrderId());
		
		/* money, 포인트 재고 변환*/
		/* money */
		int calMoney = member.getMoney();
		calMoney += orw.getOrderFinalSalePrice();
		member.setMoney(calMoney);
		
		/* 포인트 */
		int calPoint = member.getPoint();
		calPoint = calPoint + orw.getUsePoint() - orw.getOrderSavePoint();
		member.setPoint(calPoint);
		
		/* DB적용 */
		orderMapper.deductMoney(member);
		
		/*재고 복구*/
		for(OrderItemDTO ord : orw.getOrders()) {
			BookVO book = bookMapper.getGoodsInfo(ord.getBookId());
			book.setBookStock(book.getBookStock() + ord.getBookCount());
			orderMapper.deductStock(book);
		}
	}

}
