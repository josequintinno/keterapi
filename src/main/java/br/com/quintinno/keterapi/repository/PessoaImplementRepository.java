package br.com.quintinno.keterapi.repository;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.transfer.PessoaFiltroTransfer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Repository
public class PessoaImplementRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public List<PessoaEntity> recuperarPessoaFiltroTransfer(String nome) {
        StringBuilder stringBuilder = new StringBuilder("SELECT pessoa ")
            .append("FROM PessoaEntity pessoa ")
            .append("WHERE pessoa.nomeCompleto LIKE UPPER(:nomeParameter) ");
        TypedQuery<PessoaEntity> pessoaEntityTypedQuery = this.entityManager.createQuery(stringBuilder.toString(), PessoaEntity.class);
            pessoaEntityTypedQuery.setParameter("nomeParameter", "%" + nome + "%");
        return pessoaEntityTypedQuery.getResultList();
    }

}
