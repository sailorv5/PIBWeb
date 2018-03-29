package com.isfce.pidw.data;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.isfce.pidw.config.security.Roles;
import com.isfce.pidw.model.Etudiant;
import com.isfce.pidw.model.Users;

@Repository
public interface IUsersJpaDAO<T extends Users> extends JpaRepository<T , String> {

	@Query(value = "select ROLE from TUSERS  where USERNAME= ?1", nativeQuery = true)
	Roles getUserNameRole(String username);
	
	@Query(value="select username, nom from TPROFESSEUR order by nom ASC", nativeQuery=true)
	List<Object[]> getProfCodeNomList();	
	
	@Query(value="select username, nom from TETUDIANT order by nom ASC", nativeQuery=true)
	List<Object[]> getEtudiantCodeNomList();	
	
}
