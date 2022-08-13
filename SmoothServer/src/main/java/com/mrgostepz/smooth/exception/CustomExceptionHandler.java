package com.mrgostepz.smooth.exception;

import com.mrgostepz.smooth.model.response.ErrorResponse;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class CustomExceptionHandler extends ResponseEntityExceptionHandler
{
    @ExceptionHandler(Exception.class)
    public final ResponseEntity<Object> handleAllExceptions(Exception ex, WebRequest request) {
        String detail = ex.getLocalizedMessage();
        ErrorResponse error = new ErrorResponse(0,"Something wrong in service", detail);
        return new ResponseEntity(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(DataAccessException.class)
    public final ResponseEntity<Object> handleDataAccessExceptions(Exception ex, WebRequest request) {
        String detail = ex.getLocalizedMessage();
        ErrorResponse error = new ErrorResponse(0,"Data cannot access", detail);
        return new ResponseEntity(error, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(RecordNotFoundException.class)
    public final ResponseEntity<Object> handleRecordNotFoundException(RecordNotFoundException ex, WebRequest request) {
        String detail = ex.getLocalizedMessage();
        ErrorResponse error = new ErrorResponse(0,"Record Not Found", detail);
        return new ResponseEntity(error, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(InsertRecordException.class)
    public final ResponseEntity<Object> handleInsertErrorException(InsertRecordException ex, WebRequest request) {
        String detail = ex.getLocalizedMessage();
        ErrorResponse error = new ErrorResponse(0,"Something wrong in service.", detail);
        return new ResponseEntity(error, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(SmoothException.class)
    public final ResponseEntity<Object> handleSmoothException(RecordNotFoundException ex, WebRequest request) {
        String detail = ex.getLocalizedMessage();
        ErrorResponse error = new ErrorResponse(0,"Something wrong in service.", detail);
        return new ResponseEntity(error, HttpStatus.NOT_FOUND);
    }
}
