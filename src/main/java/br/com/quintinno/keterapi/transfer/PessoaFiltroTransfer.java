package br.com.quintinno.keterapi.transfer;

public class PessoaFiltroTransfer {

    private Long codigo;

    private String nome;

    private Boolean isAtivo;

    public PessoaFiltroTransfer() { }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Boolean getIsAtivo() {
        return isAtivo;
    }

    public void setIsAtivo(Boolean isAtivo) {
        this.isAtivo = isAtivo;
    }

}
