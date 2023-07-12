package BookShop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
//@EnableWebSecurity = @EnableWebMVCSecurity + Extra features
@EnableWebSecurity
@Order(2)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
////        // Users in memory.
//        auth.inMemoryAuthentication()
//            .withUser("user1").password("12345").roles("USER")
//            .and()
//            .withUser("admin1").password("12345").roles("USER", "ADMIN");
////
//        // For User in database.
        auth.userDetailsService(userDetailsService);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();

        // The pages do not require login
        http.authorizeRequests()
        .antMatchers("/", "/home", "/login", "/logout", "/dang-nhap").permitAll();

//
//        // /userInfo page requires login as USER or ADMIN.
//        // If no login, it will redirect to /login page.
//        http.authorizeRequests()
//            .antMatchers("/userInfo").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
//
//        // For ADMIN only.
//        http.authorizeRequests().antMatchers("/admin").access("hasRole('ROLE_ADMIN')");
//
//        // When the user has logged in as XX.
//        // But access a page that requires role YY,
//        // AccessDeniedException will throw.
//        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//
//        // Config for Login Form
//        http.authorizeRequests().and().formLogin()
//            // Submit URL of login page.
//            .loginProcessingUrl("/j_spring_security_check") // Submit URL
//            .loginPage("/login")
//            .defaultSuccessUrl("/userInfo")
//            .failureUrl("/login?error=true")
//            .usernameParameter("username")
//            .passwordParameter("password")
//            // Config for Logout Page
//            .and().logout().logoutUrl("/logout").logoutSuccessUrl("/logoutSuccessful");
    }
}
