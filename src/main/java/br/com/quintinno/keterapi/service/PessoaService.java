package br.com.quintinno.keterapi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.repository.PessoaRepository;

@Service
public class PessoaService {

    @Autowired
    public PessoaRepository pessoaRepository;

    public PessoaEntity create(PessoaEntity pessoaEntity) {
        return this.pessoaRepository.save(pessoaEntity);
    }

    public List<PessoaEntity> findAll() {
        return this.pessoaRepository.findAll();
    }

}
