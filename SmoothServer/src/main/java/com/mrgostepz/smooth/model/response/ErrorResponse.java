package com.mrgostepz.smooth.model.response;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ErrorResponse {

    public ErrorResponse(int errorId, String message, String detail) {
        this.errorId = errorId;
        this.message = message;
        this.detail = detail;
    }

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private int errorId;
    private String message;
    private String detail;

    public int getErrorId() {
        return errorId;
    }

    public void setErrorId(int errorId) {
        this.errorId = errorId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

}
