package br.com.quintinno.keterapi.transfer;

public class PessoaResponseTransfer {

    private Long codigo;

    private String nome;

    private String situacao;

    public PessoaResponseTransfer() { }

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

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

}
