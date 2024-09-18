package br.com.quintinno.keterapi.service;

import br.com.quintinno.keterapi.converter.PessoaConverter;
import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.repository.PessoaImplementRepository;
import br.com.quintinno.keterapi.repository.PessoaRepository;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PessoaService {

    public final PessoaRepository pessoaRepository;

    public PessoaImplementRepository pessoaImplementRepository;

    public PessoaService(PessoaRepository pessoaRepository, PessoaImplementRepository pessoaImplementRepository) {
        this.pessoaRepository = pessoaRepository;
        this.pessoaImplementRepository = pessoaImplementRepository;
    }

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

    public String delete(Long codigo) {
        Optional<PessoaEntity> pessoaEntityOptional = this.pessoaRepository.findById(codigo);
        PessoaEntity pessoaEntity = pessoaEntityOptional.get();
            pessoaEntity.setCodigo(codigo);
        if (pessoaEntityOptional.isPresent()) {
            this.pessoaRepository.delete(pessoaEntity);
        }
        return String.format("A pessoa \"%s\" foi excluida com sucesso!", pessoaEntity.getNomeCompleto());
    }

    public String desativar(Long codigo) {
        Optional<PessoaEntity> pessoaEntityOptional = this.pessoaRepository.findById(codigo);
        PessoaEntity pessoaEntity = pessoaEntityOptional.get();
            pessoaEntity.setCodigo(codigo);
            pessoaEntity.seteAtivo(false);
        if (pessoaEntityOptional.isPresent()) {
            this.pessoaRepository.save(pessoaEntity);
        }
        return String.format("A pessoa \"%s\" foi desativada com sucesso!", pessoaEntity.getNomeCompleto());
    }

    public List<PessoaResponseTransfer> findAllFilter(String nome) {
        List<PessoaEntity> pessoaEntityList = this.pessoaImplementRepository.recuperarPessoaFiltroTransfer(nome);
        return pessoaEntityList.stream()
                .map(PessoaConverter::converterPessoaEntityToPessoaFilterTransfer)
                .collect(Collectors.toList());
    }

}
