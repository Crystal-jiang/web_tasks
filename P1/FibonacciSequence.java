import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

public class FibonacciSequence {
	
	public static void main(String[] args) {
		
		//쳲��������м���
		List<BigInteger> fibonacci = new ArrayList<BigInteger>();
		fibonacci.add(new BigInteger("1"));
		fibonacci.add(new BigInteger("1"));
		for(int j=2;j<100;j++){
			//��ǰ������ӵõ���һ��
			BigInteger sum = fibonacci.get(j-1).add(fibonacci.get(j-2));
			fibonacci.add(sum);
		}
		
		//���
		int t=1;//���ڼ���
		System.out.println("쳲��������У�");
		for(BigInteger i:fibonacci){
			System.out.println("��"+t+"�"+i.toString());
			t++;
		}
	}

}
