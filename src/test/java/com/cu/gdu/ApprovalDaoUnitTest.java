package com.cu.gdu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cu.gdu.dao.ApprovalDao;
import com.cu.gdu.dto.ApprovalFormDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
								 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ApprovalDaoUnitTest {
	
	@Autowired
	private ApprovalDao approvalDao;
	
	@Ignore
	public void test01_카테고리조회테스트() {
		// given
		
		// when
		List<String> appCategories = approvalDao.selectAppCategory();
		//then
		assertNotNull(appCategories);
	}
	
	@Ignore
	public void test02_카테고리등록테스트() {
		// given
		ApprovalFormDto appForm = ApprovalFormDto.builder().appFormName("결의서")
														   .appForm("내용")
														   .appCategory("인사")
														   .build();
		// when
		int result = approvalDao.insertAppForm(appForm);
		//then
		assertEquals(1, result);
	}

}
