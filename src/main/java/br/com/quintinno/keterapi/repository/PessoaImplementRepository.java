package br.com.quintinno.keterapi.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.transfer.PessoaFiltroTransfer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class PessoaImplementRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<PessoaFiltroTransfer> recuperarPessoaFiltroTransfer(String nome) {
        return new ArrayList<>();
    }

}
