import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class FibonacciSequence {
	
	public static void main(String[] args) {
		
		//斐波那契数列计算
		List<BigInteger> fibonacci = new ArrayList<BigInteger>();
		fibonacci.add(new BigInteger("1"));
		fibonacci.add(new BigInteger("1"));
		for(int j=2;j<100;j++){
			//将前两项相加得到新一项
			BigInteger sum = fibonacci.get(j-1).add(fibonacci.get(j-2));
			fibonacci.add(sum);
		}
		
		//输出
		int t=1;//用于计数
		System.out.println("斐波那契数列：");
		for(BigInteger i:fibonacci){
			System.out.println("第"+t+"项："+i.toString());
			t++;
		}
	}

}
