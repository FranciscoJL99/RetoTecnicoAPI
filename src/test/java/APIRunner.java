import com.intuit.karate.junit5.Karate;

public class APIRunner {

    public static void main(String[] args) {
        Karate.run("classpath:com/tuempresa/tuProyecto").relativeTo(APIRunner.class);
    }
}