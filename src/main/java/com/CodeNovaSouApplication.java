package com;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.cloudinary.Cloudinary;

@SpringBootApplication
public class CodeNovaSouApplication {

	public static void main(String[] args) {
		SpringApplication.run(CodeNovaSouApplication.class, args);
	}
	
	@Bean
    public Cloudinary cloudinary() {
        Map<String, String> config = new HashMap<>();
        config.put("cloud_name", "dpx7arspb");
        config.put("api_key", "134976953775838");
        config.put("api_secret", "cjG5WZByZ_kbFKUqw9Is1ehasa4");
        return new Cloudinary(config);
    }
}
