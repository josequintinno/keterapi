package br.com.quintinno.keterapi.utility;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateUtility {

    public static final String FORMATO_DATA_DD_MM_YYYY = "dd/MM/yyyy HH:mm:ss";

    public static String retornaDataAtualFormatada(String formato) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(formato);
        return LocalDateTime.now().format(dateTimeFormatter);
    }

}
