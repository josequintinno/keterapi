package br.com.quintinno.keterapi.service;

import java.util.ArrayList;
import java.util.List;

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

}
