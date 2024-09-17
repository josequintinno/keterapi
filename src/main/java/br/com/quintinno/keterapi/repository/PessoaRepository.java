package br.com.quintinno.keterapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.quintinno.keterapi.entity.PessoaEntity;

@Repository
public interface PessoaRepository extends JpaRepository<PessoaEntity, Long> { }
