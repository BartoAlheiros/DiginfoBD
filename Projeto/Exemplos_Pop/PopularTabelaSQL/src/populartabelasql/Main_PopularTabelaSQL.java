/**
 * @author Bart� Alheiros
 * Olinda, 15 de julho de 2017.
 * Programa que l� de um arquivo .csv e devolve c�digo para popular tabela SQL com os dados.
 */
package populartabelasql;

import java.io.*;

public class Main_PopularTabelaSQL{

	public static void main(String[] args) throws IOException {
            String linha;
            
            FileReader reader = new FileReader("C:\\Users\\Bart�\\Downloads\\data2.csv");
            BufferedReader leitor = new BufferedReader(reader);
            FileWriter writer = new FileWriter("C:\\Users\\Bart�\\Desktop\\data2_SQL.txt");
            BufferedWriter escritor = new BufferedWriter(writer);
            
            while((linha = leitor.readLine()) != null) {
                escritor.write("INSERT INTO unidade_de_suporte");
                escritor.newLine();
                escritor.write("VALUES("+linha+");");
                for(int i = 1; i < 3; i++)
                    escritor.newLine();         //pula duas linhas
            }    

            leitor.close(); /* Tinha esquecido dessa linha */
            escritor.close();
}

}