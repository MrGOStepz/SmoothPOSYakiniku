package com.mrgostepz.smooth.until;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class SmoothUtil {
    public static <T> Object convertJsonToObject(String json, T className) {
        try {
            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(json, className.getClass());
        } catch (Exception ex) {
            return null;
        }
    }
}
