package br.com.quintinno.keterapi.entity;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(schema = "public", name = "tb_associado")
public class AssociadoEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo", nullable = false)
    private Long codigo;

    @NotNull(message = "O campo Tipo de Relacionamento é de preenchimento obrigatório")
    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "id_tipo_relacionamento", nullable = false)
    private TipoRelacionamentoEntity tipoRelacionamentoEntity;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "id_pessoa_associado_principal", nullable = false)
    private PessoaEntity pessoaAssociadoPrincipal;

    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinColumn(name = "id_pessoa_dependente")
    private PessoaEntity pessoaDependente;

    @NotNull(message = "A data inicial da associação é obrigatória")
    @Column(name = "data_inicial_vinculo_associacao", nullable = false)
    private LocalDate dataInicialAssociacao;

    @Column(name = "data_final_vinculo_associacao")
    private LocalDate dataFinalAssociacao;

    public AssociadoEntity() { }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public TipoRelacionamentoEntity getTipoRelacionamentoEntity() {
        return tipoRelacionamentoEntity;
    }

    public void setTipoRelacionamentoEntity(TipoRelacionamentoEntity tipoRelacionamentoEntity) {
        this.tipoRelacionamentoEntity = tipoRelacionamentoEntity;
    }

    public PessoaEntity getPessoaAssociadoPrincipal() {
        return pessoaAssociadoPrincipal;
    }

    public void setPessoaAssociadoPrincipal(PessoaEntity pessoaAssociadoPrincipal) {
        this.pessoaAssociadoPrincipal = pessoaAssociadoPrincipal;
    }

    public PessoaEntity getPessoaDependente() {
        return pessoaDependente;
    }

    public void setPessoaDependente(PessoaEntity pessoaDependente) {
        this.pessoaDependente = pessoaDependente;
    }

    public LocalDate getDataInicialAssociacao() {
        return dataInicialAssociacao;
    }

    public void setDataInicialAssociacao(LocalDate dataInicialAssociacao) {
        this.dataInicialAssociacao = dataInicialAssociacao;
    }

    public LocalDate getDataFinalAssociacao() {
        return dataFinalAssociacao;
    }

    public void setDataFinalAssociacao(LocalDate dataFinalAssociacao) {
        this.dataFinalAssociacao = dataFinalAssociacao;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((codigo == null) ? 0 : codigo.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        AssociadoEntity other = (AssociadoEntity) obj;
        if (codigo == null) {
            if (other.codigo != null)
                return false;
        } else if (!codigo.equals(other.codigo))
            return false;
        return true;
    }

}
