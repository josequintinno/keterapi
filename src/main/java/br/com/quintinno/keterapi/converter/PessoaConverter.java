package br.com.quintinno.keterapi.converter;

import br.com.quintinno.keterapi.entity.PessoaEntity;
import br.com.quintinno.keterapi.transfer.PessoaResponseTransfer;

public class PessoaConverter {

    public static PessoaResponseTransfer converterEntityForTranfer(PessoaEntity pessoaEntity) {
        PessoaResponseTransfer pessoaResponseTransfer = new PessoaResponseTransfer();
            pessoaResponseTransfer.setCodigo(pessoaEntity.getCodigo());
            pessoaResponseTransfer.setNome(pessoaEntity.getNomeCompleto());
            pessoaResponseTransfer.setSituacao(pessoaEntity.geteAtivo() ? "Ativo" : "Inativo");
        return null;
    }

}
