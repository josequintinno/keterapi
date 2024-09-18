package br.com.quintinno.keterapi.controller;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.service.PessoaService;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/info/endpoint")
    public Map<String, String> endpoint() {
        Map<String, String> info = new HashMap<>();
            info.put("GET_1", "http://<IP>/api/v1/pessoa/info");
            info.put("GET_2", "http://<IP>/api/v1/pessoa/info/endpoint");
            info.put("GET_3", "http://<IP>/api/v1/pessoa?nome=<NOME>");
            info.put("GET_4", "http://<IP>/api/v1/pessoa?eAtivo=<ATIVO>");
            info.put("GET_5", "http://<IP>/api/v1/pessoa?nome=<NOME>&eAtivo=<ATIVO>");
        return info;
    }

}
