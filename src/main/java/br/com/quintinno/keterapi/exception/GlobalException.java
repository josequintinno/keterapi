package br.com.quintinno.keterapi.exception;

import java.time.LocalDate;
import java.util.NoSuchElementException;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import br.com.quintinno.keterapi.transfer.ExceptionTransfer;
import br.com.quintinno.keterapi.utility.DateUtility;

@ControllerAdvice
public class GlobalException {

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<Object> dataIntegrityViolationException(DataIntegrityViolationException dataIntegrityViolationException) {
        return new ResponseEntity<>(exceptionTransfer("O nome informado já foi cadastrado!", HttpStatus.BAD_REQUEST.getReasonPhrase()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ResponseEntity<Object> httpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException httpMediaTypeNotSupportedException) {
        return new ResponseEntity<>(exceptionTransfer("Os dados passados na requisicao nao sao validos!", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase()), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public ResponseEntity<Object> httpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException httpRequestMethodNotSupportedException) {
        return new ResponseEntity<>(exceptionTransfer("Os dados passados na requisicao nao sao validos!", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase()), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(NoResourceFoundException.class)
    public ResponseEntity<Object> noResourceFoundException(NoResourceFoundException noResourceFoundException) {
        return new ResponseEntity<>(exceptionTransfer("Os dados passados na requisicao nao sao validos!", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase()), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(NoSuchElementException.class)
    public ResponseEntity<Object> noSuchElementException(NoSuchElementException noSuchElementException) {
        return new ResponseEntity<>(exceptionTransfer("Os dados passados na requisicao nao sao validos!", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase()), HttpStatus.INTERNAL_SERVER_ERROR);
    }

    private ExceptionTransfer exceptionTransfer(String mensagem, String situacao) {
        ExceptionTransfer exceptionTransfer = new ExceptionTransfer();
            exceptionTransfer.setData(DateUtility.formatarData(LocalDate.now(), DateUtility.FORMATO_DATA_DD_MM_YYYY));
            exceptionTransfer.setMensagem(mensagem);
            exceptionTransfer.setSituacao(situacao);
        return exceptionTransfer;
    }

}
