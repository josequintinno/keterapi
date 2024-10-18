package br.com.quintinno.keterapi.entity;

import java.io.Serializable;
import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "TB_ASSOCIADO_DEPENDENTE")
public class AssociadoDependenteEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CODIGO", nullable = true)
	private Long codigo;
	
	@OneToOne
    @JoinColumn(name = "id_associado_principal", nullable = false)
	private AssociadoEntity associadoPrincipalEntity;
	
	@ManyToOne
    @JoinColumn(name = "id_associado_dependente", nullable = false)
	private AssociadoEntity associadoDependenteEntity;
	
	@Column(name = "DATA_INCLUSAO", nullable = true)
	private LocalDate dataInclusao;
	
	@Column(name = "DATA_ALTERACAO")
	private LocalDate dataAlteracao;
	
	@Column(name = "USUARIO_ALTERACAO")
	private UsuarioEntity usuarioAlteracao;
	
	public AssociadoDependenteEntity() { }

	public Long getCodigo() {
		return codigo;
	}

	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}

	public AssociadoEntity getAssociadoPrincipalEntity() {
		return associadoPrincipalEntity;
	}

	public void setAssociadoPrincipalEntity(AssociadoEntity associadoPrincipalEntity) {
		this.associadoPrincipalEntity = associadoPrincipalEntity;
	}

	public AssociadoEntity getAssociadoDependenteEntity() {
		return associadoDependenteEntity;
	}

	public void setAssociadoDependenteEntity(AssociadoEntity associadoDependenteEntity) {
		this.associadoDependenteEntity = associadoDependenteEntity;
	}

	public LocalDate getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(LocalDate dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public LocalDate getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(LocalDate dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public UsuarioEntity getUsuarioAlteracao() {
		return usuarioAlteracao;
	}

	public void setUsuarioAlteracao(UsuarioEntity usuarioAlteracao) {
		this.usuarioAlteracao = usuarioAlteracao;
	}

}
