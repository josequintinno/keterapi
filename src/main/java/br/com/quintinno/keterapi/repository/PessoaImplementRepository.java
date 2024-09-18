package br.com.quintinno.keterapi.repository;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

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
