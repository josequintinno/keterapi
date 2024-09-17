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
import org.springframework.web.bind.annotation.RestController;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.service.PessoaService;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;

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

}
