package br.com.quintinno.keterapi.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.repository.PessoaRepository;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;

@Service
public class PessoaService {

    @Autowired
    public PessoaRepository pessoaRepository;

    public PessoaEntity create(PessoaEntity pessoaEntity) {
        return this.pessoaRepository.save(pessoaEntity);
    }

    public List<PessoaResponseTransfer> findAll() {
        List<PessoaResponseTransfer> pessoaResponseTransferList = new ArrayList<>();
        List<PessoaEntity> pessoaEntityList = this.pessoaRepository.findAll();
        pessoaEntityList.forEach(pessoaEntity -> {
            pessoaResponseTransferList.add(PessoaEntity.convertEntityTransfer(pessoaEntity));
        });
        return pessoaResponseTransferList;
    }

    public PessoaEntity update(PessoaEntity pessoaEntity) {
        Optional<PessoaEntity> pessoaEntityOptional = this.pessoaRepository.findById(pessoaEntity.getCodigo());
        PessoaEntity pessoaEntityCadastro = new PessoaEntity();
        if (pessoaEntityOptional.isPresent()) {
            pessoaEntityCadastro.setCodigo(pessoaEntity.getCodigo());
            pessoaEntityCadastro.setNomeCompleto(pessoaEntity.getNomeCompleto());
            pessoaEntityCadastro.setDataNascimento(pessoaEntity.getDataNascimento());
            pessoaEntityCadastro.setNomeTrascrito(pessoaEntity.getNomeTrascrito());
            pessoaEntityCadastro.seteAtivo(pessoaEntity.geteAtivo());
            return this.pessoaRepository.save(pessoaEntityCadastro);
        }
        return pessoaEntityCadastro;
    }

}
