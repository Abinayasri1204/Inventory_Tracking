package com.example.InventoryStock.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.InventoryStock.Model.InventoryModel;

public interface InventoryRepository extends JpaRepository<InventoryModel, Integer> {
	
}
