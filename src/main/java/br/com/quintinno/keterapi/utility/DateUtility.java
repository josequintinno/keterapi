package br.com.quintinno.keterapi.utility;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateUtility {

    public static final String FORMATO_DATA_DD_MM_YYYY = "dd/MM/yyyy";

    public static String formatarData(LocalDate data, String formato) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(formato);
        return data.format(dateTimeFormatter);
    }

}
