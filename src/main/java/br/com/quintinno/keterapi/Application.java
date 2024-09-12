package br.com.quintinno.keterapi;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

	private static final String SISTEMA = "Sistema Gerenciador de Associados";
	private static final String VERSAO = "v1.0.0";

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@GetMapping("/")
	public String api() {
		return String.format("[KETERAPI%s] - %s (%s) ", 
        this.gerarNumeroChamado(), 
        SISTEMA, 
        VERSAO);
	}

	private String gerarNumeroChamado() {
		LocalDateTime localDateTime = LocalDateTime.now();
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
		return localDateTime.format(dateTimeFormatter);
	}

}
