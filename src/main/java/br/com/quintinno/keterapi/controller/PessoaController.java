package br.com.quintinno.keterapi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.service.PessoaService;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/v1/pessoa")
public class PessoaController {

    @Autowired
    private PessoaService pessoaService;

    @PostMapping
    public PessoaEntity create(@RequestBody PessoaEntity pessoaEntity) {
        return this.pessoaService.create(pessoaEntity);
    }

    @GetMapping
    public List<PessoaResponseTransfer> findAll() {
        return this.pessoaService.findAll();
    }

    @GetMapping("/filter")
    public List<PessoaResponseTransfer> findAllFilter(@RequestParam(required = false) String nome) {
        return this.pessoaService.findAllFilter(nome);
    }

    @PutMapping("{codigo}")
    public PessoaEntity update(@RequestBody PessoaEntity pessoaEntity, @PathVariable Long codigo) {
        pessoaEntity.setCodigo(codigo);
        return this.pessoaService.update(pessoaEntity);
    }

    @DeleteMapping("{codigo}")
    public String delete(@PathVariable Long codigo) {
        return this.pessoaService.delete(codigo);
    }

    @PostMapping("{codigo}")
    public String desativar(@PathVariable Long codigo) {
        return this.pessoaService.desativar(codigo);
    }

    @GetMapping("/info")
    public Map<String, String> info() {
        Map<String, String> info = new HashMap<>();
            info.put("nomeCompleto", "");
            info.put("nomeTrascrito", "");
            info.put("dataNascimento", "");
            info.put("eAtivo", "true");
        return info;
    }

    @GetMapping("/info/")
    public Map<String, String> endpoint(HttpServletRequest httpServletRequest) {
        Map<String, String> info = new HashMap<>();
            info.put("GET_1", String.format("http://%s/api/v1/pessoa/info", this.recuperarEnderecoAPI(httpServletRequest)));
            info.put("GET_2", "http://" + this.recuperarEnderecoAPI(httpServletRequest) + "/api/v1/pessoa/info/endpoint");
            info.put("GET_3", "http://" + this.recuperarEnderecoAPI(httpServletRequest) + "/api/v1/pessoa/filter?nome=<NOME>");
            info.put("GET_4", "http://" + this.recuperarEnderecoAPI(httpServletRequest) + "/api/v1/pessoa?eAtivo=<ATIVO>");
            info.put("GET_5", "http://" + this.recuperarEnderecoAPI(httpServletRequest) + "/api/v1/pessoa?nome=<NOME>&eAtivo=<ATIVO>");
        return info;
    }

    private String recuperarEnderecoAPI(HttpServletRequest httpServletRequest) {
        Integer NUMERO_PORTA = httpServletRequest.getServerPort();
        String NUMERO_IP_LOCAL = "0:0:0:0:0:0:0:1";
        String NUMERO_IP = httpServletRequest.getRemoteAddr();
        StringBuilder url = new StringBuilder();
        if (NUMERO_IP_LOCAL.equals(NUMERO_IP)) {
            url.append("127.0.0.1").append(":").append(NUMERO_PORTA.toString());
        }
        return url.toString();
    }

}
