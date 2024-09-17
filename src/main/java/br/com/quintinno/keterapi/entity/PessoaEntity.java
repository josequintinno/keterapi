package br.com.quintinno.keterapi.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(schema = "public", name = "tb_pessoa")
public class PessoaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo", nullable = false)
    private Long codigo;

    @Column(name = "nome_completo", length = 200, nullable = false)
    private String nomeCompleto;

    @Column(name = "nome_transcrito", length = 200, unique = true, nullable = false)
    private String nomeTrascrito;

    @Column(name = "data_nascimento")
    private LocalDate dataNascimento;

    @Column(name = "e_ativo", nullable = false)
    private Boolean eAtivo;

    public PessoaEntity() {
        this.eAtivo = true;
    }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getNomeTrascrito() {
        return nomeTrascrito;
    }

    public void setNomeTrascrito(String nomeTrascrito) {
        this.nomeTrascrito = nomeTrascrito;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public Boolean geteAtivo() {
        return eAtivo;
    }

    public void seteAtivo(Boolean eAtivo) {
        this.eAtivo = eAtivo;
    }

}
