package br.com.quintinno.keterapi.transfer;

import java.time.LocalDate;

public class ExceptionTransfer {

    private String mensagem;

    private String data;

    private String situacao;

    public ExceptionTransfer() { }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

}
