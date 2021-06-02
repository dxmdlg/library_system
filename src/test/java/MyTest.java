import org.junit.Test;

import java.util.Date;

public class MyTest {
    @Test
    public void test01(){
        Date date = new Date();
        System.out.println(date);
        long time = date.getTime();
        System.out.println(time);
        long a = date.getTime()+1000l*60l*60l*24l*30l;
        Date date1 = new Date(a);
        if (date1==null){

        }
        System.out.println();
    }

    @Test
    public void test02(){
        String a ="";
        if (!"".equals(a)){
            System.out.println("a等于空");
        }else {
            System.out.println("a不等于空");
        }
     }
}
