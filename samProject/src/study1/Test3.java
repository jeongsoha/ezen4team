package study1;

public class Test3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int age1= 10;
		System.out.println(age1);//10
		
		age1=10+1;
		System.out.println(age1);//11
		
		age1=age1+1;
		System.out.println(age1);//12
		
		age1=age1+1;
		System.out.println(age1);//13
		
		int mymoney = 1000;
		
		mymoney = mymoney +100;
		System.out.println("내 돈 현황 : " + mymoney);//1100
		
		mymoney = mymoney +50;
		System.out.println("내 돈 현황 : " + mymoney);//1150
		
		mymoney = mymoney -30;
		System.out.println("내 돈 현황 : " + mymoney);//1120
		System.out.println("------------------");
		
		int Tomsmoney =100;
		int day1 = 20;
		Tomsmoney=Tomsmoney+day1;//Tomsmoney += day1;//120
		
		int day2 = 30;
		Tomsmoney=Tomsmoney+day2;// Tomsmoney += day2;//150
		
		int day3 = -10;
		Tomsmoney=Tomsmoney+day3;//140
		
		System.out.println("Tom의 총금액은 " + Tomsmoney + "만원입니다.");
		System.out.println("평균수입은 " + (day1+day2+day3)/3 + "만원입니다.");
		
		int number = 20;
		number += 1;
		System.out.println(number);
		
		number += 5;
		System.out.println(number);
		
		number -= 4;
		System.out.println(number);
		
		number *= 2;
		System.out.println(number);
		
	}

}








