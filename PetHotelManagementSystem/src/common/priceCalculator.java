package common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import phms.dto.SizeDto;
import phms.service.SizeService;

@Component
public class priceCalculator {

	@Autowired
	SizeService sizeService;

	public ArrayList<Object> getTotalPrice(String checkInDate, String checkOutDate, String rSNum) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		SizeDto sizeDto = sizeService.selectOneSize(Integer.parseInt(rSNum));
        DecimalFormat df = new DecimalFormat("#,##0");
        ArrayList<Object> totalPriceList = new ArrayList<Object>();
        int regularPrice = sizeDto.getsRPrice();
		int holidayPrice = sizeDto.getsWPrice();
		int totalRegularDay = 0;
		int totalHoliday = 0;
		int totalPrice = 0;
		int dayOfweek = 0;
		System.out.println(":::getTotalPrice");

		// 종료날짜 : -1 해주어야 마지막날은 계산하지 않는다
		String[] endDate = checkOutDate.split("-");
		cal.set(Integer.parseInt(endDate[0]), Integer.parseInt(endDate[1]) - 1, Integer.parseInt(endDate[2]));
		cal.add(Calendar.DATE, -1);
		checkOutDate = dateFormat.format(cal.getTime());

		// 시작날짜
		String[] startDate = checkInDate.split("-");
		cal.set(Integer.parseInt(startDate[0]), Integer.parseInt(startDate[1]) - 1, Integer.parseInt(startDate[2]));

		// 체크인 날짜와 체크아웃의 날짜가 같다면 1박2일이다
		if (checkInDate.equals(checkOutDate)) {
			dayOfweek = cal.get(Calendar.DAY_OF_WEEK);

			if (dayOfweek == 1 || dayOfweek == 6 || dayOfweek == 7) {
				totalHoliday++;
			} else {
				totalRegularDay++;
			}
		}

		// 체크인 날짜와 체크아웃 날짜가 같지 않다면 그 사이의 날짜들의 요일과 일수를 구한다
		while (!checkInDate.equals(checkOutDate)) {
			checkInDate = dateFormat.format(cal.getTime());
			dayOfweek = cal.get(Calendar.DAY_OF_WEEK);

			if (dayOfweek == 1 || dayOfweek == 6 || dayOfweek == 7) {
				totalHoliday++;
			} else {
				totalRegularDay++;
			}

			cal.add(Calendar.DATE, 1);
		}


		regularPrice *= totalRegularDay;
		holidayPrice *= totalHoliday;
		totalPrice = regularPrice + holidayPrice;
		totalPriceList.add(totalPrice);
		totalPriceList.add(df.format(totalPrice));		
		
		return totalPriceList;
	}

}
