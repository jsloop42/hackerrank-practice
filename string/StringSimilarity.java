import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

// Friday 23 August 2013

class StringSimilarity {

    private int n, caLen = 0, total = 0;
    private char[] ca;

    private void init() {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            String inp = "";
            inp = br.readLine();
            n = Integer.parseInt(inp);
            int i, j, k, len, sum, total;
            while((inp=br.readLine()) != null) {
                i = 0; j = 0; k = 1; len = 0; sum = 0; total = 0;   //reset
                ca = inp.toCharArray();
                caLen = ca.length;
                suffix();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void suffix() {
        String str = "";
        int i = 0, len = caLen, total = len;
        for (i = 1; i < len; i++) {
            total = total + compute(i);
        }
        System.out.println(total);
    }

    private int compute(int k) {
        int len = caLen - k, i = 0, sum = 0;
        for (i = 0; i < len; i++) {
            if (ca[k] == ca[i]) {
                sum = sum + 1;
                k = k + 1;
            }
            else break;
        }
        return sum;
    }

    public static void main(String[] args) {
        StringSimilarity ss = new StringSimilarity();
        ss.init();
    }
}
