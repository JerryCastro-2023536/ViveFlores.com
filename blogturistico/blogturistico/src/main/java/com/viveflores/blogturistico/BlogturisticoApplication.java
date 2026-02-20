package com.viveflores.blogturistico;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BlogturisticoApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(BlogturisticoApplication.class, args);
	}

    @Override
    public void run(String... args) throws Exception {
        // spring.datasource.username=IN5CM
        //spring.datasource.password=?donmoA5m@
        System.out.println("Test api");
    }
}
